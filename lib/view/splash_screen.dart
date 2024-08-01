import 'package:flutter/material.dart';
import 'package:moneytracker/provider/auth_provider.dart';
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
    _navigateToNextPage();
  }

  _navigateToNextPage() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    if (authProvider.user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
                  'assets/images/logo.jpg',  // Replace with your actual logo path
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
      ),
    );
  }
}
