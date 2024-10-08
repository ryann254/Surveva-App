import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:surveva_app/utils/dateUtils.dart';
import 'package:surveva_app/widgets/authWidgets.dart';

Dialog commentsModal(
    BuildContext context, List<Map<String, dynamic>> comments, TextEditingController commentController, Function addComment, Function removeComment) {
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
                            key: Key(index.toString()), // Assuming each comment has a unique id
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
                              removeComment(index); // Call the removeComment function
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
                                        child: comment['profileImg'] == '' ? Text(
                                      comment['username'][0],
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ) : SvgPicture.asset(
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

Positioned bottomNavigationWidget(
    String navigation, Function setNavigation, BuildContext context) {
  return Positioned(
    left: 16,
    right: 16,
    bottom: 16,
    child: Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
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
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: const EdgeInsets.all(14),
                child: Row(
                  children: [
                    Icon(
                      Icons.search_sharp,
                      size: 22,
                      color: navigation == 'discovery'
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 5),
                    if (navigation == 'discovery')
                      Text(
                        'Discovery',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.onPrimary),
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
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/discovery/create.svg',
                    height: 22,
                    width: 22,
                    colorFilter: navigation == 'create'
                        ? ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimary,
                            BlendMode.srcIn)
                        : null,
                  ),
                  if (navigation == 'create') ...[
                    const SizedBox(width: 5),
                    Text(
                      'Create',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
                    )
                  ],
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
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(24),
              ),
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/discovery/profile.svg',
                    height: 22,
                    width: 22,
                    colorFilter: navigation == 'profile'
                        ? ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimary,
                            BlendMode.srcIn)
                        : null,
                  ),
                  if (navigation == 'profile') ...[
                    const SizedBox(width: 5),
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Row genderAndAgeAnalytics(BuildContext context, Animation<double> _animation,
    List<int> analytics, bool isGender) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Expanded(
        flex: 2,
        child: Text(
          isGender ? 'Gender' : 'Age',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        flex: 5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    Text(
                      isGender ? ' Male' : ' 18',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    Text(
                      isGender ? ' Female' : ' 18-30',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    Text(
                      isGender ? ' Others' : ' 30+',
                      style: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizedBox(
                  height: 28,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            // 10 is added to make sure the third bar wraps around the second one
                            flex: 100 - (analytics[2] + 10),
                            child: Container(),
                          ),
                          Flexible(
                            flex: analytics[2] + 10,
                            child: FractionallySizedBox(
                              widthFactor: _animation.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(24),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  '${analytics[2]}%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            // 10 is added to make sure the second bar wraps around the first one
                            flex: 100 - (analytics[1] + analytics[2] + 10),
                            child: Container(),
                          ),
                          Flexible(
                            flex: analytics[1] + 10,
                            child: FractionallySizedBox(
                              widthFactor: _animation.value,
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    borderRadius: const BorderRadius.horizontal(
                                        right: Radius.circular(24))),
                                child: Center(
                                    child: Text(
                                  '${analytics[1]}%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                )),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: analytics[2],
                            child: Container(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: analytics[0],
                            child: FractionallySizedBox(
                              widthFactor: _animation.value,
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                    child: Text(
                                  '${analytics[0]}%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                )),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 100 - analytics[0],
                            child: Container(),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      )
    ],
  );
}

Row geographyAnalytics(
    BuildContext context, Animation<double> _animation, List<int> analytics) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Expanded(
        flex: 2,
        child: Text(
          'Geography',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        flex: 5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    const Text(
                      ' Europe',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onSecondary,
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    const Text(
                      ' Americas',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    const Text(
                      ' Asia',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(24)),
                    ),
                    const Text(
                      ' Australia',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizedBox(
                  height: 28,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Flexible(
                            // 10 is added to make sure the third bar wraps around the second one
                            flex: 100 - (analytics[3] + 10),
                            child: Container(),
                          ),
                          Flexible(
                            flex: analytics[3] + 10,
                            child: FractionallySizedBox(
                              widthFactor: _animation.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(24),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  '${analytics[2]}%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            // 10 is added to make sure the third bar wraps around the second one
                            flex: 100 - (analytics[2] + analytics[3] + 10),
                            child: Container(),
                          ),
                          Flexible(
                            flex: analytics[2] + 10,
                            child: FractionallySizedBox(
                              widthFactor: _animation.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                  borderRadius: const BorderRadius.horizontal(
                                    right: Radius.circular(24),
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  '${analytics[2]}%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                )),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: analytics[3],
                            child: Container(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            // 10 is added to make sure the second bar wraps around the first one
                            flex: 100 - (analytics[1] + analytics[2] + 10),
                            child: Container(),
                          ),
                          Flexible(
                            flex: analytics[1] + 10,
                            child: FractionallySizedBox(
                              widthFactor: _animation.value,
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                    borderRadius: const BorderRadius.horizontal(
                                        right: Radius.circular(24))),
                                child: Center(
                                    child: Text(
                                  '${analytics[1]}%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                )),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: analytics[2],
                            child: Container(),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                            flex: analytics[0],
                            child: FractionallySizedBox(
                              widthFactor: _animation.value,
                              child: Container(
                                height: 28,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Center(
                                    child: Text(
                                  '${analytics[0]}%',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary),
                                )),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 100 - analytics[0],
                            child: Container(),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      )
    ],
  );
}
