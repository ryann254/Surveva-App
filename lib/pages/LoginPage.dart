import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/ForgotPasswordPage.dart';
import 'package:surveva_app/pages/HomePage.dart';
import 'package:surveva_app/pages/SignUpPage.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obscurePassword = true;

  isObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
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
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                    child: Column(
                      children: [
                        SvgPicture.asset('assets/launch page/surveva_logo_launchpage.svg',
                            width: 120, height: 30),
                        const SizedBox(height: 92),
                        const Text('Log In',
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center),
                        const SizedBox(height: 48),
                        emailWidget(),
                        const SizedBox(height: 15),
                        passwordWidget(obscurePassword, isObscurePassword),
                        const SizedBox(height: 18),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                          },
                          child: Container(
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff317C7D),
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: const Center(
                                child: Text(
                                  'Log In',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                        ),
                        const SizedBox(height: 18),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPasswordPage()));
                          },
                          child: const Text('Forgot Password?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(height: 48),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                  color: const Color(0xff979C9E).withOpacity(0.4)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          'or',
                          style: TextStyle(color: Color(0xff090A0A)),
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
                        const Expanded(child: SizedBox()), // Replace Spacer with Expanded
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have an account?',
                              style: TextStyle(fontSize: 14, color: Color(0xff090A0A)),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                    color: Color(0xff317C7D)),
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
