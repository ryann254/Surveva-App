import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({super.key});

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 37,),
              Text('Surveva Privacy Policy', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),),
              const SizedBox(height: 24,),
              const Text('Your privacy is important to us. It is Surveva\'s policy to respect your privacy and comply with any applicable law and regulation regarding any personal information we may collect about you, including via our app, Surveva, and its associated services.\n\nPersonal information is any information about you which can be used to identify you. This includes information about you as a person (such as name, address, and date of birth), your devices, payment details, and even information about how you use an app or online service.\n\nIn the event our app contains links to third-party sites and services, please be aware that those sites and services have their own privacy policies. After following a link to any thirdparty content, you should read their posted privacy policy information about how they collect and use personal information. This Privacy Policy does not apply to any of your activities after you leave our app.\n\nThis policy is effective as of August 26, 2024. Last updated: August 26, 2024'),
              const SizedBox(height: 24,),
              Text('Information We Collect', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary),),
              const SizedBox(height: 8,),
              const Text('Information we collect falls into one of two categories: \'voluntarily provided\' information and \'automatically collected\' information. \'Voluntarily provided\' information refers to any information you knowingly and actively provide us when using our app and its associated services. \'Automatically collected\' information refers to any information automatically sent by your device in the course of accessing our app and its associated services.'),
              const SizedBox(height: 24,),
            ],
          ),
        ),
      )),
    );
  }
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
      'Privacy Policy',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
  );
}