import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/widgets/profileWidgets.dart';

class MoreSettingsPage extends StatefulWidget {
  const MoreSettingsPage({super.key});

  @override
  State<MoreSettingsPage> createState() => _MoreSettingsPageState();
}

class _MoreSettingsPageState extends State<MoreSettingsPage> {
  String colorMode = 'Original';
    // TODO: Get languages from API
  List<String> languages = [
    'English',
    'Spanish',
    'French',
    'German',
    'Italian',
    'Portuguese',
    'Russian',
    'Chinese',
    'Japanese',
    'Korean',
    'Arabic',
    'Hindi',
    'Bengali',
    'Punjabi',
    'Urdu',
    'Indonesian',
    'Malay',
    'Thai',
    'Vietnamese',
    'Filipino',
    'Dutch',
    'Swedish',
    'Norwegian',
    'Danish',
    'Finnish',
    'Estonian',
    'Latvian',
    'Lithuanian',
    'Polish',
    'Czech',
    'Slovak',
    'Slovenian',
    'Croatian',
    'Bosnian',
    'Macedonian',
    'Romanian',
    'Bulgarian',
    'Serbian',
    'Montenegrin',
    'Albanian',
    'Maltese'
  ];
  List<String> selectedLanguages = [];

  selectLangugage(String language) {
    setState(() {
      if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
      } else {
        selectedLanguages.add(language);
      }
    });
  }
  
  changeColorMode(String mode) {
    setState(() {
      colorMode = mode;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Column(
        children: [
          const SizedBox(
            height: 37,
          ),
          settingsSection(
              context,
              'Notifications',
              'assets/profile/notifications.svg',
              Icons.arrow_forward_ios_outlined),
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
                            languagePreferencesModal(context, languages, selectLangugage, selectedLanguages)
                      ],
                    );
                  });
            },
            child: settingsSection(context, 'Language', 'assets/profile/language.svg',
                Icons.arrow_forward_ios_outlined),
          ),
          settingsSection(
              context,
              'Change password',
              'assets/profile/change_password.svg',
              Icons.arrow_forward_ios_outlined),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Color Mode',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          changeColorMode('Original');
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: colorMode == 'Original'
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.tertiary,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.tertiary),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24),
                                bottomLeft: Radius.circular(24)),
                          ),
                          child: Center(
                            child: Text(
                              'Original',
                              style: TextStyle(
                                  color: colorMode == 'Original'
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onTertiary),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          changeColorMode('Light');
                        },
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: colorMode == 'Light'
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.tertiary,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.tertiary),
                          ),
                          child: Center(
                            child: Text(
                              'Light',
                              style: TextStyle(
                                  color: colorMode == 'Light'
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onTertiary),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          changeColorMode('Dark');
                        },
                        child: Container(
                          height: 50,
                            decoration: BoxDecoration(
                              color: colorMode == 'Dark'
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.tertiary,
                            border: Border.all(
                                color: Theme.of(context).colorScheme.tertiary),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(24),
                                bottomRight: Radius.circular(24)),
                          ),
                          child: Center(
                            child: Text(
                              'Dark',
                              style: TextStyle(
                                  color: colorMode == 'Dark'
                                      ? Theme.of(context).colorScheme.onPrimary
                                      : Theme.of(context)
                                          .colorScheme
                                          .onTertiary),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget settingsSection(
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
      'Settings',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
  );
}
