import 'package:flutter/material.dart';

import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password', style: StyleUtility.appBarTextStyle),
        backgroundColor: ColorsUtility.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Current Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'New Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Change password
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsUtility.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text('Change Password', style: StyleUtility.buttonTextStyle.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
