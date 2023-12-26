import 'package:flutter/material.dart';
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
    return const SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            text: 'Dashboard',
            size: 30.0,
            fontWeight: FontWeight.w800,
            color: Colors.brown,
          ),
          PrimaryText(
            text: "Here's a summary of your activities...",
            size: 16.0,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: AppColors.secondary,
          ),
        ],
      ),
    );
  }
}
