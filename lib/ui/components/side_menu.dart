import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retail_intel_v2/ui/config/size_config.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: 200,
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
                  color: AppColors.iconGray,
                ),
                iconSize: 20,
                padding: const EdgeInsets.symmetric(vertical: 20),
              ),
              SizedBox(
                width: 40,
                height: 50,
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    'assets/icons/sales_1 .svg',
                    color: AppColors.iconGray,
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
