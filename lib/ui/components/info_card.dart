import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retail_intel_v2/ui/config/size_config.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';
import 'package:retail_intel_v2/ui/style/style.dart';

class InfoCard extends StatefulWidget {
  final String? icon;
  final String? label;
  final String? amount;
  final TextButton btn;

  const InfoCard({
    super.key,
    required this.icon,
    required this.label,
    required this.amount,
    required this.btn,
  });

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 200.0,
      ),
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 20.0,
        bottom: 20.0,
        right: 20.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: AppColors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            widget.icon!,
            width: 35.0,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          PrimaryText(
            text: widget.label!,
            color: AppColors.secondary,
            size: 16.0,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
          PrimaryText(
            text: widget.amount!,
            fontWeight: FontWeight.w700,
            size: 18.0,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical! * 2,
          ),
        ],
      ),
    );
  }
}
