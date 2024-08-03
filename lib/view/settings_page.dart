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
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings', style: StyleUtility.appBarTextStyle),
        backgroundColor: ColorsUtility.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              if (authProvider.user == null) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: authProvider.user!.photoURL != null
                          ? NetworkImage(authProvider.user!.photoURL!)
                          : const AssetImage('assets/images/userprofile.jpg')
                      as ImageProvider,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    authProvider.user!.displayName ?? 'John Doe',
                    style: StyleUtility.cardHeadingTextStyle.copyWith(fontSize: 24),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    authProvider.user!.email ?? 'john.doe@example.com',
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
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => const EditProfilePage()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => const ChangePasswordPage()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => const NotificationSettingsPage()));
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
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => const PrivacySettingsPage()));
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
                        await authProvider.signOut();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder) => LoginPage()));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
