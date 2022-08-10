import 'package:fans/moduls/Home/chat/model/controller/chat_controller.dart';
import 'package:fans/moduls/LoginFlow/Controller/authentication_controller.dart';
import 'package:get/get.dart';
import 'package:fans/moduls/Home/notification/Controller/notification_controller.dart';

import '../moduls/Home/home/controller/home_controller.dart';

NotificationController kNotificationController =
    Get.put(NotificationController());
AuthenticationController kAuthenticationController =
    Get.put(AuthenticationController());
HomeController kHomeController = Get.put(HomeController());
ChatController kChatController = Get.put(ChatController());

class PrefConstants {
  static const String isLoginPref = "isLogin";



}
