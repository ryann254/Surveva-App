import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/auth/LoginPage.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  String passwordErrorMessage = '';
  String confirmPasswordErrorMessage = '';
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 35.0),
              SvgPicture.asset('assets/forgot password/lock.svg'),
              const SizedBox(height: 48.0),
              const Text(
                'Enter your new password',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12.0),
              const SizedBox(
                width: 300,
                child: Text(
                  'Your new password must be different from previosly used password.',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 36.0),
              passwordWidget(obscurePassword, isObscurePassword, context, passwordController, passwordErrorMessage, (String password) => {}, false),
              const SizedBox(height: 18.0),
              confirmPasswordWidget(
                  obscureConfirmPassword, isObscureConfirmPassword, context, confirmPasswordController, (String confirmPassword) => {}, confirmPasswordErrorMessage, false),
              const SizedBox(height: 18.0),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ),
                            Dialog(
                              insetPadding: EdgeInsets.zero,
                              child: SizedBox(
                                height: 350,
                                width: 330,
                                child: passwordResetModal(context),
                              ),
                            ),
                          ],
                        );
                      });
                },
                child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
              ),
            ],
          ),
        )),
      )),
    );
  }

  Widget passwordResetModal(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Center(
          child: SvgPicture.asset('assets/forgot password/success.svg'),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Text(
                'Successfully',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 12.0),
              Text(
                'You have successfully reset password for your account.',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
