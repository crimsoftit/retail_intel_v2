import 'package:flutter/material.dart';
import 'package:retail_intel_v2/data.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';
import 'package:retail_intel_v2/ui/style/style.dart';

class HistoryTable extends StatefulWidget {
  const HistoryTable({super.key});

  @override
  State<HistoryTable> createState() => _HistoryTableState();
}

class _HistoryTableState extends State<HistoryTable> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: double.infinity,
        child: Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: List.generate(
            transactionHistory.length,
            (index) => TableRow(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                    left: 20.0,
                  ),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundImage:
                        NetworkImage(transactionHistory[index]['avatar']!),
                  ),
                ),
                PrimaryText(
                  text: transactionHistory[index]['label']!,
                  size: 16,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['time']!,
                  size: 16,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['amount']!,
                  size: 16,
                  color: AppColors.secondary,
                ),
                PrimaryText(
                  text: transactionHistory[index]['status']!,
                  size: 16,
                  color: AppColors.secondary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
