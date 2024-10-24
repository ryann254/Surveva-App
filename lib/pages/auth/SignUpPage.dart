import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:surveva_app/pages/auth/LoginPage.dart';
import 'package:surveva_app/pages/auth/PersonalizationPage.dart';
import 'package:surveva_app/utils/inputValidationUtils.dart';
import 'package:surveva_app/widgets/authWidgets.dart';
import 'package:surveva_app/providers/signUpProvider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpProvider _signUpProvider;
  String gender = '';
  String dob = '';
  bool _privacyPolicyAndTerms = false;
  bool _promotionalEmails = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool isSignUpButtonEnabled = false;
  String nameErrorMessage = '';
  String dobErrorMessage = '';
  String emailErrorMessage = '';
  String passwordErrorMessage = '';
  String confirmPasswordErrorMessage = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    gender = 'Male';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
      _signUpProvider.setGender(gender);
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
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
    _signUpProvider.setGender(newGender);
  }

  isDob(String newDob) {
    setState(() {
      dob = newDob;
    });
    _signUpProvider.setDob(dob);
  }

  void updateNameState(String name) {
    setState(() {
      nameErrorMessage = isNameValid(name) ? '' : 'Name must be at least 3 characters long';
      isSignUpButtonEnabled = isNameValid(name) && isDobValid(dob) && isEmailValid(emailController.text) && isPasswordValid(passwordController.text) && isConfirmPasswordValid(confirmPasswordController.text, passwordController.text) && _privacyPolicyAndTerms;
    });
    _signUpProvider.setName(name);
  }

  void updateDobState(String dob) {
    setState(() {
      dobErrorMessage = isDobValid(dob) ? '' : 'Date of Birth is invalid';
      isSignUpButtonEnabled = isDobValid(dob) && isNameValid(nameController.text) && isEmailValid(emailController.text) && isPasswordValid(passwordController.text) && isConfirmPasswordValid(confirmPasswordController.text, passwordController.text) && _privacyPolicyAndTerms;
    });
  }

  void updateEmailState(String email) {
    setState(() {
      emailErrorMessage = getEmailErrorMessage(email);
      isSignUpButtonEnabled = isEmailValid(email) && isDobValid(dob) && isNameValid(nameController.text) && isPasswordValid(passwordController.text) && isConfirmPasswordValid(confirmPasswordController.text, passwordController.text) && _privacyPolicyAndTerms;
    });
    _signUpProvider.setEmail(email);
  }

  void updatePasswordState(String password) {
    setState(() {
      passwordErrorMessage = getPasswordErrorMessage(password);
      isSignUpButtonEnabled = isPasswordValid(password) && isDobValid(dob) && isNameValid(nameController.text) && isEmailValid(emailController.text) && isConfirmPasswordValid(confirmPasswordController.text, password) && _privacyPolicyAndTerms;
    });
    _signUpProvider.setPassword(password);
  }

  void updateConfirmPasswordState(String confirmPassword) {
    setState(() {
      confirmPasswordErrorMessage = isConfirmPasswordValid(confirmPassword, passwordController.text) ? '' : 'Passwords do not match';
      isSignUpButtonEnabled = isConfirmPasswordValid(confirmPassword, passwordController.text) && isPasswordValid(passwordController.text) && isDobValid(dob) && isNameValid(nameController.text) && isEmailValid(emailController.text) && _privacyPolicyAndTerms;
    });
  }

  Future<void> storeUserDetails() async {
    // Dismiss the keyboard
    FocusScope.of(context).unfocus();
    setState(() {
      emailErrorMessage = '';
      passwordErrorMessage = '';
      confirmPasswordErrorMessage = '';
      isSignUpButtonEnabled = false;
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => const PersonalizationPage()));
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
                    nameWidget(context, 'Name', nameController, updateNameState, nameErrorMessage, isNameValid(nameController.text)),
                    const SizedBox(height: 15),
                    dobWidget(context, isDob, dob, dobErrorMessage, isDobValid(dob)),
                    const SizedBox(height: 15),
                    emailWidget(
                        context: context,
                        emailController: emailController,
                        errorText: emailErrorMessage,
                        onChanged: updateEmailState,
                        isSuccess: isEmailValid(emailController.text)),
                    const SizedBox(height: 15),
                    passwordWidget(
                        obscurePassword,
                        isObscurePassword,
                        context,
                        passwordController,
                        passwordErrorMessage,
                        updatePasswordState, isPasswordValid(passwordController.text)),
                    const SizedBox(height: 15),
                    confirmPasswordWidget(obscureConfirmPassword,
                        isObscureConfirmPassword, context, confirmPasswordController, updateConfirmPasswordState, confirmPasswordErrorMessage, isConfirmPasswordValid(confirmPasswordController.text, passwordController.text)),
                    const SizedBox(height: 15),
                    genderWidget(gender, isGender, context, false),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Consumer<SignUpProvider>(
                          builder: (context, signUpProvider, child) {
                            return Checkbox(
                              value: signUpProvider.privacyPolicyAndTerms,
                              onChanged: (value) {
                                setState(() {
                                  _privacyPolicyAndTerms = value!;
                                  isSignUpButtonEnabled = isNameValid(nameController.text) && isDobValid(dob) && isEmailValid(emailController.text) && isPasswordValid(passwordController.text) && isConfirmPasswordValid(confirmPasswordController.text, passwordController.text) && _privacyPolicyAndTerms;
                                });
                                signUpProvider.setPrivacyPolicyAndTerms(value!);
                              },
                            );
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      Theme.of(context).colorScheme.onSurface),
                              children: [
                                const TextSpan(text: 'I accept the '),
                                TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                const TextSpan(text: ' and '),
                                TextSpan(
                                  text: 'Terms',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
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
                        Consumer<SignUpProvider>(
                          builder: (context, signUpProvider, child) {
                            return Checkbox(
                              value: signUpProvider.promotionalEmails,
                              onChanged: (value) {
                                setState(() {
                                  _promotionalEmails = value!;
                                });
                                signUpProvider.setPromotionalEmails(value!);
                              },
                            );
                          },
                        ),
                        const Expanded(
                            child: Text(
                          'I agree to receive informational and promotional materials',
                          style: TextStyle(fontSize: 14),
                        ))
                      ],
                    ),
                    const SizedBox(height: 14),
                    GestureDetector(
                      onTap: isSignUpButtonEnabled ? storeUserDetails : null,
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: isSignUpButtonEnabled ? Theme.of(context).primaryColor : Theme.of(context).colorScheme.tertiary,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  color:
                                      isSignUpButtonEnabled ? Theme.of(context).colorScheme.onPrimary : Theme.of(context).colorScheme.onTertiary,
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
                        color: Theme.of(context).brightness == Brightness.light
                            ? const Color(0xffE9E7E1)
                            : const Color(0xff404446)),
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'or',
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
                              builder: (context) => const LoginPage()));
                    },
                    child: const Text(
                      'Log In',
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
    );
  }
}
