import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingList {
  IconData settingIcon;
  String settingName;
  bool nextNavigation;
  dynamic navigationPage;
  SettingList(
      {required this.settingIcon,
      required this.settingName,
      required this.nextNavigation,
      required this.navigationPage});
}