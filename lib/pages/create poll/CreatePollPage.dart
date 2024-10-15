import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/pages/discovery/DiscoveryPage.dart';
import 'package:surveva_app/pages/profile/ProfilePage.dart';
import 'package:surveva_app/widgets/createPollWidgets.dart';

class CreatePollPage extends StatefulWidget {
  const CreatePollPage({super.key});

  @override
  State<CreatePollPage> createState() => _CreatePollPageState();
}

class _CreatePollPageState extends State<CreatePollPage> {
  String navigation = 'create';
  List<TextEditingController> controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<FocusNode> focusNodes = [];
  // This focusNode is used to remove the focus from the TextField
  // when the user starts rearranging the textfields.
  final FocusNode _focusNode = FocusNode();

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
  void initState() {
    super.initState();
    for (var _ in controllers) {
      focusNodes.add(FocusNode());
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(context),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 62,
              ),
              SizedBox(
                height: 84,
                width: double.infinity,
                child: TextField(
                  maxLines: 6,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, height: 1.3),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 16.0, right: 16.0),
                    hintText: 'Your question',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    filled: false,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Expanded(
                child: ReorderableListView.builder(
                  itemCount: controllers.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: ValueKey(controllers[index]),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 16.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (direction) {
                        setState(() {
                          controllers.removeAt(index);
                          focusNodes.removeAt(index);
                        });
                      },
                      child: answerChoice(
                        context,
                        index == controllers.length - 1,
                        index,
                      ),
                    );
                  },
                  onReorder: (int oldIndex, int newIndex) {
                    setState(() {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                      }
                      final TextEditingController item = controllers.removeAt(oldIndex);
                      controllers.insert(newIndex, item);
                      final FocusNode focusNode = focusNodes.removeAt(oldIndex);
                      focusNodes.insert(newIndex, focusNode);
                    });
                  },
                ),
              ),
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
                            startSurveyModal(context)
                      ],
                    );
                  });
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
                        'Publish',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    )),
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        )));
  }

  Widget answerChoice(BuildContext context, bool addChoice, int index) {
    return Padding(
      key: ValueKey(controllers[index]),
      padding: EdgeInsets.zero,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          addChoice
          // Hide the add container if the user has reached the maximum number of answer choices
              ? controllers.length < 5
                  ? Expanded(
                      child: Container(
                      padding: const EdgeInsets.only(
                          left: 16.0, right: 16.0, bottom: 16.0, top: 16.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).colorScheme.tertiary,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Text(
                        'Answer Choice',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).colorScheme.onTertiary),
                      ),
                    ))
                  : Container()
              : Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Theme.of(context).colorScheme.tertiary,
                          width: 1,
                        ),
                      ),
                    ),
                    child: TextField(
                      controller: controllers[index],
                      focusNode: focusNodes[index],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.only(left: 16.0, right: 16.0),
                        hintText: 'Answer Choice',
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onTertiary,
                        ),
                        filled: false,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
          addChoice
          // Hide the add button if the user has reached the maximum number of answer choices
              ? controllers.length < 5
                  ? GestureDetector(
                      child: Icon(
                        Icons.add,
                        size: 26,
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                      onTap: () {
                        setState(() {
                          controllers.insert(
                              controllers.length - 1, TextEditingController());
                          focusNodes.insert(focusNodes.length - 1, FocusNode());
                        });
                      },
                    )
                  : Container()
              : ReorderableDragStartListener(
                  index: index,
                  child: GestureDetector(
                    onPanDown: (_) {
                      // Remove focus when starting to drag
                      FocusScope.of(context).unfocus();
                    },
                    child: Icon(
                      Icons.menu_sharp,
                      size: 26,
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
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
          child: SvgPicture.asset('assets/icons/arrow-left.svg'),
        ),
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      title: const Text(
        'New survey',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      ),
      centerTitle: true,
    );
  }
}
