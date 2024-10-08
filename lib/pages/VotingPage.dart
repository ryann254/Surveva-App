import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/widgets/discoveryWidgets.dart';

class VotingPage extends StatefulWidget {
  final Map<String, dynamic> question;

  const VotingPage({super.key, required this.question});

  @override
  State<VotingPage> createState() => _VotingPageState();
}

class _VotingPageState extends State<VotingPage>
    with SingleTickerProviderStateMixin {
  final profileImg = '';
  bool isLiked = false;
  String selectedAnswer = '';
  late AnimationController _animationController;
  late Animation<double> _animation;
  List<int> genderAnalytics = [70, 27, 3];
  List<int> ageAnalytics = [60, 25, 15];
  List<int> geoAnalytics = [40, 35, 25, 5];
  List<Map<String, dynamic>> comments = [
    {
      'username': 'Roronoa Zoro',
      'profileImg': '',
      'comment': 'The king of hell has arrived',
      'date': '2024-02-01',
    },
    {
      'username': 'Monkey D. Luffy',
      'profileImg': '',
      'comment': 'I am the future king of the pirates',
      'date': '2024-02-01',
    },
    {
      'username': 'Sanji',
      'profileImg': '',
      'comment': 'I will find the all blue',
      'date': '2024-02-01',
    }
  ];

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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: profileImg.isEmpty
                    ? Text(
                        widget.question['question'].substring(0, 1),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : SvgPicture.asset(
                        profileImg,
                      ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Ryan Njoroge',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
            )
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Number of votes',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '46',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        widget.question['question'],
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 24),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget.question['answers'].length,
                        separatorBuilder: (context, index) => Container(
                          height: 1,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                        itemBuilder: (context, index) {
                          final answer = widget.question['answers'][index];
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedAnswer = answer;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(12.5),
                              decoration: BoxDecoration(
                              color: selectedAnswer == answer
                                  ? Theme.of(context).colorScheme.onPrimary
                                  : Theme.of(context).colorScheme.surface,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    answer,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: selectedAnswer == answer
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .colorScheme
                                              .surface,
                                      borderRadius: BorderRadius.circular(24),
                                      border: Border.all(
                                          color: const Color(0xffDDDAD3),
                                          width: 1),
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
                      const SizedBox(
                        height: 28,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Vote to see the analytics',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      genderAndAgeAnalytics(
                          context, _animation, genderAnalytics, true),
                      const SizedBox(height: 24),
                      genderAndAgeAnalytics(
                          context, _animation, ageAnalytics, false),
                      const SizedBox(height: 24),
                      geographyAnalytics(context, _animation, geoAnalytics),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          isLiked = !isLiked;
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 36,
                        color: isLiked
                            ? Colors.red
                            : Theme.of(context).colorScheme.secondary,
                      )),
                  GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                commentsModal(context, comments));
                      },
                      child: SvgPicture.asset('assets/discovery/comments.svg',
                          height: 36, width: 36))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
