import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/widgets/createPollWidgets.dart';
import 'package:surveva_app/widgets/discoveryWidgets.dart';

class QMSPage extends StatefulWidget {
  const QMSPage({super.key});

  @override
  State<QMSPage> createState() => _QMSPageState();
}

class _QMSPageState extends State<QMSPage> with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  bool viewAnalytics = false;
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<int> genderAnalytics = [50, 10, 40];
  List<int> ageAnalytics = [60, 25, 15];
  List<int> geoAnalytics = [40, 35, 25, 5];

  // TODO: get questions from API
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Do you love cats?',
      'answers': ['Yes', 'No'],
      'analytics': [40, 60]
    },
    {
      'question': 'Do you think Donald Trump will win the election?',
      'answers': ['Yes', 'No', 'Unsure'],
      'analytics': [20, 50, 30]
    },
    {
      'question': 'What\'s your favorite dog breed?',
      'answers': ['Labrador', 'German Shepherd', 'Golden Retriever', 'Other'],
      'analytics': [20, 20, 20, 40]
    },
    {
      'question': 'Do you prefer shopping online or in-store?',
      'answers': ['Online', 'In-store', 'Both equally'],
      'analytics': [40, 30, 30]
    },
    {
      'question': 'How many hours do you spend on social media per day?',
      'answers': ['Less than 1', '1-3', '3-5', 'More than 5'],
      'analytics': [40, 30, 20, 10]
    },
    {
      'question': 'Will electric cars ever replace gas-powered vehicles?',
      'answers': ['Yes', 'No', 'Partially'],
      'analytics': [40, 30, 30]
    },
    {
      'question': 'Do you agree with Biden\'s policies?',
      'answers': ['Yes', 'No', 'Some of them', 'Not sure'],
      'analytics': [40, 30, 20, 10]
    },
    {
      'question': 'Which is the most played sport in the world?',
      'answers': ['Football', 'Basketball', 'Tennis', 'Baseball'],
      'analytics': [40, 30, 20, 10]
    },
    {
      'question': 'Is one piece the best anime of all time?',
      'answers': ['Yes', 'No', 'Maybe', 'I don\'t watch anime'],
      'analytics': [20, 50, 10, 20]
    },
    {
      'question': 'Do you like to eat pizza?',
      'answers': ['Yes', 'No', 'Sometimes', 'I\'m a vegetarian'],
      'analytics': [30, 20, 20, 30]
    },
    {
      'question': 'Is instagram improving the world or making it worse?',
      'answers': ['Yes', 'No', 'Maybe', 'I don\'t use instagram'],
      'analytics': [30, 20, 20, 30]
    }
  ];
  List<String> selectedAnswers = [];
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                child: Column(children: [
                  const SizedBox(height: 27),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        width: MediaQuery.of(context).size.width *
                                ((currentIndex + 1) / questions.length) -
                            32, // Subtracting horizontal padding
                        height: 4,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.only(bottom: 26),
                    child: Text(
                      questions[currentIndex]['question'],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: questions[currentIndex]['answers'].length,
                    separatorBuilder: (context, index) => Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    itemBuilder: (context, index) {
                      final answer = questions[currentIndex]['answers'][index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            // Incase a user goes back to a previous question to change their answer
                            if (currentIndex < selectedAnswers.length) {
                              selectedAnswers[currentIndex] = answer;
                            } else {
                              selectedAnswers.add(answer);
                            }

                            if (currentIndex < questions.length - 1) {
                              currentIndex++;
                            }

                            if (currentIndex == questions.length - 1) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: BackdropFilter(
                                            filter: ImageFilter.blur(
                                                sigmaX: 10, sigmaY: 10),
                                            child: Container(
                                              color:
                                                  Colors.black.withOpacity(0.8),
                                            ),
                                          ),
                                        ),
                                        endSurveyModal(context)
                                      ],
                                    );
                                  });
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.5),
                          decoration: BoxDecoration(
                            color: selectedAnswers.length > currentIndex &&
                                    selectedAnswers[currentIndex] == answer
                                ? Theme.of(context).colorScheme.onPrimary
                                : Theme.of(context).colorScheme.surface,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                answer,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: selectedAnswers.length >
                                              currentIndex &&
                                          selectedAnswers[currentIndex] ==
                                              answer
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).colorScheme.surface,
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                      color: const Color(0xffDDDAD3), width: 1),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        viewAnalytics = true;
                      });
                    },
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: viewAnalytics
                              ? Theme.of(context).colorScheme.onSurface
                              : Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Center(
                          child: Text(
                            viewAnalytics
                                ? 'Enjoy the analytics'
                                : 'View analytics',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
                  ),
                  const SizedBox(height: 8),
                  viewAnalytics
                      ? const SizedBox()
                      : Text(
                          'Interested in viewing the analytics? Click to view.',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                ]),
              )),
              const SizedBox(
                height: 14,
              ),
              responsesAnalytics(context, _animation,
                  questions[currentIndex]['analytics'] as List<int>),
              const SizedBox(
                height: 16,
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      genderAndAgeAnalytics(
                          context, _animation, genderAnalytics, true),
                      const SizedBox(height: 24),
                      genderAndAgeAnalytics(
                          context, _animation, ageAnalytics, false),
                      const SizedBox(height: 24),
                      geographyAnalytics(context, _animation, geoAnalytics),
                      const SizedBox(height: 30),
                    ],
                  ),
                  if (!viewAnalytics)
                    Positioned.fill(
                      child: ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            color: Colors.black.withOpacity(0.2),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  viewAnalytics = true;
                                });
                              },
                              child: const Center(
                                  child: Icon(
                                Icons.visibility_off,
                                size: 48,
                              )),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: currentIndex > 0
          ? GestureDetector(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 10.0),
                child: SvgPicture.asset('assets/create poll/back_button.svg'),
              ),
              onTap: () {
                setState(() {
                  currentIndex--;
                });
                ;
              },
            )
          : null,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Stack(
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
                      cancelSurveyModal(context)
                    ],
                  );
                }));
              },
              child: SvgPicture.asset('assets/create poll/close.svg')),
        )
      ],
    );
  }
}
