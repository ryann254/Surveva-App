import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TermsOfUsePage extends StatefulWidget {
  const TermsOfUsePage({super.key});

  @override
  State<TermsOfUsePage> createState() => _TermsOfUsePageState();
}

class _TermsOfUsePageState extends State<TermsOfUsePage> {
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
              Text('Surveva Terms of Service', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary),),
              const SizedBox(height: 24,),
              const Text('These Terms of Service govern your use of Surveva, our website located at https://www.surveva.com, and any related services provided by Surveva. When you create an Surveva account or use Surveva, you agree to abide by these Terms of Service and to comply with all applicable laws and regulations. If you do not agree with these Terms of Service, you are prohibited from further using the app, accessing our website, or using any other services provided by Surveva. If you access or download Surveva from (1) the Apple App Store, you agree to any Usage Rules set forth in the App Store Terms of Service; and/or (2) the Google Play Store, you agree to the Android, Google Inc. Terms and Conditions including the Google Apps Terms of Service. We, Surveva, reserve the right to review and amend any of these Terms of Service at our sole discretion. Upon doing so, we will update this page and notify you through the app and/or the email address you provided when you created your account. Any changes to these Terms of Service will take effect immediately from the date of publication. These Terms of Service were last updated on August 26, 2024.'),
              const SizedBox(height: 24,),
              Text('Limitations of Use', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.primary),),
              const SizedBox(height: 8,),
              const Text('By using Surveva and our website, you warrant on behalf of yourself, any entity who you represent who has entered into these Terms of Service, and your users that you will not: modify, copy, prepare derivative works of, decompile, or reverse engineer Surveva or any materials and software contained within Surveva or on our website; remove any copyright or other proprietary notations from Surveva or any materials and software contained within Surveva or on our website; transfer Surveva or any of its associated materials to another person or "mirror" the materials on any other server; knowingly or negligently use Surveva or any of its associated services in a way that abuses or disrupts our networks or any other service Surveva provides; use Surveva or its associated services to transmit or publish any harassing, indecent, obscene, fraudulent, or unlawful material; use Surveva or its associated services in violation of any applicable laws or regulations; use Surveva to send unauthorized advertising or spam; harvest, collect, or gather user data without the user’s consent; or use Surveva or its associated services in such a way that may infringe the privacy, intellectual property rights, or other rights of third parties.'),
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
      'Terms of Use',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
  );
}