import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:retail_intel_v2/ui/config/responsive.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';

class BarChartComponent extends StatefulWidget {
  const BarChartComponent({super.key});

  @override
  State<BarChartComponent> createState() => _BarChartComponentState();
}

class _BarChartComponentState extends State<BarChartComponent> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          borderData: FlBorderData(show: false),
          alignment: BarChartAlignment.spaceBetween,
          axisTitleData:
              FlAxisTitleData(leftTitle: AxisTitle(reservedSize: 20)),
          gridData:
              FlGridData(drawHorizontalLine: true, horizontalInterval: 30),
          titlesData: FlTitlesData(
              leftTitles: SideTitles(
                reservedSize: 30,
                getTextStyles: (value) =>
                    const TextStyle(color: Colors.grey, fontSize: 12),
                showTitles: true,
                getTitles: (value) {
                  switch (value) {
                    case 0:
                      return '0';
                    case 30:
                      return '30k';
                    case 60:
                      return '60k';
                    case 90:
                      return '90k';
                    default:
                      return '';
                  }
                },
              ),
              bottomTitles: SideTitles(
                showTitles: true,
                getTextStyles: (value) =>
                    const TextStyle(color: Colors.grey, fontSize: 12),
                getTitles: (value) {
                  switch (value) {
                    case 0:
                      return 'JAN';
                    case 1:
                      return 'FEB';
                    case 2:
                      return 'MAR';
                    case 3:
                      return 'APR';
                    case 4:
                      return 'MAY';
                    case 5:
                      return 'JUN';
                    case 2:
                      return 'MAR';
                    case 6:
                      return 'JUL';

                    case 7:
                      return 'AUG';
                    case 8:
                      return 'SEP';
                    case 9:
                      return 'OCT';
                    case 10:
                      return 'NOV';
                    case 11:
                      return 'DEC';
                    default:
                      return '';
                  }
                },
              )),
          barGroups: [
            BarChartGroupData(x: 0, barRods: [
              BarChartRodData(
                  y: 10,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg])),
            ]),
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(
                  y: 50,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(
                  y: 30,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(
                  y: 80,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(
                  y: 70,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(
                  y: 20,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 6, barRods: [
              BarChartRodData(
                  y: 90,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 7, barRods: [
              BarChartRodData(
                  y: 60,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 8, barRods: [
              BarChartRodData(
                  y: 90,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 9, barRods: [
              BarChartRodData(
                  y: 10,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 10, barRods: [
              BarChartRodData(
                  y: 40,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
            BarChartGroupData(x: 11, barRods: [
              BarChartRodData(
                  y: 80,
                  colors: [Colors.black],
                  borderRadius: BorderRadius.circular(0),
                  width: Responsive.isDesktop(context) ? 40 : 10,
                  backDrawRodData: BackgroundBarChartRodData(
                      y: 90, show: true, colors: [AppColors.barBg]))
            ]),
          ]),
      swapAnimationDuration: const Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}
