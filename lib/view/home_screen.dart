import 'package:flutter/material.dart';
import 'package:moneytracker/view/settings_page.dart';

import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';
import 'add_transaction.dart';
import 'category_page.dart';
import 'dashboard.dart';
import 'history_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getBottomAppBar(),
      body: _getCurrentScreen(),
    );
  }

  Widget _getCurrentScreen() {
    switch (_selectedIndex) {
      case 0:
        return const Dashboard();
      case 1:
        return const CategoryPage();
      case 2:
        return const AddTransaction();
      case 3:
        return const HistoryPage();
      case 4:
        return const Settings_Page();
      default:
        return Container();
    }
  }

  Widget getBottomAppBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: ColorsUtility.darkBgColor,
      // selectedItemColor: ColorsUtility.selectedTextColor,
      unselectedItemColor: Colors.white,
      // selectedLabelStyle: TextStyle(color: ColorsUtility.selectedTextColor),

      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            activeIcon:
            Icon(Icons.home,),
            label: 'Home',
            backgroundColor: ColorsUtility.darkBgColor
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.category, color: Colors.white),
            activeIcon:
            Icon(Icons.category,),
            label: 'Category',
            backgroundColor: ColorsUtility.darkBgColor
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.white),
            activeIcon:
            Icon(Icons.add, ),
            label: 'Add Transaction',
            backgroundColor: ColorsUtility.darkBgColor
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.white),
            activeIcon: Icon(Icons.history,
               ),
            label: 'History',
            backgroundColor: ColorsUtility.darkBgColor
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined, color: Colors.white),
            activeIcon:
            Icon(Icons.settings, ),
            label: 'Settings',
            backgroundColor: ColorsUtility.darkBgColor
        ),
      ],
      // unselectedLabelStyle: const TextStyle(color: Colors.white),
    );
  }
}
