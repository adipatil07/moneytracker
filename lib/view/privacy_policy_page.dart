import 'package:flutter/material.dart';

import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';
class PrivacySettingsPage extends StatelessWidget {
  const PrivacySettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Settings', style: StyleUtility.appBarTextStyle),
        backgroundColor: ColorsUtility.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Settings',
              style: StyleUtility.cardHeadingTextStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(
              'Manage who can see your activity and personal information.',
              style: StyleUtility.normalTextStyle.copyWith(color: Colors.grey),
            ),
            const SizedBox(height: 20),
            // Add more privacy settings options here
          ],
        ),
      ),
    );
  }
}
