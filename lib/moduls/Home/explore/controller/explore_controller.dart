import 'package:fans/moduls/Home/explore/model/creators_new_model.dart';
import 'package:fans/moduls/Home/explore/model/explore_model.dart';
import 'package:get/get.dart';

import '../../../../API/api_call.dart';
import '../../../../API/api_config.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../Utility/common_function.dart';

class ExploreController extends GetxController {
  Rx<CreatorsModel> creatorsModel = CreatorsModel().obs;

  creatorsApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        url: ApiConfig.creators,
        success: (dio.Response<dynamic> response) {
          try {
            creatorsModel.value = CreatorsModel.fromJson(response.data);
            callback();
          } catch (e) {
            e.toString();
          }
        },
        isProgressShow: true,
        params: {},
        isPassHeader: true,
        methodType: MethodType.get,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        });
  }

  Rx<CreatorsNewModel> creatorsNewModel = CreatorsNewModel().obs;

  creatorsNewApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        url: ApiConfig.creatorsNew,
        success: (dio.Response<dynamic> response) {
          try {
            creatorsNewModel.value = CreatorsNewModel.fromJson(response.data);
          } catch (e) {
            e.toString();
          }
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
