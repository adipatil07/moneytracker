import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:moneytracker/provider/auth_provider.dart';
import 'package:moneytracker/utils/colors_utility.dart';
import 'package:moneytracker/utils/style_utility.dart';
import 'package:moneytracker/view/home_screen.dart';
import 'package:moneytracker/view/login_page.dart';
import 'package:moneytracker/view/splash_screen.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if(kIsWeb){
    await Firebase.initializeApp(options: const FirebaseOptions(
        apiKey: "AIzaSyCEPXLhS-XAKp6EW1uVjbpMQoJ2NmUO7A4",
        authDomain: "moneytracker-a2532.firebaseapp.com",
        projectId: "moneytracker-a2532",
        storageBucket: "moneytracker-a2532.appspot.com",
        messagingSenderId: "343936104382",
        appId: "1:343936104382:web:0432d813b67f660724ebef",
        measurementId: "G-YQCH98FLNL"
    ));
  // }
  // else{
  //   await Firebase.initializeApp();
  // }
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>AuthProvider())
          ],
          child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'JosefinSans',
        primaryColor: ColorsUtility.primaryColor,
        primaryColorDark: ColorsUtility.darkBgColor,
        appBarTheme: AppBarTheme(
            titleTextStyle: StyleUtility.appBarTextStyle,
            backgroundColor: ColorsUtility.primaryColor
        ),
        primaryIconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
        inputDecorationTheme: InputDecorationTheme(
          suffixStyle: const TextStyle(color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          // filled: true,
          // fillColor: ColorsUtility.faintBgColor,
          errorStyle: const TextStyle(fontSize: 12.0),
          labelStyle: const TextStyle(fontSize: 16.0,color: Colors.black,fontWeight: FontWeight.w500),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: ColorsUtility.faintBgColor,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: ColorsUtility.darkBgColor,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 50),
            textStyle: StyleUtility.buttonTextStyle.copyWith(color: Colors.white),
            backgroundColor: ColorsUtility.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            iconColor: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home:  SplashScreen()
      // Consumer<AuthProvider>(
      //     builder: (context,authProvider,child){
      //       if(authProvider.user != null){
      //         return HomeScreen();
      //       }
      //       else{
      //         return LoginPage();
      //       }
      //     },
      //    ),
    );
  }
}
