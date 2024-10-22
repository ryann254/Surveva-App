import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:surveva_app/pages/profile/EditCategoriesPage.dart';
import 'package:surveva_app/widgets/authWidgets.dart';
import 'package:surveva_app/widgets/profileWidgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  bool isProfileSaved = false;
  String nameErrorMessage = '';
  String usernameErrorMessage = '';
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  List<String> selectedCategories = [
    'Education and Academia',
    'Health and Fitness',
    'Technology and Innovation',
  ];

  onDiscard() {
    Navigator.pop(context);
  }

  Future<void> askForCameraPermission() async {
    try {
      PermissionStatus status = await Permission.camera.request();

      if (status.isGranted) {
        print('Camera permission granted');
      } else if (status.isDenied) {
        print('Camera permission denied');
      } else if (status.isPermanentlyDenied) {
        print('Camera permission permanently denied');
        // await openAppSettings();
      }
    } catch (e) {
      print('Error requesting camera permission: $e');
      // show error dialog
    }
  }

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
            showDialog(
                context: context,
                builder: (context) => Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                        ),
                        confirmProfileChangesModal(context, onDiscard),
                      ],
                    ));
          },
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            'Account',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () async {
                    await askForCameraPermission();
                  },
                  child: Center(
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          'assets/profile/avatar.svg',
                          height: 64,
                          width: 64,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Change profile picture',
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 19,
                ),
                const Text(
                  'Personal Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 12,
                ),
                nameWidget(context, 'Name', nameController, (String name) => {},
                    nameErrorMessage, false),
                const SizedBox(
                  height: 18,
                ),
                nameWidget(context, 'Username', usernameController,
                    (String username) => {}, usernameErrorMessage, false),
                const SizedBox(
                  height: 18,
                ),
                bioWidget(context, 'Bio'),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Personalizations',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EditCategoriesPage()));
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).primaryColor),
                        )),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: selectedCategories
                      .map((language) => GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedCategories.remove(language);
                              });
                            },
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                child: Text(
                                  language,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                )),
                          ))
                      .toList(),
                ),
                const SizedBox(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isProfileSaved = true;
                    });
                  },
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: isProfileSaved
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Text(
                          isProfileSaved ? 'Saved' : 'Save',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
