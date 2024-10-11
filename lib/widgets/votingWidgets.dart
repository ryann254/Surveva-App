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

Widget moreOptionsModal(BuildContext context, bool isOwner) {
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
