import 'package:flutter/material.dart';

import '../utils/colors_utility.dart';

class IncomeExpenseToggle extends StatefulWidget {
  const IncomeExpenseToggle({super.key});

  @override
  _IncomeExpenseToggleState createState() => _IncomeExpenseToggleState();
}

class _IncomeExpenseToggleState extends State<IncomeExpenseToggle> {
  List<bool> isSelected = [true, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int index) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            isSelected[i] = i == index;
          }
        });
      },
      borderRadius: BorderRadius.circular(10),
      selectedColor: Colors.white,
      fillColor: ColorsUtility.primaryColor,
      color: Colors.black,
      borderWidth: 2,
      constraints: BoxConstraints.expand(width: MediaQuery.of(context).size.width*0.45,height: 50),
      borderColor: ColorsUtility.darkBgColor,
      selectedBorderColor: ColorsUtility.darkBgColor,
      children: const <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Income'),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text('Expense'),
        ),
      ],
    );
  }
}
