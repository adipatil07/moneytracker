import 'package:flutter/material.dart';
import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';

class AccountSettingsPage extends StatefulWidget {
  const AccountSettingsPage({super.key});

  @override
  State<AccountSettingsPage> createState() => _AccountSettingsPageState();
}

class _AccountSettingsPageState extends State<AccountSettingsPage> {
  String username = "John Doe";
  String email = "john.doe@example.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account Settings", style: StyleUtility.appBarTextStyle),
        backgroundColor: ColorsUtility.primaryColor,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            color: ColorsUtility.faintBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text("Username", style: StyleUtility.mediumTextStyle),
              subtitle: Text(username, style: StyleUtility.normalTextStyle),
              trailing: Icon(Icons.edit),
              onTap: () {
                // handle username change
                _editUsername(context);
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            color: ColorsUtility.faintBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text("Email", style: StyleUtility.mediumTextStyle),
              subtitle: Text(email, style: StyleUtility.normalTextStyle),
              trailing: Icon(Icons.edit),
              onTap: () {
                // handle email change
                _editEmail(context);
              },
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            color: ColorsUtility.faintBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text("Change Password", style: StyleUtility.mediumTextStyle),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // navigate to change password page
                _changePassword(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _editUsername(BuildContext context) async {
    String? newUsername = await _showEditDialog(context, "Edit Username", username);
    if (newUsername != null && newUsername.isNotEmpty) {
      setState(() {
        username = newUsername;
      });
    }
  }

  Future<void> _editEmail(BuildContext context) async {
    String? newEmail = await _showEditDialog(context, "Edit Email", email);
    if (newEmail != null && newEmail.isNotEmpty) {
      setState(() {
        email = newEmail;
      });
    }
  }

  Future<void> _changePassword(BuildContext context) async {
    // implement password change functionality
  }

  Future<String?> _showEditDialog(BuildContext context, String title, String initialText) {
    TextEditingController controller = TextEditingController(text: initialText);
    return showDialog<String>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: "Enter new value"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: Text("Save"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }
}
