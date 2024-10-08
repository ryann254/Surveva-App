import 'package:flutter/material.dart';

Widget notificationWidget() {
  return AlertDialog(
    backgroundColor: const Color(0xffF5F5F5),
    buttonPadding: EdgeInsets.zero,
    actionsPadding: EdgeInsets.zero,
    title: const Text(
      'Surveva App Would Like to \n Send you Notifications',
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      textAlign: TextAlign.center,
    ),
    content: const Text(
      'Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.',
      style: TextStyle(fontSize: 14),
      textAlign: TextAlign.center,
    ),
    actions: [
      Column(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
                bottom: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: TextButton(
              onPressed: () {},
              child: const Text('Allow'),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {},
              child: const Text('Don\'t Allow'),
            ),
          ),
        ],
      )
    ],
  );
}
