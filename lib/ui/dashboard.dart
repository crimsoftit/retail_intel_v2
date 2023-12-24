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

// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:retail_intel_v2/ui/components/drawer_menu.dart';
import 'package:retail_intel_v2/ui/components/side_menu.dart';
import 'package:retail_intel_v2/ui/config/size_config.dart';
import 'package:retail_intel_v2/ui/style/colors.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: SideMenu(),
            ),
            Expanded(
              flex: 10,
              child: SizedBox(
                width: double.infinity,
                height: SizeConfig.screenHeight,
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/calendar.svg',
                            width: 10.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
