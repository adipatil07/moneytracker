import 'dart:math';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../utils/colors_utility.dart';
import '../utils/style_utility.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final Map<String, double> categoryExpenses = {
    'Food and Drink': 30.0,
    'Transport': 14.0,
    'Shopping': 18.0,
    'Internet Data': 20.0,
    'Education': 15.0,
    'Others': 3.0,
  };

  List chartData = [
    [40, 'Rent', Colors.white],
    [20, 'Transport', Colors.orange],
    [15, 'Money', Colors.grey],
    [30, 'Etc', Colors.green],
    [10, 'Others', Colors.black],
    [50, 'Education', Colors.red],
  ];

  String selectedToggle = 'Daily';


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height * 0.40,
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Text("History", style: StyleUtility.appBarTextStyle),
                  Expanded(
                    child: SfCircularChart(
                      margin: const EdgeInsets.all(0),
                      series: [
                        PieSeries(
                          dataSource: chartData,
                          yValueMapper: (data, _) => data[0],
                          xValueMapper: (data, _) => data[1],
                          radius: '70',
                          explode: true,
                          pointColorMapper: (data, _) => data[2],
                          dataLabelMapper: (data, _) => '${data[0]}K',
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: StyleUtility.mediumTextStyle.copyWith(color: Colors.white),
                            labelPosition: ChartDataLabelPosition.outside,
                          ),
                        ),
                      ],
                      legend: Legend(
                        isVisible: true,
                        position: LegendPosition.bottom,
                        textStyle: StyleUtility.mediumTextStyle.copyWith(color: Colors.white),
                        orientation: LegendItemOrientation.horizontal,
                        iconHeight: 20,
                        iconWidth: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            color: ColorsUtility.faintBgColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ToggleButton(
                      text: 'Daily',
                      isSelected: selectedToggle == 'Daily',
                      onTap: () => setState(() => selectedToggle = 'Daily'),
                    ),
                  ),
                  Expanded(
                    child: ToggleButton(
                      text: 'Weekly',
                      isSelected: selectedToggle == 'Weekly',
                      onTap: () => setState(() => selectedToggle = 'Weekly'),
                    ),
                  ),
                  Expanded(
                    child: ToggleButton(
                      text: 'Monthly',
                      isSelected: selectedToggle == 'Monthly',
                      onTap: () => setState(() => selectedToggle = 'Monthly'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: categoryExpenses.length,
                itemBuilder: (context, index) {
                  String key = categoryExpenses.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Card(
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        // tileColor: ColorsUtility.faintBgColor,
                        leading: Icon(Icons.circle, color: chartData[index][2]),
                        title: Text(key, style: StyleUtility.mediumTextStyle),
                        subtitle: Text('10/10/2020', style: StyleUtility.normalTextStyle),
                        trailing: Text('IDR ${categoryExpenses[key]}', style: StyleUtility.mediumTextStyle),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const ToggleButton({
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        // margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: isSelected ? ColorsUtility.primaryColor : ColorsUtility.faintBgColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: StyleUtility.normalTextStyle.copyWith(color: isSelected ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
