import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/LoginPage.dart';
import 'package:surveva_app/pages/PersonalizationPage.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String gender = '';
  String dob = '';
  bool _privacyPolicyAndTerms = false;
  bool _promotionalEmails = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    gender = 'Male';
  }

  isObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  isObscureConfirmPassword() {
    setState(() {
      obscureConfirmPassword = !obscureConfirmPassword;
    });
  }

  isGender(String newGender) {
    setState(() {
      gender = newGender;
    });
  }

  isDob(String newDob) {
    setState(() {
      dob = newDob;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Column(
                  children: [
                    const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 17),
                    nameWidget(),
                    const SizedBox(height: 15),
                    dobWidget(context, isDob, dob),
                    const SizedBox(height: 15),
                    emailWidget(),
                    const SizedBox(height: 15),
                    passwordWidget(obscurePassword, isObscurePassword),
                    const SizedBox(height: 15),
                    confirmPasswordWidget(obscureConfirmPassword, isObscureConfirmPassword),
                    const SizedBox(height: 15),
                    genderWidget(gender, isGender),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _privacyPolicyAndTerms,
                            onChanged: (value) {
                              setState(() {
                                _privacyPolicyAndTerms = value!;
                              });
                            }),
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff090A0A)),
                              children: [
                                TextSpan(text: 'I accept the '),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Color(0xff317C7D),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Terms',
                                  style: TextStyle(
                                    color: Color(0xff317C7D),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: _promotionalEmails,
                            onChanged: (value) {
                              setState(() {
                                _promotionalEmails = value!;
                              });
                            }),
                        const Expanded(
                            child: Text(
                          'I agree to receive informational and promotional materials',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xff090A0A)),
                        ))
                      ],
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalizationPage()));
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
                              'Continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  ],
                ),
              ),
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
              const SizedBox(height: 7),
              const Text(
                'or',
                style: TextStyle(color: const Color(0xff090A0A)),
              ),
              const SizedBox(height: 7),
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
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 14, color: Color(0xff090A0A)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      'Log In',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                          color: Color(0xff090A0A)),
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
    );
  }

}
