import 'package:fans/API/api_call.dart';
import 'package:fans/API/api_config.dart';
import 'package:fans/moduls/LoginFlow/Model/forgot_password_model.dart';
import 'package:fans/moduls/LoginFlow/Model/signup_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../utility/utility_export.dart';
import '../Model/login_model.dart';

class AuthenticationController extends GetxController {
  ///Login API CALL
  Rx<LoginModel> loginModel = LoginModel().obs;

  loginApiCall(Map<String, dynamic> params, Function callBack) async {
    Api().call(
        url: ApiConfig.loginUser,
        success: (dio.Response<dynamic> response) async {
          try {
            loginModel.value = LoginModel.fromJson(response.data);

            if (loginModel.value.token == null) {
              // showSnackBar(message: response.data['message']);
              showToast(
                  message: response.data['message'],
                  bgColor: colorRed,
                  toastLength: Toast.LENGTH_LONG);
              return;
            }

            if (loginModel.value.token != null &&
                loginModel.value.token!.isNotEmpty) {
              storage.write('loginToken', loginModel.value.token);
            }

            callBack();
          } catch (e) {
            showLog(e);
          }
        },
        isProgressShow: true,
        methodType: MethodType.post,
        params: params,
        isPassHeader: false,
        // Is user not verified
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        });
  }

  ///Signup API Call

  Rx<SignupModel> signupModel = SignupModel().obs;

  signupApiCall(Map<String, dynamic> params, Function callback) async {
    Api().call(
        url: ApiConfig.signupUser,
        success: (dio.Response<dynamic> response) async {
          signupModel.value = SignupModel.fromJson(response.data);
          try {
            if (signupModel.value.success == true) {
              callback();
            } else {
               Fluttertoast.showToast(
                  msg:   'Error',
                  toastLength: Toast.LENGTH_LONG);
            }
          } catch (e) {
            Fluttertoast.showToast(
                msg: e.toString(), toastLength: Toast.LENGTH_LONG);
          }
        },
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        params: params,
        isProgressShow: true,
        methodType: MethodType.post,
        isPassHeader: false);
  }

  ///Forget Password API

  Rx<ForgotPasswordModel> forgotPasswordModel = ForgotPasswordModel().obs;

  forgotPasswordApiCall(Map<String, dynamic> params, Function callback) async {
    Api().call(
      url: ApiConfig.forgotPassword,
      methodType: MethodType.post,
      isPassHeader: false,
      success: (dio.Response<dynamic> response) async {
        forgotPasswordModel.value = ForgotPasswordModel.fromJson(response.data);
      },
      error: (dio.Response<dynamic> response) {
        showLog(response.toString());
      },
    );
  }
}
