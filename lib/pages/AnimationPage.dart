import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surveva_app/pages/discovery/DiscoveryPage.dart';
import 'package:surveva_app/pages/LaunchPage.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstLogoOpacity;
  late Animation<double> _secondLogoOpacity;
  final _loginState = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );

    // Animate the logos to appear one after the other.
    _firstLogoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3,
            curve: Curves.easeInOut), // Adjusted interval
      ),
    );

    _secondLogoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0,
            curve: Curves.easeInOut), // Adjusted interval
      ),
    );

    // After the animation is done, navigate to the home page or launch page.
    _controller.forward().then((_) {
      Future.delayed(const Duration(milliseconds: 500), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) =>
                  _loginState ? const DiscoveryPage() : const LaunchPage()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _firstLogoOpacity.value *
                        (1 - _secondLogoOpacity.value),
                    child: SvgPicture.asset(
                        'assets/launch page/main_logo_homepage.svg'),
                  );
                },
              ),
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Opacity(
                    opacity: _secondLogoOpacity.value,
                    child: SvgPicture.asset(
                        'assets/launch page/surveva_logo_homepage.svg'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
