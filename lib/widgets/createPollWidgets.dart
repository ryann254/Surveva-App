import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:surveva_app/pages/create%20poll/QMSPage.dart';
import 'package:surveva_app/pages/discovery/DiscoveryPage.dart';
import 'package:surveva_app/pages/payments/PremiumPage.dart';

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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
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
                      }));
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

Widget endSurveyModal(BuildContext context) {
  return Dialog(
    insetPadding: EdgeInsets.zero,
    child: SizedBox(
      height: 535,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const DiscoveryPage()));
                    },
                    child: SvgPicture.asset('assets/create poll/close.svg'))
              ],
            ),
          ),
          Center(
            child: SvgPicture.asset('assets/create poll/poll_success.svg'),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            child: Column(
              children: [
                const Text(
                  'Your Survey has been posted!',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Go beyond limitations and unlock additional voting options and insights into user response analytics.',
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/create poll/results.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Get your result faster',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/create poll/statistics.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Get more statistical analyses',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/create poll/more.svg'),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text(
                            'Get more Surveva',
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const PremiumPage()));
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
                        'Premium',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DiscoveryPage()));
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

Row responsesAnalytics(
    BuildContext context, Animation<double> _animation, List<int> analytics) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      const Expanded(
        flex: 2,
        child: Text(
          'Responses',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ),
      Expanded(
        flex: 5,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(analytics.length, (index) {
                return Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: _getColor(context, index),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(
              height: 4,
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return SizedBox(
                  height: 28,
                  child: Row(
                    children: List.generate(analytics.length, (index) {
                      return Flexible(
                        flex: analytics[index],
                        child: FractionallySizedBox(
                          widthFactor: _animation.value,
                          child: Container(
                            decoration: BoxDecoration(
                              color: _getColor(context, index),
                              borderRadius: BorderRadius.horizontal(
                                right: index == analytics.length - 1
                                    ? const Radius.circular(24)
                                    : Radius.zero,
                                left: index == 0
                                    ? const Radius.circular(24)
                                    : Radius.zero,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${analytics[index]}%',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: index == 2
                                      ? Theme.of(context).colorScheme.onSurface
                                      : Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
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

Color _getColor(BuildContext context, int index) {
  switch (index) {
    case 0:
      return Theme.of(context).primaryColor;
    case 1:
      return Theme.of(context).colorScheme.onSurface;
    case 2:
      return Theme.of(context).colorScheme.onPrimary;
    default:
      // Add more colors if needed for additional analytics
      return Theme.of(context).colorScheme.secondary;
  }
}
