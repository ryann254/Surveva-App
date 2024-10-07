import 'package:flutter/material.dart';
import 'package:surveva_app/pages/DiscoveryPage.dart';
import 'package:surveva_app/pages/ProfilePage.dart';
import 'package:surveva_app/widgets/discoveryWidgets.dart';

class CreatePollPage extends StatefulWidget {
  const CreatePollPage({super.key});

  @override
  State<CreatePollPage> createState() => _CreatePollPageState();
}

class _CreatePollPageState extends State<CreatePollPage> {
  String navigation = 'create';

  setNavigation(String newNavigation) {
    if (newNavigation == 'discovery') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DiscoveryPage()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProfilePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              const Text('Create a poll'),
              bottomNavigationWidget(navigation, setNavigation, context)
            ],
          ),
        )
      ],
    )));
  }
}
