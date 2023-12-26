import 'package:retail_intel_v2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retail_intel_v2/ui/style/style.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key,
      required this.title,
      required this.svgSrc,
      required this.tap});

  final String title, svgSrc;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: tap,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: primaryColor,
        height: 18,
      ),
      title: PrimaryText(
        text: title,
        color: const Color.fromARGB(255, 142, 112, 101),
        size: 14,
      ),
    );
  }
}
