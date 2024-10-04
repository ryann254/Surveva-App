import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  List<String> questions = [
    'Do you love cats?',
    'Do you think Donald Trump will win the election?',
    'What\'s your favorite dog breed?',
    'Do you prefer shopping online or in-store?',
    'How many hours do you spend on social media per day?',
    'Will electric cars ever replace gas-powered vehicles?',
    'Do you agree with Biden\'s policies?'
  ];
  List<String> filteredQuestions = [];

  @override
  void initState() {
    super.initState();
    filteredQuestions = List.from(questions);
    _searchController = TextEditingController();
  }

    setNavigation(String newNavigation) {
    setState(() {
      navigation = newNavigation;
    });
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
                      return Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                            top: 34, bottom: 34, left: 24, right: 24),
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xffF6F3EE),
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          filteredQuestions[index],
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff090A0A)),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          bottomNavigationWidget(navigation, setNavigation)
        ],
      )),
    );
  }

  Positioned bottomNavigationWidget(String navigation, Function setNavigation) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setNavigation('discovery');
              },
              child: Container(
                  decoration: BoxDecoration(
                    color: navigation == 'discovery'
                        ? const Color(0xff317C7D)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_sharp,
                        size: navigation == 'discovery' ? 20 : 24,
                        color: navigation == 'discovery'
                            ? Colors.white
                            : const Color(0xff317C7D),
                      ),
                      const SizedBox(width: 5),
                      if (navigation == 'discovery')
                        const Text(
                          'Discovery',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        )
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                setNavigation('create');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: navigation == 'create'
                      ? const Color(0xff317C7D)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/discovery/create.svg',
                      height: navigation == 'create' ? 20 : 24,
                      width: navigation == 'create' ? 20 : 24,
                      colorFilter: navigation == 'create'
                          ? const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)
                          : null,
                    ),
                    const SizedBox(width: 5),
                    if (navigation == 'create')
                      const Text(
                        'Create',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                setNavigation('profile');
              },
              child: Container(
                decoration: BoxDecoration(
                  color: navigation == 'profile'
                      ? const Color(0xff317C7D)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/discovery/profile.svg',
                      height: navigation == 'profile' ? 20 : 24,
                      width: navigation == 'profile' ? 20 : 24,
                      colorFilter: navigation == 'profile'
                          ? const ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)
                          : null,
                    ),
                    const SizedBox(width: 5),
                    if (navigation == 'profile')
                      const Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row searchWidget(List<String> questions) {
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
                  filteredQuestions = questions.where((question) => question.toLowerCase().contains(value.toLowerCase())).toList();
                });
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(
                      top: 3.0, left: 30.0, right: 30.0, bottom: 3.0),
                  hintText: 'Search',
                  hintStyle: const TextStyle(color: Color(0xff979C9E)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(color: Color(0xff979C9E)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff979C9E)),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Icon(
                      Icons.search_sharp,
                      color: Color(0xff979C9E),
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
                color: Color(0xff090A0A),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
