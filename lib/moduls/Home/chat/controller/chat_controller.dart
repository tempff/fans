import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:fans/API/api_call.dart';
import 'package:fans/API/api_config.dart';
import 'package:fans/moduls/Home/chat/model/messages_model.dart';
import 'package:get/get.dart';

import '../../../../../Utility/common_function.dart';

class ChatController extends GetxController {
  Rx<MessegesModel> messagesModel = MessegesModel().obs;

  messagesApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        url: ApiConfig.messages,
        success: (dio.Response<dynamic> response) {
          messagesModel.value =
              MessegesModel.fromJson(response.data);
        },
        isProgressShow: true,
        params: {},
        isPassHeader: true,
        methodType: MethodType.get,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        });
  }
}
