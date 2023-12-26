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
import 'package:retail_intel_v2/constants/constants.dart';
import 'package:retail_intel_v2/ui/components/appbar_action_items.dart';
import 'package:retail_intel_v2/ui/components/bar_chart_component.dart';
import 'package:retail_intel_v2/ui/components/drawer_menu.dart';
import 'package:retail_intel_v2/ui/components/header.dart';
import 'package:retail_intel_v2/ui/components/history_table.dart';
import 'package:retail_intel_v2/ui/components/info_card.dart';
import 'package:retail_intel_v2/ui/components/payment_details_list.dart';

import 'package:retail_intel_v2/ui/config/responsive.dart';
import 'package:retail_intel_v2/ui/config/size_config.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';
import 'package:retail_intel_v2/ui/style/style.dart';
import 'package:retail_intel_v2/utils/sql_helper.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    _stateUpdate();
    calculateInventoryValue();
    calculateTotalSales();
  }

  void _stateUpdate() {
    setState() {}

    debugPrint("refresh done");
  }

  num totalInvValue = 0;
  num totalSales = 0;

  // all inventory items in the database
  List inventoryList = [];

  // all sold item entries in the database
  List soldItems = [];

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final TextEditingController _searchController = TextEditingController();

  // get total inventory value from the database
  void calculateInventoryValue() async {
    inventoryList = await SQLHelper.fetchAllInventory();
    for (var element in inventoryList) {
      totalInvValue = (totalInvValue) + element['buyingPrice'];
    }

    setState(() {
      inventoryList = inventoryList;
      totalInvValue = totalInvValue.toInt();
    });
  }

  // get total sales value from the database
  void calculateTotalSales() async {
    soldItems = await SQLHelper.fetchSoldItems();
    for (var soldItem in soldItems) {
      totalSales = (totalSales) + soldItem['total_price'];
    }

    setState(() {
      soldItems = soldItems;
      totalSales = totalSales.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: _drawerKey,
      drawer: const SizedBox(
        child: DrawerMenu(),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              foregroundColor: Colors.brown[100],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: Colors.brown[100],
                  gradient: LinearGradient(
                    colors: [Colors.brown, Colors.brown.shade300],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ),
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState?.openDrawer();
                },
                icon: const Icon(
                  Icons.menu,
                  color: AppColors.white,
                ),
              ),
              // search field
              title: TextField(
                controller: _searchController,
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(3),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(color: Colors.white54),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: AppColors.white),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.white54,
                    size: 20,
                  ),
                ),
                onChanged: (value) {
                  // Perform search functionality here
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_on,
                    size: 19,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    size: 19,
                  ),
                ),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Expanded(
                flex: 1,
                child: DrawerMenu(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Header(),
                      const SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        child: Wrap(
                          runSpacing: 10.0,
                          spacing: 10.0,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            InfoCard(
                              icon: 'assets/icons/inventory.svg',
                              label: 'Inventory value',
                              amount: currencyFormat.format(totalInvValue),
                              btn: TextButton(
                                onPressed: () {},
                                child: const PrimaryText(text: 'more details'),
                              ),
                            ),
                            InfoCard(
                              icon: 'assets/icons/sales_1.svg',
                              label: 'Total sales',
                              amount: currencyFormat.format(totalSales),
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
                      const HistoryTable(),
                      if (!Responsive.isDesktop(context))
                        const PaymentDetailsList(),
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
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
