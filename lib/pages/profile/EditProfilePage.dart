import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/profile/SettingsPage.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String dob = '';
  String gender = '';

  isGender(String newGender) {
    setState(() {
      gender = newGender;
    });
  }

  isDob(String newDob) {
    setState(() {
      dob = newDob;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 37,),
            dobWidget(context, isDob, dob),
            const SizedBox(height: 18,),
            emailWidget(context: context),
            const SizedBox(height: 18,),
            phoneWidget(context, 'Phone'),
            const SizedBox(height: 18,),
            genderWidget(gender, isGender, context, true),
            const Spacer(),
            GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const SettingsPage()));
                      },
                      child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Center(
                            child: Text(
                              'Continue',
                              style: TextStyle(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    ),
                    const SizedBox(height: 18,)
          ],
        ),
      ),
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
    title: const Text('Edit Profile', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
    centerTitle: true,
  );
}