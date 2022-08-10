import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationSettingsModel {
  RxBool isChecked;
  String title;

  NotificationSettingsModel({required this.isChecked, required this.title});
}

class SocialProfileModel {
  Image icon;
  String hint;
  TextEditingController controller;

  SocialProfileModel({required this.icon, required this.hint, required this.controller});
}


class DashboardModel {
  IconData icon;
  String name;
  String subTitle;

  DashboardModel({required this.icon, required this.name, required this.subTitle});
}


class DashboardRevenueModel {
  String revenuePer;
  String title;
  String subTitle;

  DashboardRevenueModel({required this.revenuePer, required this.title, required this.subTitle});
}
