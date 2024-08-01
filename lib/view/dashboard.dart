import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/Utility.dart';
import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String todayDate = DateFormat('MMMM dd, yyyy').format(DateTime.now()); // Get today's date

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.35,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [ColorsUtility.primaryColor, ColorsUtility.accentColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Add padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.person, color: ColorsUtility.primaryColor),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Hello, User!",
                        style: StyleUtility.mediumTextStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.account_balance_wallet, color: Colors.white),
                      const SizedBox(width: 10),
                      Text(
                        "Total Balance",
                        style: StyleUtility.largeTextStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "\$122500",
                    style: StyleUtility.largeTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    todayDate,
                    style: StyleUtility.mediumTextStyle.copyWith(color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 60, // Adjust this value based on the card height
            child: Stack(
              clipBehavior: Clip.none, // Allow overflow
              children: [
                Positioned(
                  left: 20,
                  right: 20,
                  top: -50, // Adjust this value based on the card height
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadowColor: Colors.black54,
                        child: Container(
                          width: width * 0.40, // Adjust the width as needed
                          height: height*0.14, // Adjust the height as needed
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.arrow_upward, color: Colors.green),
                              Text(
                                'Income',
                                style: StyleUtility.mediumTextStyle,
                              ),
                              Text(
                                '\$1000', // Example amount
                                style: StyleUtility.largeTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        shadowColor: Colors.black54,
                        child: Container(
                          width: width * 0.40, // Adjust the width as needed
                          height: height*0.14, // Adjust the height as needed
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.arrow_downward, color: Colors.red),
                              Text(
                                'Expense',
                                style: StyleUtility.mediumTextStyle,
                              ),
                              Text(
                                '\$500', // Example amount
                                style: StyleUtility.largeTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20,),
          Expanded(child: Utility().barChart()),
        ],
      ),
    );
  }
}
