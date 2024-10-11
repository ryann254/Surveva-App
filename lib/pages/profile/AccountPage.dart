import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/profile/EditCategoriesPage.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<String> selectedCategories = [
    'Education and Academia',
    'Health and Fitness',
    'Technology and Innovation',
  ];

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
            Navigator.of(context).pop();
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
                Center(
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
                nameWidget(context, 'Name'),
                const SizedBox(
                  height: 18,
                ),
                nameWidget(context, 'Username'),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const EditCategoriesPage()));
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
                const SizedBox(height: 35,),
                Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const SizedBox(height: 16,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
