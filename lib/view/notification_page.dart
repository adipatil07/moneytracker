import 'package:flutter/material.dart';

import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';

class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _emailNotifications = true;
  bool _pushNotifications = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings', style: StyleUtility.appBarTextStyle),
        backgroundColor: ColorsUtility.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SwitchListTile(
              title: Text('Email Notifications', style: StyleUtility.mediumTextStyle),
              value: _emailNotifications,
              onChanged: (bool value) {
                setState(() {
                  _emailNotifications = value;
                });
              },
              activeColor: ColorsUtility.primaryColor,
            ),
            SwitchListTile(
              title: Text('Push Notifications', style: StyleUtility.mediumTextStyle),
              value: _pushNotifications,
              onChanged: (bool value) {
                setState(() {
                  _pushNotifications = value;
                });
              },
              activeColor: ColorsUtility.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
