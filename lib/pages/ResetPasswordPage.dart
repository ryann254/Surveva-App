import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
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
            child: Column(
          children: [
            const Text('Reset password'),
          ],
        )),
      )),
    );
  }
}
