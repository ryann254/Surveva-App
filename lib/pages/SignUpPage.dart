import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String _gender = '';
  bool _privacyPolicyAndTerms = false;
  bool _promotionalEmails = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _gender = 'Male';
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
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          hintText: 'Name',
                          hintStyle: TextStyle(
                            color: const Color(0xff979C9E).withOpacity(0.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff979C9E).withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff090A0A)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          hintText: 'Date of Birth',
                          hintStyle: TextStyle(
                            color: const Color(0xff979C9E).withOpacity(0.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff979C9E).withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff090A0A)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          hintText: 'E-Mail',
                          hintStyle: TextStyle(
                            color: const Color(0xff979C9E).withOpacity(0.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff979C9E).withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff090A0A)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: const Color(0xff979C9E).withOpacity(0.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff979C9E).withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff090A0A)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          }, icon: _obscurePassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility))
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextField(
                        obscureText: _obscureConfirmPassword,
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.only(left: 16.0, right: 16.0),
                          hintText: 'Confirm Password',
                          hintStyle: TextStyle(
                            color: const Color(0xff979C9E).withOpacity(0.8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    const Color(0xff979C9E).withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff090A0A)),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          suffixIcon: IconButton(onPressed: () {
                            setState(() {
                              _obscureConfirmPassword = !_obscureConfirmPassword;
                            });
                          }, icon: _obscureConfirmPassword ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility))
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _gender = 'Male';
                              });
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: _gender == 'Male'
                                    ? const Color(0xff317C7D)
                                    : Colors.white,
                                border: _gender == 'Male'
                                    ? Border.all(color: const Color(0xff317C7D))
                                    : Border.all(
                                        color: const Color(0xff979C9E)
                                            .withOpacity(0.4)),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    bottomLeft: Radius.circular(24)),
                              ),
                              child: Center(
                                child: Text(
                                  'Male',
                                  style: TextStyle(
                                      color: _gender == 'Male'
                                          ? Colors.white
                                          : const Color(0xff979C9E)
                                              .withOpacity(0.8)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _gender = 'Female';
                              });
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: _gender == 'Female'
                                    ? const Color(0xff317C7D)
                                    : Colors.white,
                                border: _gender == 'Female'
                                    ? Border.all(color: const Color(0xff317C7D))
                                    : Border.all(
                                        color: const Color(0xff979C9E)
                                            .withOpacity(0.4)),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(24),
                                    bottomRight: Radius.circular(24)),
                              ),
                              child: Center(
                                child: Text(
                                  'Female',
                                  style: TextStyle(
                                      color: _gender == 'Female'
                                          ? Colors.white
                                          : const Color(0xff979C9E)
                                              .withOpacity(0.8)),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
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
                    Container(
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
                        ))
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
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(fontSize: 14, color: Color(0xff090A0A)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    'Log In',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        color: Color(0xff090A0A)),
                    textAlign: TextAlign.center,
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
