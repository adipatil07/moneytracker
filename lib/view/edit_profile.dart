import 'package:flutter/material.dart';

import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: StyleUtility.appBarTextStyle),
        backgroundColor: ColorsUtility.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/userprofile.jpg'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save changes
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsUtility.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              child: Text('Save Changes', style: StyleUtility.buttonTextStyle.copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
