import 'dart:convert';

import 'package:fans/moduls/Home/notification/Model/delete_cover_image.dart';
import 'package:fans/moduls/Home/notification/Model/my_page_model.dart';
import 'package:fans/moduls/Home/notification/Model/my_subscriber_model.dart';
import 'package:fans/moduls/Home/notification/Model/my_subscriptions_model.dart';
import 'package:fans/moduls/Home/notification/Model/notification_delete_model.dart';
import 'package:fans/moduls/Home/notification/Model/notification_model.dart';
import 'package:fans/moduls/Home/notification/Model/restiction_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../../API/api_call.dart';
import '../../../../API/api_config.dart';
import '../../../../utility/theme_data.dart';
import '../../../../utility/utility_export.dart';
import '../Model/notification_settings_model.dart';
import 'package:dio/dio.dart' as dio;

class NotificationController extends GetxController {
  RxList<String> blockedCountriesList = <String>[].obs;

  RxList<NotificationSettingsModel> notificationList = [
    NotificationSettingsModel(
        title: 'Someone has subscribed to my content', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone liked my post', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone commented my post', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone send me a tip', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone has bought my content(Post, Message)',
        isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone liked your comment', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Live streams from creators i\'ve subscribe to',
        isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone mentioned me', isChecked: true.obs),
  ].obs;

  RxList<NotificationSettingsModel> emailNotificationList = [
    NotificationSettingsModel(
        title: 'Someone has subscribed to my content', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone send me tip', isChecked: true.obs),
    NotificationSettingsModel(
        title: 'Someone has bought my contact(Post, Message)',
        isChecked: true.obs),
    NotificationSettingsModel(
        title: 'New post of the creators i\'ve subscribed',
        isChecked: true.obs),
  ].obs;

  RxList<DashboardModel> dashboardList = [
    DashboardModel(
        icon: Icons.monetization_on, name: 'TZS0.00', subTitle: 'Earning Net'),
    DashboardModel(
        icon: Icons.account_balance_wallet,
        name: 'TZS12,432.00',
        subTitle: 'Balance'),
    DashboardModel(
        icon: Icons.group_rounded, name: '0', subTitle: 'Subscription active'),
  ].obs;

  RxList<DashboardRevenueModel> dashboardRevenueList = [
    DashboardRevenueModel(
        revenuePer: '0%', title: 'TZS0.00', subTitle: 'Revenue today'),
    DashboardRevenueModel(
        revenuePer: '0%', title: 'TZS0.00', subTitle: 'Revenue this week'),
    DashboardRevenueModel(
        revenuePer: '0%', title: 'TZS0.00', subTitle: 'Revenue this month'),
  ].obs;

  RxList<SocialProfileModel> socialProfileList = [
    SocialProfileModel(
        icon: Image(
            image: facebook,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://facebook.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: twitter,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://twitter.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: instagram,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://instagram.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: youtube,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://youtube.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: pinterest,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://pinterest.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: github,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://github.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: snapchat,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://www.snapchat.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: tiktok,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://www.tiktok.com/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: telegram,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://t.me/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: twitch,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://www.twitch.tv/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: discord,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://discord.gg/username',
        controller: TextEditingController()),
    SocialProfileModel(
        icon: Image(
            image: vkSocial,
            color: isDarkOn.value == true ? colorLightWhite : colorGrey),
        hint: 'https://vk.com/username',
        controller: TextEditingController()),
  ].obs;

  ///My Subscriber Api Call

  Rx<MySubscriberModel> mySubscriberModel = MySubscriberModel().obs;

  mySubscriber(Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.mySubscribers,
        success: (dio.Response<dynamic> response) async {
          try {
            // mySubscriberModel.value = MySubscriberModel.fromJson(response.data);
            mySubscriberModel.value =
                MySubscriberModel.fromJson(json.decode(response.data));
            print('><><><><>${mySubscriberModel.value}');
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: {},
        isProgressShow: true,
        methodType: MethodType.get,
        isPassHeader: true);
  }

  ///My Subscriptions Api Call
  Rx<MySubscriptionsModel> mySubscriptionsModel = MySubscriptionsModel().obs;

  mySubscriptions(Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.mySubscriptions,
        success: (dio.Response<dynamic> response) async {
          try {
            mySubscriptionsModel.value =
                MySubscriptionsModel.fromJson(json.decode(response.data));
            print('><><><><>${mySubscriptionsModel.value}');
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: {},
        isProgressShow: true,
        methodType: MethodType.get,
        isPassHeader: true);
  }

  ///Notification Api Call
  Rx<NotificationModel> notificationModel = NotificationModel().obs;

  notificationApiCall(Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.notifications,
        success: (dio.Response<dynamic> response) async {
          try {
            notificationModel.value =
                NotificationModel.fromJson(json.decode(response.data));
            print('><><><><>${notificationModel.value}');
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: {},
        isProgressShow: true,
        methodType: MethodType.get,
        isPassHeader: true);
  }

  ///Notification Api Call
  Rx<NotificationDeleteModel> notificationDeleteModel =
      NotificationDeleteModel().obs;

  notificationDeleteApiCall(
      Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.notificationsDelete,
        success: (dio.Response<dynamic> response) async {
          try {
            notificationDeleteModel.value =
                NotificationDeleteModel.fromJson(json.decode(response.data));
            print('><><><><>${notificationDeleteModel.value}');
            callback();
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: {},
        isProgressShow: true,
        methodType: MethodType.post,
        isPassHeader: true);
  }

  ///My Page Api Call

  Rx<MyPageModel> myPageModel = MyPageModel().obs;

  myPageApiCall(Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.myPage,
        success: (dio.Response<dynamic> response) {
          try {
            myPageModel.value =
                MyPageModel.fromJson(json.decode(response.data));
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: {},
        methodType: MethodType.post,
        isProgressShow: true,
        isPassHeader: true);
  }

  ///My Restrictions Api Call

  Rx<RestrictionsModel> restrictionsModel = RestrictionsModel().obs;

  restrictionsApiCall(Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.myPage,
        success: (dio.Response<dynamic> response) {
          try {
            restrictionsModel.value =
                RestrictionsModel.fromJson(json.decode(response.data));
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: {},
        methodType: MethodType.get,
        isProgressShow: true,
        isPassHeader: true);
  }

  ///Cover Image Api Call

  Rx<DeleteCoverImageModel> deleteCoverImagesModel = DeleteCoverImageModel().obs;

  deleteCoverImagesApiCall(Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.deleteCover,
        success: (dio.Response<dynamic> response) {
          try {
            restrictionsModel.value = RestrictionsModel.fromJson(json.decode(response.data));
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: {},
        methodType: MethodType.post,
        isProgressShow: true,
        isPassHeader: true);
  }
}
