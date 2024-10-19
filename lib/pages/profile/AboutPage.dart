import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/profile/PrivacyPolicyPage.dart';
import 'package:surveva_app/pages/profile/TermsOfUsePage.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 37),
          GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage())),
              child: aboutSection(
                  context,
                  'Privacy Policy',
                  'assets/profile/privacy_policy.svg',
                  Icons.arrow_forward_ios_outlined)),
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TermsOfUsePage())),
            child: aboutSection(
                context,
                'Terms of Use',
                'assets/profile/about.svg',
                Icons.arrow_forward_ios_outlined),
          ),
        ],
      )),
    );
  }
}

Widget aboutSection(
    BuildContext context, String title, String asset, IconData icon2) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(asset),
            const SizedBox(
              width: 18,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
        Icon(
          icon2,
          size: 18,
        )
      ],
    ),
  );
}

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 10.0),
        child: SvgPicture.asset('assets/create poll/back_button.svg'),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    title: const Text(
      'About',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
  );
}
