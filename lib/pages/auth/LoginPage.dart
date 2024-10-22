import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/functions/auth/login.dart';
import 'package:surveva_app/pages/auth/ForgotPasswordPage.dart';
import 'package:surveva_app/pages/auth/SignUpPage.dart';
import 'package:surveva_app/pages/discovery/DiscoveryPage.dart';
import 'package:surveva_app/utils/inputValidationUtils.dart';
import 'package:surveva_app/widgets/authWidgets.dart';
import 'package:surveva_app/models/error.model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginButtonEnabled = false;
  String emailErrorMessage = '';
  String passwordErrorMessage = '';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  isObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

    void updateEmailState(String email) {
    setState(() {
      emailErrorMessage = getEmailErrorMessage(email);
      isLoginButtonEnabled = isEmailValid(email) &&
          isPasswordValid(passwordController.text);
    });
  }

  void updatePasswordState(String password) {
    setState(() {
      passwordErrorMessage = getPasswordErrorMessage(password);
      isLoginButtonEnabled = isEmailValid(emailController.text) &&
          passwordErrorMessage.isEmpty;
    });
  }

  Future<void> sendLoginRequest() async {
    // Dismiss the keyboard
    FocusScope.of(context).unfocus();
    setState(() {
      emailErrorMessage = '';
      passwordErrorMessage = '';
      isLoginButtonEnabled = false;
    });

    try {
      await login(email: emailController.text, password: passwordController.text);
      emailController.clear();
      passwordController.clear();
      log('Logged in successfully');
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DiscoveryPage()));
    } catch (err) {
      Error errorInstance = err as Error;
      emailErrorMessage = errorInstance.message;
      passwordErrorMessage = errorInstance.message;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                            'assets/launch page/surveva_logo_launchpage.svg',
                            width: 120,
                            height: 30),
                        const SizedBox(height: 92),
                        const Text('Log In',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 48),
                        emailWidget(
                          context: context, 
                          emailController: emailController,
                          errorText: emailErrorMessage,
                          onChanged: updateEmailState,
                          isSuccess: isEmailValid(emailController.text),
                        ),
                        const SizedBox(height: 15),
                        passwordWidget(
                          obscurePassword,
                          isObscurePassword,
                          context,
                          passwordController,
                          passwordErrorMessage,
                          updatePasswordState,
                          isPasswordValid(passwordController.text),
                        ),
                        const SizedBox(height: 18),
                        GestureDetector(
                          onTap: isLoginButtonEnabled ? sendLoginRequest : null,
                          child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: isLoginButtonEnabled
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).colorScheme.tertiary,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: isLoginButtonEnabled
                                          ? Theme.of(context)
                                              .colorScheme
                                              .onPrimary
                                          : Theme.of(context).colorScheme.onTertiary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                        const SizedBox(height: 18),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage()));
                          },
                          child: const Text('Forgot Password?',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height: 48),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: Theme.of(context).brightness ==
                                          Brightness.light
                                      ? const Color(0xffE9E7E1)
                                      : const Color(0xff404446)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'or',
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/auth/google.svg'),
                            const SizedBox(width: 40),
                            SvgPicture.asset('assets/auth/twitter.svg'),
                            const SizedBox(width: 40),
                            SvgPicture.asset('assets/auth/facebook.svg'),
                          ],
                        ),
                        const Expanded(
                            child: SizedBox()), // Replace Spacer with Expanded
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const SignUpPage()));
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
