import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:surveva_app/pages/auth/ResetPasswordPage.dart';
import 'package:surveva_app/pages/profile/ChangePasswordPage.dart';
import 'package:surveva_app/pages/profile/MoreSettingsPage.dart';

class AuthenticationCodePage extends StatefulWidget {
  const AuthenticationCodePage({super.key, required this.origin});
  final String origin;

  @override
  State<AuthenticationCodePage> createState() => _AuthenticationCodePageState();
}

class _AuthenticationCodePageState extends State<AuthenticationCodePage> {
  bool _isCodeValid = false;

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
            if (widget.origin == 'profile') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangePasswordPage()));
            } else {
              Navigator.of(context).pop();
            }
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
                const SizedBox(
                  height: 91,
                ),
                const Text(
                  'Enter authentication code',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 12,
                ),
                const SizedBox(
                  width: 300,
                  child: Text(
                    'Enter the 4-digit code sent to your email address',
                    style:
                        TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 36,
                ),
                VerificationCode(
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  textStyle: const TextStyle(fontSize: 20.0),
                  margin: const EdgeInsets.only(right: 14.0),
                  onCompleted: (value) {
                    setState(() {
                      _isCodeValid = true;
                    });
                  },
                  onEditing: (value) {},
                  cursorColor: Theme.of(context).primaryColor,
                  keyboardType: TextInputType.number,
                  length: 4,
                  fullBorder: true,
                  autofocus: true,
                ),
                const SizedBox(height: 92.0),
                GestureDetector(
                  onTap: () {
                    if (widget.origin == 'forgot') {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordPage()));
                    } else {
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
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
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
                    }
                  },
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: _isCodeValid
                            ? Theme.of(context).primaryColor
                            : Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          'Continue',
                          style: TextStyle(
                              color: _isCodeValid
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.onTertiary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
                const SizedBox(height: 18.0),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Resend code',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff317C7D)),
                  ),
                ),
              ],
            ),
          ),
        ),
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
                  MaterialPageRoute(builder: (context) => const MoreSettingsPage()));
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
