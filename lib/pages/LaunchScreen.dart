import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  double _pageOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () {
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
          duration: const Duration(seconds: 2),
          curve: Curves.easeIn,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        const SizedBox(height: 75),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'surveva',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 1.4),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            SvgPicture.asset(
                                'assets/icons/surveva_logo_small.svg',
                                width: 28,
                                height: 46)
                          ],
                        ),
                        const SizedBox(height: 40),
                        Expanded(
                          child: Stack(
                            children: [
                              Opacity(
                                opacity: 0.4,
                                child: SvgPicture.asset(
                                  'assets/landing page/splash_screen_background.svg',
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
                                      fontWeight: FontWeight.w600, fontSize: 18),
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
                                      fontWeight: FontWeight.w600, fontSize: 18),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Positioned(
                                bottom: 80,
                                left: 16,
                                right: 16,
                                child: Container(
                                  height: 46,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: const Color(0xff317C7D),
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Create',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  )),
                                ),
                              ),
                              const Positioned(
                                bottom: 35,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Have an account?',
                                      style: TextStyle(fontSize: 14),
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
                                          decoration: TextDecoration.underline),
                                      textAlign: TextAlign.center,
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
