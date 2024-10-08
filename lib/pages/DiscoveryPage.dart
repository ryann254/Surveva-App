import 'package:flutter/material.dart';
import 'package:surveva_app/pages/CreatePollPage.dart';
import 'package:surveva_app/pages/ProfilePage.dart';
import 'package:surveva_app/pages/VotingPage.dart';
import 'package:surveva_app/widgets/discoveryWidgets.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  bool isTyping = false;
  String navigation = 'discovery';
  late TextEditingController _searchController;

  // TODO: get questions from API
  List<Map<String, dynamic>> questions = [
    {'question': 'Do you love cats?', 'answers': ['Yes', 'No', 'Maybe']},
    {'question': 'Do you think Donald Trump will win the election?', 'answers': ['Yes', 'No', 'Unsure']},
    {'question': 'What\'s your favorite dog breed?', 'answers': ['Labrador', 'German Shepherd', 'Golden Retriever', 'Other']},
    {'question': 'Do you prefer shopping online or in-store?', 'answers': ['Online', 'In-store', 'Both equally']},
    {'question': 'How many hours do you spend on social media per day?', 'answers': ['Less than 1', '1-3', '3-5', 'More than 5']},
    {'question': 'Will electric cars ever replace gas-powered vehicles?', 'answers': ['Yes', 'No', 'Partially']},
    {'question': 'Do you agree with Biden\'s policies?', 'answers': ['Yes', 'No', 'Some of them', 'Not sure']}
  ];
  List<Map<String, dynamic>> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = List.from(questions);
    _searchController = TextEditingController();
  }

  setNavigation(String newNavigation) {
    if (newNavigation == 'create') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePollPage()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
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
                const SizedBox(
                  height: 12,
                ),
                searchWidget(questions),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredQuestions.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => VotingPage(question: filteredQuestions[index])));
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
                            filteredQuestions[index]['question'],
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          bottomNavigationWidget(navigation, setNavigation, context)
        ],
      )),
    );
  }



  Row searchWidget(List<Map<String, dynamic>> questions) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44,
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  isTyping = value.isNotEmpty;
                  filteredQuestions = questions
                      .where((question) =>
                          question['question'].toLowerCase().contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: 3.0, left: 30.0, right: 30.0, bottom: 3.0),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.onTertiary),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.search_sharp,
                      color: Theme.of(context).colorScheme.onTertiary,
                      size: 24,
                    ),
                  )),
            ),
          ),
        ),
        if (isTyping) ...[
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                isTyping = false;
                _searchController.clear();
                filteredQuestions = questions;
              });
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
