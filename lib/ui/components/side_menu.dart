import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retail_intel_v2/constants/constants.dart';
import 'package:retail_intel_v2/ui/config/size_config.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
          color: AppColors.secondaryBg,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                alignment: Alignment.topCenter,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: SizedBox(
                  width: 35,
                  height: 20,
                  child: SvgPicture.asset('assets/icons/mac-action.svg'),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/Message.svg',
                  color: iconColor,
                ),
                tooltip: 'M E S S A G E S',
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              SizedBox(
                width: 40,
                height: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/salary.svg',
                    color: iconColor,
                  ),
                  tooltip: 'S A L E S',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
