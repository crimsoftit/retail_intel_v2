import 'package:flutter/material.dart';
import 'package:retail_intel_v2/constants/constants.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';
import 'package:retail_intel_v2/ui/style/style.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PrimaryText(
                text: 'Dashboard',
                size: 30.0,
                fontWeight: FontWeight.w800,
              ),
              PrimaryText(
                text: 'Payment updates',
                size: 16.0,
                fontWeight: FontWeight.w800,
                color: AppColors.secondary,
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 1,
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.only(
                left: 40.0,
                right: 5.0,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: const BorderSide(color: AppColors.white),
              ),
              prefixIcon: Icon(
                Icons.search,
                color: iconColor,
              ),
              hintText: 'Search...',
              hintStyle: const TextStyle(
                color: AppColors.secondary,
                fontSize: 14.0,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
