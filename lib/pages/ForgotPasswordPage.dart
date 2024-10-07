import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/AuthenticationCodePage.dart';
import 'package:surveva_app/pages/LoginPage.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isEmailValid = false;

  validateEmail() {
    setState(() {
      isEmailValid = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 10.0),
              child: SvgPicture.asset('assets/icons/arrow-left.svg'),
            ),
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 38.0),
                          SvgPicture.asset('assets/forgot password/lock.svg'),
                          const SizedBox(height: 48.0),
                          const Text(
                            'Having trouble signing in?',
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 10.0),
                          const SizedBox(
                              width: 300,
                              child: Text(
                                'Enter your email address and we\'ll send you a code to reset your account access.',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.center,
                              )),
                          const SizedBox(height: 36.0),
                          emailWidget(validateEmail: validateEmail, context: context),
                          const SizedBox(height: 18.0),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AuthenticationCodePage()));
                            },
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: isEmailValid
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.tertiary,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                  child: Text(
                                    'Continue',
                                    style: TextStyle(
                                        color: isEmailValid
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onPrimary
                                            : Theme.of(context)
                                                .colorScheme
                                                .onTertiary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )),
                          ),
                          const Expanded(
                              child:
                                  SizedBox()), // Replace Spacer with Expanded
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
                                              const LoginPage()));
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
              ),
            );
          },
        )));
  }
}
