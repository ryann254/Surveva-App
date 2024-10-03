import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

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
              passwordWidget(obscurePassword, isObscurePassword),
              const SizedBox(height: 18.0),
              confirmPasswordWidget(obscureConfirmPassword, isObscureConfirmPassword),
              const SizedBox(height: 18.0),
              GestureDetector(
                onTap: () {},
                child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color:  const Color(0xff317C7D),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: const Center(
                      child: Text(
                        'Continue',
                        style: TextStyle(
                            color:  Colors.white,
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
}
