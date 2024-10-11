import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/CreatePollPage.dart';
import 'package:surveva_app/pages/discovery/DiscoveryPage.dart';
import 'package:surveva_app/pages/discovery/VotingPage.dart';
import 'package:surveva_app/pages/profile/AccountPage.dart';
import 'package:surveva_app/widgets/discoveryWidgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String navigation = 'profie';
  bool isOwner = true;
  // TODO: get questions from API
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Do you love cats?',
      'answers': ['Yes', 'No', 'Maybe'],
      'analytics': ['40', '30', '30']
    },
    {
      'question': 'Do you think Donald Trump will win the election?',
      'answers': ['Yes', 'No', 'Unsure'],
      'analytics': ['40', '30', '30']
    },
    {
      'question': 'What\'s your favorite dog breed?',
      'answers': ['Labrador', 'German Shepherd', 'Golden Retriever', 'Other'],
      'analytics': ['40', '30', '30', '30']
    },
    {
      'question': 'Do you prefer shopping online or in-store?',
      'answers': ['Online', 'In-store', 'Both equally'],
      'analytics': ['40', '30', '30']
    },
    {
      'question': 'How many hours do you spend on social media per day?',
      'answers': ['Less than 1', '1-3', '3-5', 'More than 5'],
      'analytics': ['40', '30', '30', '30']
    },
    {
      'question': 'Will electric cars ever replace gas-powered vehicles?',
      'answers': ['Yes', 'No', 'Partially'],
      'analytics': ['40', '30', '30']
    },
    {
      'question': 'Do you agree with Biden\'s policies?',
      'answers': ['Yes', 'No', 'Some of them', 'Not sure'],
      'analytics': ['40', '30', '30', '30']
    }
  ];

  setNavigation(String newNavigation) {
    if (newNavigation == 'discovery') {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const DiscoveryPage()));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const CreatePollPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Roronoa Zoro',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.settings,
                                size: 34,
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SvgPicture.asset('assets/profile/avatar.svg'),
                            const SizedBox(
                              width: 18,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Roronoa Zoro',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).colorScheme.primary,
                                    borderRadius: BorderRadius.circular(24),
                                  ),
                                  child: Text(
                                    '0 Questions',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context).colorScheme.onPrimary,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: isOwner ? ownerAccount(context) : guestAccount(context),
                  ),
                ),
              ],
            ),
            bottomNavigationWidget(navigation, setNavigation, context)
          ],
        ),
      ),
    );
  }

  Widget guestAccount(BuildContext context) {
    return Expanded(
        child: questions.isEmpty
            ? const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No polls yet',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VotingPage(question: questions[index])));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          top: 34, bottom: 34, left: 24, right: 24),
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        questions[index]['question'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ));
  }

  Widget ownerAccount(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountPage()));
          },
          child: Container(
            width: double.infinity,
            height: 46,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                'Account',
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        questions.isNotEmpty ? const SizedBox(height: 18,) : const SizedBox(),
        Expanded(
          child: questions.isEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/profile/create_poll.svg'),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      'Share your surveys and get opinions',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'The polls you share will be displayed in your profile.',
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'Create and share your first survey',
                      style: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )
              : ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VotingPage(question: questions[index])));
                    },
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                          top: 34, bottom: 34, left: 24, right: 24),
                      margin: const EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.onPrimary,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        questions[index]['question'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                },
              ),
        ),
      ],
    );
  }
}
