import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/utils/dateUtils.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

Widget deleteModal(BuildContext context) {
  return Dialog(
    backgroundColor: const Color(0xffF5F5F5).withOpacity(0.7),
    child: SizedBox(
      height: 300,
      width: 350,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Delete survey?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: 241,
                    child: Text(
                      'This action is irreversible, and it will not be possible to restore the survey. You will lose access to the survey statistics, and users will no longer see the survey in their feed.',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.3))),
              ),
              child: const Center(
                child: Text(
                  'Delete',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0066CC)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.3))),
              ),
              child: const Center(
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff0066CC)),
                ),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget reportModal(
    BuildContext context, bool isViolation, Function reportViolation) {
  return Dialog(
    insetPadding: const EdgeInsets.only(top: 9),
    alignment: Alignment.bottomCenter,
    child: Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.95,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 8),
                Container(
                  height: 5,
                  width: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onTertiary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'Report',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 22),
                const Text(
                  'Why you are reporting this survey?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Your report is anonymous. If someone is in danger, call local emergency services immediately, don’t wait.',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
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
                          successfulReportModal(context),
                        ],
                      ));
            },
            child: const Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'I just don\'t like it',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          GestureDetector(
            onTap: () {
              reportViolation();
              Navigator.pop(context);
              showDialog(
                  context: context,
                  builder: (context) => reportViolationModal(context));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Report a violation',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 1,
            color: Theme.of(context).colorScheme.onPrimary,
          )
        ],
      ),
    ),
  );
}

Widget reportViolationModal(BuildContext context) {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    alignment: Alignment.bottomCenter,
    child: Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.95,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16), bottom: Radius.zero),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              height: 5,
              width: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Report a violation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 22),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 18),
                    SizedBox(
                      width: 280,
                      child: Text(
                        'Help us understand why you\'re reporting this survey.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.attach_file,
                      size: 37,
                    )),
                const SizedBox(width: 5),
                Expanded(
                    child: reportViolationWidget(
                        context, 'What are you trying to report')),
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget successfulReportModal(BuildContext context) {
  return Dialog(
    insetPadding: const EdgeInsets.symmetric(horizontal: 16),
    child: SizedBox(
      height: 350,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SvgPicture.asset('assets/discovery/success.svg'),
                const SizedBox(height: 12),
                const Text(
                  'Thanks for your opinion!',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'We use these reports to show you fewer surveys of this kind in the future.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
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
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget moreOptionsModal(BuildContext context, bool isOwner, bool isViolation,
    Function reportViolation) {
  return Dialog(
    alignment: Alignment.topRight,
    insetPadding: const EdgeInsets.only(top: 70, right: 16),
    child: Container(
      width: 250,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
      child: GestureDetector(
        onTap: () {
          if (isOwner) {
            Navigator.pop(context);
            Future.delayed(Duration.zero, () {
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
                          deleteModal(context),
                        ],
                      ));
            });
          } else {
            Navigator.pop(context);
            Future.delayed(Duration.zero, () {
              showDialog(
                  context: context,
                  builder: (context) => Column(
                        children: [
                          BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          reportModal(context, isViolation, reportViolation),
                        ],
                      ));
            });
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              isOwner ? 'Delete' : 'Report',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
            isOwner
                ? const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                : SvgPicture.asset('assets/discovery/report.svg')
          ],
        ),
      ),
    ),
  );
}

Dialog commentsModal(
    BuildContext context,
    List<Map<String, dynamic>> comments,
    TextEditingController commentController,
    Function addComment,
    Function removeComment) {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    alignment: Alignment.bottomCenter,
    child: Container(
      width: MediaQuery.of(context).size.width,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.95,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(
            top: Radius.circular(16), bottom: Radius.zero),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Container(
              height: 5,
              width: 48,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onTertiary,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Comments',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 22),
            comments.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                        itemCount: comments.length,
                        itemBuilder: (context, index) {
                          final comment = comments[index];
                          return Dismissible(
                            key: Key(index
                                .toString()), // Assuming each comment has a unique id
                            direction: DismissDirection.endToStart,
                            background: Container(
                              alignment: Alignment.centerRight,
                              color: Colors.red,
                              child: const Padding(
                                padding: EdgeInsets.only(right: 16.0),
                                child: Icon(Icons.delete, color: Colors.white),
                              ),
                            ),
                            onDismissed: (direction) {
                              removeComment(
                                  index); // Call the removeComment function
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 44,
                                    height: 44,
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Center(
                                        child: comment['profileImg'] == ''
                                            ? Text(
                                                comment['username'][0],
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              )
                                            : SvgPicture.asset(
                                                comment['profileImg'],
                                                height: 44,
                                                width: 44,
                                              )),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              comment['username'],
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            const SizedBox(width: 6),
                                            Text(
                                              getRelativeTime(comment['date']),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onTertiary),
                                            )
                                          ],
                                        ),
                                        Text(
                                          comment['comment'],
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                : Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'No comments yet',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 18),
                          Text(
                            'Start the conversation',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            commentWidget(context, comments, commentController, addComment)
          ],
        ),
      ),
    ),
  );
}
