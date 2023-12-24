// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';
import 'package:retail_intel_v2/ui/style/style.dart';

class PaymentListTile extends StatelessWidget {
  final String? icon;
  final String? label;
  final String? amount;

  const PaymentListTile(
      {super.key, @required this.icon, this.label, this.amount});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 0,
        right: 20.0,
      ),
      visualDensity: VisualDensity.standard,
      leading: Container(
        width: 50.0,
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: SvgPicture.asset(
          icon!,
          width: 20.0,
          //color: AppColors.secondary,
        ),
      ),
      title: PrimaryText(
        text: label!,
        size: 14.0,
        fontWeight: FontWeight.w500,
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const PrimaryText(
            text: 'successfully...',
            size: 12.0,
            color: AppColors.secondary,
          ),
          PrimaryText(
            text: amount!,
            size: 16.0,
            color: AppColors.secondary,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
