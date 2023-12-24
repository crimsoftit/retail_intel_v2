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

class Responsive extends StatelessWidget {
  const Responsive({super.key, @required this.mobile, this.tablet, required this.desktop, required this.smallMobile});

  final Widget? mobile;
  final Widget? tablet;
  final Widget desktop;
  final Widget? smallMobile;

  static bool isMobile(BuildContext context) => 
    MediaQuery.of(context).size.width < 768;
  
  static bool isTablet(BuildContext context) => 
    MediaQuery.of(context).size.width < 1200 && 
    MediaQuery.of(context).size.width >= 768;

  static bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 1200;
  

  @override
  Widget build(BuildContext context) {

    final Size _size = MediaQuery.of(context).size;

    if (_size.width >= 1200) {
      return desktop;
    } else if (_size.width >= 768 && tablet != null) {
      return tablet!;
    } else if (_size.width >=376 && _size.width <= 768 && mobile != null) {
      return mobile!;
    } else {
      return smallMobile!;
    }

  }
}