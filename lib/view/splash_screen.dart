import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneytracker/provider/auth_provider.dart' as auth;
import 'package:moneytracker/utils/colors_utility.dart';
import 'package:moneytracker/view/home_screen.dart';
import 'package:moneytracker/view/welcome_page.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Future<User?> _initializeAuthProvider(BuildContext context) async {
    final authProvider = Provider.of<auth.AuthProvider>(context, listen: false);
    await Future.delayed(const Duration(seconds: 3), () {});
    return authProvider.user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeAuthProvider(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildSplashScreenContent();
          } else {
            if (snapshot.data != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              });
            } else {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WelcomePage()),
                );
              });
            }
            return _buildSplashScreenContent(); // Keep showing the splash screen until navigation completes
          }
        },
      ),
    );
  }

  Widget _buildSplashScreenContent() {
    return Stack(
      children: [
        Container(
          color: Colors.white,
        ),
        const Positioned(
          top: -50,
          left: -50,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: ColorsUtility.primaryColor,
          ),
        ),
        const Positioned(
          top: 100,
          right: -50,
          child: CircleAvatar(
            radius: 80,
            backgroundColor: ColorsUtility.accentColor,
          ),
        ),
        const Positioned(
          bottom: 100,
          left: 50,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: ColorsUtility.faintBgColor,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.jpg', // Replace with your actual logo path
                height: 100,
              ),
              const SizedBox(height: 20),
              const Text(
                'MoneyTracker',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Earn • Save • Manage',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
