import 'dart:convert';

import 'package:fans/main.dart';
import 'package:fans/utility/string_utility.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../API/api_config.dart';
import 'constants.dart';

// emailValidationFunction(String val) {
//   if (val.isNotEmpty) {
//     return GetUtils.isEmail(val) ? null : loginEmailError;
//   } else {
//     return "Please enter email address";
//   }
// }

showSnackBar(
    {String title = appName,
    required String message,
    Color? color,
    Color? textColor,
    int? duration}) {
  return Get.snackbar(
    title, // title
    message, // message
    backgroundColor: color ?? Colors.green,
    colorText: textColor ?? Colors.white,
    icon: Icon(
      Icons.error,
      color: textColor ?? Colors.white,
    ),
    onTap: (_) {},
    shouldIconPulse: true,
    barBlur: 10,
    isDismissible: true,
    duration: Duration(seconds: duration ?? 2),
  );
}

void showInSnackBar({String? text, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text ?? ""), duration: const Duration(seconds: 2)));
}

/// Authentication Function

getObject(String key) {
  return getPreference.read(key) != null
      ? json.decode(getPreference.read(key))
      : null;
}

setObject(String key, value) {
  getPreference.write(key, json.encode(value));
}

getSocialProfile(String key) {
  return getPreference.read(key);
}

setSocialProfile(String key, value) {
  getPreference.write(key, value);
}

// Rx<LoginModelDataUserDetails> loginUserData = LoginModelDataUserDetails().obs;

/*
getLoginUserData() {
  if (json.decode(getPreference.read(ApiConfig.loginPref)) != null) {
    // kAuthenticationController.loginModel.value = LoginModel.fromJson(getObject(ApiConfig.loginPref));
    kAuthenticationController.loginModel.value = LoginModel.fromJson(json.decode(getPreference.read(ApiConfig.loginPref)));
    // loginUserData.value = loginResponse;
    return kAuthenticationController.loginModel.value;
  } else {
    return null;
  }
}
*/

creditCardValidationFunction(String val) {
  if (val.isNotEmpty) {
    // return CreditCardNumberInputFormatter();
    return val.length == 19 ? null : creditCardError;
  } else {
    return 'please enter card number';
  }
}

// passValidationFunction(String val) {
//   if (val.isNotEmpty) {
//     return val.length > 6 ? null : passwordError;
//   } else {
//     return "Please enter password";
//   }
// }

checkMailOrPhone(String val) {
  if (val.isNotEmpty) {
    String pattern = r'(^(?:[+0]9)?[0-9]{9,16}$)';
    RegExp regExp = RegExp(pattern);
    String mail = val;
    return regExp.hasMatch(mail);
  }
}

phoneValidationFunction(String val) {
  if (val.isNotEmpty) {
    return GetUtils.isPhoneNumber(val) ? null : phoneNumberError;
  } else {
    return "Please enter mobile number";
  }
}

setFcmToken(String value) {
  // getPreference.write(ApiConfig.fcmTokenPref, value);
}

// Api Functions

RegExp passwordRegExpValid = RegExp(
    r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%#^()*?-_&])[A-Za-z\d@$!%*-_?&#^()]{8,}$");

isNotEmptyString(String? data) {
  return data != null && data.isNotEmpty;
}

getFcmToken() {
  // return getPreference.read(ApiConfig.fcmTokenPref) ?? "";
}

hideKeyBoard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

// setFcmToken(String value) {
//   getPreference.write(AppTexts.fcmTokenPref, value);
// }

showLog(text) {
  debugPrintThrottled(text ?? "", wrapWidth: 2256);
}

setIsLogin({required bool isLogin}) {
  getPreference.write(PrefConstants.isLoginPref, isLogin);
}

bool getIsLogin() {
  return getPreference.read(PrefConstants.isLoginPref) ?? false;
}

void showToast({required String message, Color? bgColor, Toast? toastLength}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: toastLength ?? Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: bgColor ?? Colors.black.withOpacity(0.5),
      textColor: Colors.white,
      fontSize: 16.0);
}

/*bool getIsLogin() {
  return (getPreference.read(ApiConfig.isLoginPref) ?? false);
}*/

/*String getLoginToken() {
   return (getPreference.read(PrefConstants.loginToken));
}*/

dateFormatter(String? dateTime, {String? myFormat}) {
  final DateTime now = DateTime.now().subtract(const Duration(minutes: 1));

  /// Your date format
  final DateFormat formatter = DateFormat(myFormat ?? 'MM/dd/yyyy');
  final String formatted;
  if (isNotEmptyString(dateTime)) {
    // 'yyyy-MM-dd'
    formatted = formatter.format(DateFormat('yyyy-MM-dd').parse(dateTime!));
  } else {
    formatted = 'please enter date';
    // formatted = formatter.format(now);
  }
  return formatted;
}

String timeUntil(DateTime? date) {
  return timeago.format(date!.add(const Duration(minutes: 1)),
      allowFromNow: true);
}

// bool getIsLogin() {
//   return (getPreference.read(ApiConfig.isLoginPref) ?? false);
// }
//
// setIsLogin({required bool isLogin}) {
//   getPreference.write(ApiConfig.isLoginPref, isLogin);
// }
//
// setStringPrefrences(String key, value) {
//   getPreference.write(key, value);
// }
//
// getStringPrefrences(String key) {
//   return getPreference.read(key);
// }

emptyFieldValidation(value, String msg) {
  return value.toString().isEmpty ? msg : null;
}

alertPriceFieldValidation(value, String msg) {
  if (value.toString().isEmpty) {
    return msg;
  } else if (value.isNotEmpty) {
    // String pattern = '^\d{0,8}(\.\d{1,4})?\$';
    RegExp regExp = RegExp(r'\d{0,8}(\.\d{1,4})?+$');
    ;
    if (value.isEmpty || regExp.hasMatch(value)) {
      return 'Enter a valid price';
    }
  }
}

profileLinkValidation(String value) {
  return value.isEmpty
      ? 'Please enter profile link'
      : value.contains('http')
          ? null
          : 'Please enter valid profile link';
}

emailValidation(String? value) {
  if (value?.isEmpty ?? false) {
    return 'Please enter email address.';
  } else if (value?.isNotEmpty ?? false) {
    String pattern = r"^[a-zA-Z0-9.]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z-]"
        r"{0,253}[a-zA-Z])?)*$";
    RegExp regex = RegExp(pattern);
    if (value!.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address.';
    }
  }
}

// emailValidation(value) {
//   return value.toString().isEmpty
//       ? notEmptyFieldMessage
//       : !GetUtils.isEmail(value)
//           ? "Please Enter Valid Email Address"
//           : null;
// }

DateTime? exitBackPressTime;
DateTime? currentBackPressTime;

Future<bool> onWillPop() {
  DateTime now = DateTime.now();
  if (currentBackPressTime == null ||
      now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
    currentBackPressTime = now;
    // Fluttertoast.showToast(msg: 'press again to Exit!');
    return Future.value(false);
  }
  return Future.value(true);
}

passwordValidation(String value) {
  return value.toString().isEmpty
      ? notEmptyFieldMessage
      : passwordRegExpValid.hasMatch(value)
          ? null
          : 'Password must be contain capital letter, small letter, special character and 8 characters';
}

// launchURL(String url, {bool forceWeb = false}) async {
//   if (await canLaunch(url)) {
//     await launch(url, universalLinksOnly: forceWeb, forceWebView: forceWeb, forceSafariVC: forceWeb);
//   } else {
//     throw 'Could not launch $url';
//   }
// }

checkIsImage(String? urlThumbnail) {
  return isNotEmptyString(urlThumbnail) && isImage(urlThumbnail ?? "");
}

bool isImage(String filePath) {
  final ext = filePath.toLowerCase();

  return ext.endsWith(".jpg") ||
      ext.endsWith(".jpeg") ||
      ext.endsWith(".png") ||
      ext.endsWith(".svg") ||
      ext.endsWith(".gif") ||
      ext.endsWith(".bmp");
}
String getFormattedDate(String date) {
  var localDate = DateTime.parse(date).toLocal();

  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(localDate.toString());
  final DateFormat formatter = DateFormat.yMMMd().add_jms();
  final String formatted = formatter.format(inputDate);

  return formatted.toString();
}