
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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