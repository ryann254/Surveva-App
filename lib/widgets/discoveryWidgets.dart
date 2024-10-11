import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


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
