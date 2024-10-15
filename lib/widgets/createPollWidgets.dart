import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surveva_app/pages/create%20poll/QMSPage.dart';
import 'package:surveva_app/pages/discovery/DiscoveryPage.dart';

Widget startSurveyModal(BuildContext context) {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: SizedBox(
      height: 370,
      width: 330,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
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
                            cancelSurveyModal(context)
                      ],
                    );
                      } ));
                    },
                    child: SvgPicture.asset('assets/create poll/close.svg'))
              ],
            ),
          ),
          Center(
            child: SvgPicture.asset('assets/create poll/start_survey.svg'),
          ),
          const SizedBox(
            height: 12,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Take a 10-question survey to publish your survey!',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const QMSPage()));
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
                    'Start',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Dialog cancelSurveyModal(BuildContext context) {
  return Dialog(
    backgroundColor: const Color(0xffF5F5F5).withOpacity(0.7),
    child: SizedBox(
      height: 225,
      width: 350,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Cancel action?',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: 241,
                    child: Text(
                      'If you go back, your survey will not be published.',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
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
                  'Continue publishing',
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscoveryPage()));
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
                      fontWeight: FontWeight.w400,
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
