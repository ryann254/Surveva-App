import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PremiumPage extends StatefulWidget {
  const PremiumPage({super.key});

  @override
  State<PremiumPage> createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: appBar(context),
      body: Column(
        children: [],
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Theme.of(context).colorScheme.primary,
    leading: GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 10.0),
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Theme.of(context).colorScheme.onPrimary,
            BlendMode.srcIn,
          ),
          child: SvgPicture.asset('assets/create poll/back_button.svg'),
        ),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
  );
}
