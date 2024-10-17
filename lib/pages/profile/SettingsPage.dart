import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/profile/EditProfilePage.dart';
import 'package:surveva_app/pages/profile/MoreSettingsPage.dart';
import 'package:surveva_app/widgets/profileWidgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Roronoa Zoro',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SvgPicture.asset(
                  'assets/profile/avatar.svg',
                  width: 64,
                  height: 64,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            account(context),
            const SizedBox(
              height: 24,
            ),
            support(context),
            const SizedBox(
              height: 24,
            ),
            legal(context),
            const Spacer(),
            GestureDetector(
              onTap: () {
                showDialog(context: context, builder: (BuildContext context) {
                    return Stack(
                      children: [
                        GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                child: Container(
                                  color: Colors.black.withOpacity(0.8),
                                ),
                              ),
                            ),
                            confirmLogoutModal(context)
                      ],
                    );
                  });
              },
              child: Row(
                children: [
                  SvgPicture.asset('assets/profile/logout.svg'),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Column account(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Your account',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox()
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
                },
                child: accountSection(
                    context,
                    'assets/profile/person.svg',
                    'Personal Information',
                    'Age, Date of Birth, E-Mail, Phone,...',
                    Icons.arrow_forward_ios_outlined),
              ),
              const SizedBox(
                height: 12,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MoreSettingsPage()));
                },
                child: accountSection(
                    context,
                    'assets/profile/settings.svg',
                    'Settings',
                    'Notifications, Language, Password,...',
                    Icons.arrow_forward_ios_outlined),
              )
            ],
          ),
        )
      ],
    );
  }

  Column support(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Support',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox()
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              accountSection(
                  context,
                  'assets/profile/help.svg',
                  'Help',
                  '',
                  Icons.arrow_forward_ios_outlined),
              const SizedBox(
                height: 18,
              ),
              accountSection(
                  context,
                  'assets/profile/report_problem.svg',
                  'Report a problem',
                  '',
                  Icons.arrow_forward_ios_outlined)
            ],
          ),
        )
      ],
    );
  }

  Column legal(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Legal Information',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            SizedBox()
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            children: [
              accountSection(
                  context,
                  'assets/profile/about.svg',
                  'About',
                  '',
                  Icons.arrow_forward_ios_outlined),
            ],
          ),
        )
      ],
    );
  }

  Row accountSection(BuildContext context, String asset, String title,
      String subtitle, IconData icon2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(asset),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle.isNotEmpty ? Text(
                  subtitle,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary),
                ) : const SizedBox()
              ],
            ),
          ],
        ),
        Icon(
          icon2,
          size: 18,
        )
      ],
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
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
