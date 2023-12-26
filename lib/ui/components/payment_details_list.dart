import 'package:flutter/material.dart';
import 'package:retail_intel_v2/constants/constants.dart';
import 'package:retail_intel_v2/data.dart';
import 'package:retail_intel_v2/ui/components/payment_list_tile.dart';
import 'package:retail_intel_v2/ui/config/size_config.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';
import 'package:retail_intel_v2/ui/style/style.dart';

class PaymentDetailsList extends StatefulWidget {
  const PaymentDetailsList({super.key});

  @override
  State<PaymentDetailsList> createState() => _PaymentDetailsListState();
}

class _PaymentDetailsListState extends State<PaymentDetailsList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: AppColors.iconColors,
                blurRadius: 15.0,
                offset: Offset(10.0, 15.0),
              ),
            ],
          ),
          child: Image.asset('assets/images/card.png'),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryText(
              text: 'Recent Activities',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: currentDate,
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
            recentActivities.length,
            (index) => PaymentListTile(
              icon: recentActivities[index]['icon'],
              label: recentActivities[index]['label'],
              amount: recentActivities[index]['amount'],
            ),
          ),
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PrimaryText(
              text: 'Upcoming Payments',
              size: 18,
              fontWeight: FontWeight.w800,
            ),
            PrimaryText(
              text: currentDate,
              size: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondary,
            ),
          ],
        ),
        SizedBox(
          height: SizeConfig.blockSizeVertical! * 2,
        ),
        Column(
          children: List.generate(
            upcomingPayments.length,
            (index) => PaymentListTile(
              icon: upcomingPayments[index]['icon'],
              label: upcomingPayments[index]['label'],
              amount: upcomingPayments[index]['amount'],
            ),
          ),
        ),
      ],
    );
  }
}
