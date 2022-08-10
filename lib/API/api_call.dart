import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fans/moduls/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getX;
import 'package:get_storage/get_storage.dart';
import '../Utility/common_function.dart';
import '../Utility/string_utility.dart';

const String baseUri = "https://stagingrentech.rentechdigital.com:3001/";

const String somethingWrong = "Something went wrong!";
const String responseMessage = "No response data found!";
const String interNetMessage =
    "please check your internet connection and try again latter.";
const String connectionTimeOutMessage =
    "Oops.. Server not working or might be in maintenance. Please Try Again Later";
const String authenticationMessage =
    "The session has been expired. Please log in again.";
const String tryAgain = "Try again";

int serviceCallCount = 0;

final storage = GetStorage();

///Status Code with message type array or string
// 501 : sql related err
// 401: validation array
// 201 : string error
// 400 : string error
// 200: response, string/null
// 422: array
class Api {
  getX.RxBool isLoading = false.obs;

  call({
    required String url,
    Map<String, dynamic>? params,
    required Function success,
    Function? error,
    ErrorMessageType errorMessageType = ErrorMessageType.snackBarOnlyError,
    MethodType methodType = MethodType.post,
    bool? isHideLoader = true,
    bool isProgressShow = true,
    bool isPassHeader = true,
    getX.FormData? formValues,
  }) async {
    if (await checkInternet()) {
      if (isProgressShow) {
        showProgressDialog(isLoading: isProgressShow);
      }
      /*if (formValues != null) {
        Map<String, dynamic> tempMap = <String, dynamic>{};
        for (var element in formValues.fields) {
          tempMap[element.key] = element.value;
        }
        FormData reGenerateFormData = FormData.fromMap(tempMap);
        for (var element in formValues.files) {
          reGenerateFormData.files.add(MapEntry(element.key, element.value));
        }
        formValues = reGenerateFormData;
      }*/

      Map<String, dynamic> headerParameters;
      headerParameters = {
        'Authorization': 'Bearer ${storage.read('loginToken') ?? ''}',
        'Accept': 'application/json',
      };
      String mainUrl = url;

      try {
        Response response;
        if (methodType == MethodType.get) {
          response = await Dio().get(
            mainUrl,
            queryParameters: params,
            options: isPassHeader
                ? Options(
                    headers: headerParameters,
                    responseType: ResponseType.json,
                    validateStatus: (_) => true,
                  )
                : null,
          );
        } else if (methodType == MethodType.put) {
          response = await Dio().put(mainUrl,
              data: params,
              options: isPassHeader
                  ? Options(
                      headers: headerParameters,
                      responseType: ResponseType.plain,
                    )
                  : null);
        } else {
          response = await Dio().post(mainUrl,
              data: formValues ?? params,
              options: isPassHeader
                  ? Options(
                      headers: headerParameters,
                      responseType: ResponseType.plain,
                    )
                  : null);
        }
        if (handleResponse(response)) {
          if (kDebugMode) {
            isPassHeader
                ? print('LOGIN TOKEN ${storage.read('loginToken') ?? ''}')
                : print('LOGIN TOKEN Header did\'t pass here...');
            print(url);
            print(params);
            print(response.data);
            print(response);
          }

          ///postman response Code guj
          // Map<String, dynamic>? responseData;
          // responseData = jsonDecode(response.data);
          if (isHideLoader!) {
            hideProgressDialog();
          }
          if (response.data != null && response.statusCode == 200) {
            //#region alert
            // if (errorMessageType == ErrorMessageType.snackBarOnlySuccess ||
            //     errorMessageType == ErrorMessageType.snackBarOnResponse) {
            //   getX.Get.snackbar('Error', responseData?['message']);
            // } else if (errorMessageType == ErrorMessageType.dialogOnlySuccess ||
            //     errorMessageType == ErrorMessageType.dialogOnResponse) {
            //   await apiAlertDialog(message: responseData?['message'], buttonTitle: 'Okay');
            // }
            // //#endregion alert
            // if ((responseData?.containsKey('data') ?? false) &&
            //     (responseData?['data'].containsKey('token') ?? false) &&
            //     (responseData?['data']['token'].toString().isNotEmpty ?? false)) {
            //   storage.write('loginToken', responseData?['data']['token']);
            // }
            success(response);
          } else {
            //region 401 = Session Expired  Manage Authentication/Session Expire
            if (response.statusCode == 401 || response.statusCode == 404) {
              // unauthorizedDialog(responseData?['message']);
              unauthorizedDialog('Api can\'t responding...');
            }
            // else if (error != null) {
            //   //#region alert
            //   if (errorMessageType == ErrorMessageType.snackBarOnlyError ||
            //       errorMessageType == ErrorMessageType.snackBarOnResponse) {
            //     getX.Get.snackbar('Error', responseData?['message']);
            //   } else if (errorMessageType == ErrorMessageType.dialogOnlyError ||
            //       errorMessageType == ErrorMessageType.dialogOnResponse) {
            //     await apiAlertDialog(message: responseData?['message'], buttonTitle: 'Okay');
            //   }
            //   //#endregion alert
            //   error(responseData);
            // }
            //endregion
          }
          isLoading.value = false;
        } else {
          if (isHideLoader!) {
            hideProgressDialog();
          }
          showLog('No response data...!');
          showErrorMessage(
              message: responseMessage,
              isRecall: true,
              callBack: () {
                getX.Get.back();
                call(
                    params: params,
                    url: url,
                    success: success,
                    error: error,
                    isProgressShow: isProgressShow,
                    methodType: methodType,
                    formValues: formValues,
                    isHideLoader: isHideLoader);
              });
          if (error != null) {
            error(response.toString());
          }
          isLoading.value = false;
        }
        isLoading.value = false;
      } on DioError catch (dioError) {
        //#region dioError
        dioErrorCall(
            dioError: dioError,
            onCallBack: (String message, bool isRecallError) {
              showLog('dio error...!');
              showErrorMessage(
                  message: message,
                  isRecall: isRecallError,
                  callBack: () {
                    if (serviceCallCount < 3) {
                      serviceCallCount++;

                      if (isRecallError) {
                        getX.Get.back();
                        call(
                          params: params,
                          url: url,
                          success: success,
                          error: error,
                          isProgressShow: isProgressShow,
                          methodType: methodType,
                          formValues: formValues,
                          isHideLoader: isHideLoader,
                        );
                      } else {
                        getX.Get.back(); // For redirecting to back screen
                      }
                    } else {
                      getX.Get.back(); // For redirecting to back screen
                      // GeneralController.to.selectedTab.value = 0;
                      // getX.Get.offAll(() => DashboardTab());
                    }
                  });
            });
        isLoading.value = false;
        //#endregion dioError
      } catch (e) {
        //#region catch
        if (kDebugMode) {
          print(e);
        }
        hideProgressDialog();
        showLog('Something went wrong...!');
        showErrorMessage(
            message: e.toString(),
            isRecall: true,
            callBack: () {
              getX.Get.back();
              call(
                  params: params,
                  url: url,
                  success: success,
                  error: error,
                  isProgressShow: isProgressShow,
                  methodType: methodType,
                  formValues: formValues,
                  isHideLoader: isHideLoader);
            });
        isLoading.value = false;
        //#endregion catch
      }
    } else {
      //#region No Internet

      showLog('No Internet connection...!');
      showErrorMessage(
          message: interNetMessage,
          isRecall: true,
          callBack: () {
            getX.Get.back();
            call(
                params: params,
                url: url,
                success: success,
                error: error,
                isProgressShow: isProgressShow,
                methodType: methodType,
                formValues: formValues,
                isHideLoader: isHideLoader);
          });
      //#endregion No Internet
    }
  }
}

showErrorMessage(
    {required String message,
    required bool isRecall,
    required Function callBack}) {
  serviceCallCount = 0;
  // serviceCallCount++;
  hideProgressDialog();
  apiAlertDialog(
      buttonTitle: serviceCallCount < 3 ? tryAgain : "Restart App",
      message: message,
      buttonCallBack: () {
        callBack();
      });
}

void showProgressDialog({bool isLoading = true}) {
  isLoading = true;
  getX.Get.dialog(
      WillPopScope(
        onWillPop: () => Future.value(false),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
      barrierColor: Colors.black12,
      barrierDismissible: false);
}

void hideProgressDialog(
    {bool isLoading = true,
    bool isProgressShow = true,
    bool isHideLoader = true}) {
  isLoading = false;
  if ((isProgressShow || isHideLoader) && getX.Get.isDialogOpen!) {
    getX.Get.back();
  }
}

dioErrorCall({required DioError dioError, required Function onCallBack}) {
  switch (dioError.type) {
    case DioErrorType.other:
    case DioErrorType.connectTimeout:
      // onCallBack(connectionTimeOutMessage, false);
      onCallBack(dioError.message, true);
      break;
    case DioErrorType.response:
    case DioErrorType.cancel:
    case DioErrorType.receiveTimeout:
    case DioErrorType.sendTimeout:
    default:
      onCallBack(dioError.message, true);
      break;
  }
}

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

unauthorizedDialog(message) async {
  if (!getX.Get.isDialogOpen!) {
    getX.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: const Text(appName),
          content: Text(message ?? authenticationMessage),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: const Text("Okay"),
              onPressed: () {
                //restart the application
                storage.erase();
                getX.Get.offAll(() => const SplashScreen());
              },
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}

bool handleResponse(Response response) {
  try {
    if (isNotEmptyString(response.toString())) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

apiAlertDialog(
    {required String message,
    String? buttonTitle,
    Function? buttonCallBack,
    bool isShowGoBack = true}) async {
  if (!getX.Get.isDialogOpen!) {
    await getX.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return isShowGoBack ? Future.value(true) : Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: const Text(appName),
          content: Text(message),
          actions: isShowGoBack
              ? [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(isNotEmptyString(buttonTitle)
                        ? buttonTitle!
                        : "Try again"),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        getX.Get.back();
                      }
                    },
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text("Go Back"),
                    onPressed: () {
                      getX.Get.back();
                      getX.Get.back();
                    },
                  )
                ]
              : [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(isNotEmptyString(buttonTitle)
                        ? buttonTitle!
                        : "Try again"),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        getX.Get.back();
                      }
                    },
                  ),
                ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}

enum MethodType { get, post, put }

enum ErrorMessageType {
  snackBarOnlyError,
  snackBarOnlySuccess,
  snackBarOnResponse,
  dialogOnlyError,
  dialogOnlySuccess,
  dialogOnResponse,
  none
}
