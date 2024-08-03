import 'package:flutter/material.dart';
import 'package:moneytracker/provider/auth_provider.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<AuthProvider>(
          builder: (BuildContext context, AuthProvider value, Widget? child) {
            if(value.user == null){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return  Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: value.user!.photoURL != null ?
                      NetworkImage(value.user!.photoURL!):
                  const AssetImage('assets/images/userprofile.jpg'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: value.user!.displayName ?? 'Name',
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: value.user!.phoneNumber ?? 'Phone Number',
                    border: const OutlineInputBorder(),
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
            );
          },
          // child: Column(
          //   children: [
          //     const CircleAvatar(
          //       radius: 50,
          //       backgroundImage: AssetImage('assets/images/userprofile.jpg'),
          //     ),
          //     const SizedBox(height: 20),
          //     TextFormField(
          //       decoration: const InputDecoration(
          //         labelText: 'Name',
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //     const SizedBox(height: 20),
          //     TextFormField(
          //       decoration: const InputDecoration(
          //         labelText: 'Email',
          //         border: OutlineInputBorder(),
          //       ),
          //     ),
          //     const SizedBox(height: 20),
          //     ElevatedButton(
          //       onPressed: () {
          //         // Save changes
          //       },
          //       style: ElevatedButton.styleFrom(
          //         backgroundColor: ColorsUtility.primaryColor,
          //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          //       ),
          //       child: Text('Save Changes', style: StyleUtility.buttonTextStyle.copyWith(color: Colors.white)),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }
}
