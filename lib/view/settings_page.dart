import 'package:flutter/material.dart';
import 'package:moneytracker/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:moneytracker/view/login_page.dart';
import 'package:moneytracker/view/privacy_policy_page.dart';

import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';
import 'change_pass_page.dart';
import 'edit_profile.dart';
import 'notification_page.dart';

class Settings_Page extends StatelessWidget {
  const Settings_Page({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings', style: StyleUtility.appBarTextStyle),
        backgroundColor: ColorsUtility.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/userprofile.jpg'), // Add a user profile picture in your assets
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'John Doe',
                style: StyleUtility.cardHeadingTextStyle.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 5),
              Text(
                'john.doe@example.com',
                style: StyleUtility.normalTextStyle.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.person, color: ColorsUtility.primaryColor),
                  title: Text('Edit Profile', style: StyleUtility.mediumTextStyle),
                  trailing: const Icon(Icons.arrow_forward_ios, color: ColorsUtility.primaryColor),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const EditProfilePage()));
                    // Navigate to edit profile page
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.lock, color: ColorsUtility.primaryColor),
                  title: Text('Change Password', style: StyleUtility.mediumTextStyle),
                  trailing: const Icon(Icons.arrow_forward_ios, color: ColorsUtility.primaryColor),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const ChangePasswordPage()));
                    // Navigate to change password page
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.notifications, color: ColorsUtility.primaryColor),
                  title: Text('Notification Settings', style: StyleUtility.mediumTextStyle),
                  trailing: const Icon(Icons.arrow_forward_ios, color: ColorsUtility.primaryColor),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const NotificationSettingsPage()));
                    // Navigate to notification settings page
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.privacy_tip, color: ColorsUtility.primaryColor),
                  title: Text('Privacy Settings', style: StyleUtility.mediumTextStyle),
                  trailing: const Icon(Icons.arrow_forward_ios, color: ColorsUtility.primaryColor),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>const PrivacySettingsPage()));
                    // Navigate to privacy settings page
                  },
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: Text('Logout', style: StyleUtility.mediumTextStyle.copyWith(color: Colors.red)),
                  trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
                  onTap: () async {
                    // Perform logout operation
                    await Provider.of<AuthProvider>(context, listen: false).signOut();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder) => LoginPage()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
