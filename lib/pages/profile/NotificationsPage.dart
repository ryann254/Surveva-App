import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _pauseAll = false;
  bool _likeNotifications = true;
  bool _commentNotifications = true;
  bool _newVoteNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 37,
          ),
          notificationWidget('Pause all', _pauseAll, (value) {
            setState(() {
              _pauseAll = value;
              if (_pauseAll) {
                _likeNotifications = false;
                _commentNotifications = false;
                _newVoteNotifications = false;
              }
            });
          }),
          notificationWidget('Like notifications', _likeNotifications, (value) {
            setState(() {
              _likeNotifications = value;
            });
          }, enabled: !_pauseAll),
          notificationWidget('Comment notifications', _commentNotifications, (value) {
            setState(() {
              _commentNotifications = value;
            });
          }, enabled: !_pauseAll),
          notificationWidget('New vote', _newVoteNotifications, (value) {
            setState(() {
              _newVoteNotifications = value;
            });
          }, enabled: !_pauseAll),
        ],
      )),
    );
  }

  Padding notificationWidget(String title, bool value, Function(bool) onChanged, {bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w400,
              color: enabled ? Colors.black : Colors.grey,
            ),
          ),
          Switch(
            value: value,
            onChanged: enabled ? onChanged : null,
          ),
        ],
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
  return AppBar(
    leading: GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 10.0),
        child: SvgPicture.asset('assets/create poll/back_button.svg'),
      ),
      onTap: () {
        Navigator.pop(context);
      },
    ),
    title: const Text(
      'Settings',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
    ),
    centerTitle: true,
  );
}
