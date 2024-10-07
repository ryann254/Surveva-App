import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Positioned bottomNavigationWidget(
    String navigation, Function setNavigation, BuildContext context) {
  return Positioned(
    left: 16,
    right: 16,
    bottom: 16,
    child: Container(
      padding: const EdgeInsets.all(5),
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
                      size: navigation == 'discovery' ? 20 : 24,
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
                    height: navigation == 'create' ? 20 : 24,
                    width: navigation == 'create' ? 20 : 24,
                    colorFilter: navigation == 'create'
                        ? ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimary,
                            BlendMode.srcIn)
                        : null,
                  ),
                  const SizedBox(width: 5),
                  if (navigation == 'create')
                    Text(
                      'Create',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
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
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.surface,
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
                        ? ColorFilter.mode(
                            Theme.of(context).colorScheme.onPrimary,
                            BlendMode.srcIn)
                        : null,
                  ),
                  const SizedBox(width: 5),
                  if (navigation == 'profile')
                    Text(
                      'Profile',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.onPrimary),
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
