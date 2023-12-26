// Copyright 2023 crimsoft
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:retail_intel_v2/ui/components/appbar_action_items.dart';
import 'package:retail_intel_v2/ui/components/bar_chart_component.dart';
import 'package:retail_intel_v2/ui/components/header.dart';
import 'package:retail_intel_v2/ui/components/info_card.dart';
import 'package:retail_intel_v2/ui/components/payment_details_list.dart';
import 'package:retail_intel_v2/ui/components/side_menu.dart';
import 'package:retail_intel_v2/ui/config/size_config.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';
import 'package:retail_intel_v2/ui/style/style.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: SideMenu(),
            ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header(),
                      SizedBox(
                        height: SizeConfig.screenHeight! / 14,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          runSpacing: 10.0,
                          spacing: 10.0,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            InfoCard(
                              icon: 'assets/icons/credit-card.svg',
                              label: 'transfer via \n card number',
                              amount: '\$1200',
                              btn: TextButton(
                                onPressed: () {},
                                child: const PrimaryText(text: 'more details'),
                              ),
                            ),
                            InfoCard(
                              icon: 'assets/icons/transfer.svg',
                              label: 'transfer via \n online banks',
                              amount: '\$150',
                              btn: TextButton(
                                onPressed: () {},
                                child: const PrimaryText(text: 'more details'),
                              ),
                            ),
                            InfoCard(
                              icon: 'assets/icons/bank.svg',
                              label: 'transfer via \n card number',
                              amount: '\$1300',
                              btn: TextButton(
                                onPressed: () {},
                                child: const PrimaryText(text: 'more details'),
                              ),
                            ),
                            InfoCard(
                              icon: 'assets/icons/invoice.svg',
                              label: 'transfer via \n card number',
                              amount: '\$1100',
                              btn: TextButton(
                                onPressed: () {},
                                child: const PrimaryText(text: ''),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 4,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              PrimaryText(
                                text: 'Balance',
                                size: 16,
                                fontWeight: FontWeight.w800,
                                color: AppColors.secondary,
                              ),
                              PrimaryText(
                                text: '\$1500',
                                size: 30,
                                fontWeight: FontWeight.w800,
                                color: AppColors.secondary,
                              ),
                            ],
                          ),
                          PrimaryText(
                            text: 'Past 30 days',
                            size: 16,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                      const SizedBox(
                        height: 180,
                        child: BarChartComponent(),
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 5,
                      ),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: 'History',
                            size: 30,
                            fontWeight: FontWeight.w800,
                            color: AppColors.secondary,
                          ),
                          PrimaryText(
                            text: "Last 6 months' transactions",
                            size: 16,
                            fontWeight: FontWeight.w800,
                            color: AppColors.secondary,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeVertical! * 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                height: SizeConfig.screenHeight,
                color: AppColors.secondaryBg,
                padding: const EdgeInsets.symmetric(
                  vertical: 30.0,
                  horizontal: 30.0,
                ),
                child: const SingleChildScrollView(
                  child: Column(
                    children: [
                      AppBarActionItems(),
                      PaymentDetailsList(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
