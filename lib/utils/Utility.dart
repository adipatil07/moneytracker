import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:moneytracker/utils/style_utility.dart';

import 'colors_utility.dart';
class Utility {
  Widget dashBoardCard(BuildContext context) {


    return Row(
      children: [
        Expanded(
          child: Card(
            color: ColorsUtility.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.money),
                      Text(
                        "Income",
                        style: StyleUtility.cardHeadingTextStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    "15540",
                    style: StyleUtility.mediumTextStyle.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Card(
            color: ColorsUtility.primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.money),
                      Text(
                        "Expense",
                        style: StyleUtility.cardHeadingTextStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  Text(
                    "15540",
                    style: StyleUtility.mediumTextStyle.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget barChart(BuildContext context){
  //   return Container(
  //     height: 250,
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(15),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.1),
  //           blurRadius: 8,
  //           offset: Offset(0, 4),
  //         ),
  //       ],
  //     ),
  //     child: BarChart(
  //       BarChartData(
  //         alignment: BarChartAlignment.spaceAround,
  //         barGroups: [
  //           BarChartGroupData(
  //             x: 0,
  //             barRods: [
  //               BarChartRodData(
  //                 toY: 1000,
  //                 color: Colors.green,
  //                 width: 20,
  //               ),
  //             ],
  //             showingTooltipIndicators: [0],
  //           ),
  //           BarChartGroupData(
  //             x: 1,
  //             barRods: [
  //               BarChartRodData(
  //                 toY: 500,
  //                 color: Colors.red,
  //                 width: 20,
  //               ),
  //             ],
  //             showingTooltipIndicators: [0],
  //           ),
  //         ],
  //         titlesData: FlTitlesData(show: true),
  //         borderData: FlBorderData(show: false),
  //         gridData: FlGridData(show: false),
  //         // alignment: BarChartAlignment.spaceAround,
  //       ),
  //     ),
  //   );
  // }


  Widget barChart() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: 500,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: const TextStyle(color: Colors.black),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  switch (value.toInt()) {
                    case 0:
                      return const Text(
                          'Sun', style: TextStyle(color: Colors.black));
                    case 1:
                      return const Text(
                          'Mon', style: TextStyle(color: Colors.black));
                    case 2:
                      return const Text(
                          'Tue', style: TextStyle(color: Colors.black));
                    case 3:
                      return const Text(
                          'Wed', style: TextStyle(color: Colors.black));
                    case 4:
                      return const Text(
                          'Thu', style: TextStyle(color: Colors.black));
                    case 5:
                      return const Text(
                          'Fri', style: TextStyle(color: Colors.black));
                    case 6:
                      return const Text(
                          'Sat', style: TextStyle(color: Colors.black));
                  }
                  return Container();
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: 3000,
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 500),
                const FlSpot(1, 1500),
                const FlSpot(2, 1000),
                const FlSpot(3, 2000),
                const FlSpot(4, 2500),
                const FlSpot(5, 2800),
                const FlSpot(6, 3000),
              ],
              isCurved: true,
              gradient: const LinearGradient(
                colors: [Color(0xFFFF5B5B), Color(0xFF5B5BFF)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFFF5B5B).withOpacity(0.3),
                    const Color(0xFF5B5BFF).withOpacity(0.3),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            LineChartBarData(
              spots: [
                const FlSpot(0, 1000),
                const FlSpot(1, 800),
                const FlSpot(2, 600),
                const FlSpot(3, 1200),
                const FlSpot(4, 1800),
                const FlSpot(5, 2400),
                const FlSpot(6, 2900),
              ],
              isCurved: true,
              gradient: const LinearGradient(
                colors: [Color(0xFF5B5BFF), Color(0xFF5BFF5B)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFF5B5BFF).withOpacity(0.3),
                    const Color(0xFF5BFF5B).withOpacity(0.3),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
