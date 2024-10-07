import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surveva_app/pages/LoginPage.dart';
import 'package:surveva_app/pages/SignUpPage.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  double _pageOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _pageOpacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedOpacity(
          opacity: _pageOpacity,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeIn,
          child: LayoutBuilder(
            // The LayoutBuilder is used to get the constraints of the screen
            builder: (context, constraints) {
              return SingleChildScrollView(
                // The SingleChildScrollView is used to scroll the page if the content is too big for the screen
                child: ConstrainedBox(
                  // The ConstrainedBox is used to set the minimum height to the screen
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const SizedBox(height: 75),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                                'assets/launch page/surveva_logo_launchpage.svg')
                          ],
                        ),
                        const SizedBox(height: 40),
                        Expanded(
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.4,
                                child: SvgPicture.asset(
                                  'assets/launch page/splash_screen_background.svg',
                                  width: double.infinity,
                                  height: 500,
                                ),
                              ),
                              const Positioned(
                                bottom: 180,
                                left: 0,
                                right: 0,
                                child: Text(
                                  'Create surveys. Share opinions.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const Positioned(
                                bottom: 155,
                                left: 0,
                                right: 0,
                                child: Text(
                                  'Get instant analytics',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Positioned(
                                bottom: 80,
                                left: 16,
                                right: 16,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpPage()));
                                  },
                                  child: Container(
                                    height: 46,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Create Account',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    )),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 35,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Have an account?',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      width: 5.0,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
