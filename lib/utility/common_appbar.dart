import 'package:fans/utility/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'colors_utility.dart';
import 'font_style_utility.dart';

PreferredSize commonAppBar({
  String? title,
  Widget? titleWidget,
  bool isTransparent = false,
  List<Widget> actionWidgets = const [
    SizedBox(
      height: 25,
      width: 25,
    )
  ],
  Function? backButtonCallBack,
  PreferredSizeWidget? bottom,
  Widget? leadingIcon,
  Color? appbarBgColor,
  double? elevation,
  double? height,
}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(height ?? 50.0),
      child: Obx(()=>
         AppBar(
          bottom: bottom,
          toolbarHeight: height ?? 50.0,
          elevation: elevation ?? 0.0,
          backgroundColor: isDarkOn.value != true ? colorWhite : appbarBgColor,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          centerTitle: true,
          leading: leadingIcon ??
              InkWell(
                highlightColor: appbarBgColor ?? colorWhite,
                focusColor: appbarBgColor ?? colorWhite,
                onTap: () {
                  if (backButtonCallBack != null) {
                    backButtonCallBack();
                  } else {
                    Get.back();
                  }
                },
                child: InkWell(
                  highlightColor: appbarBgColor ?? colorWhite,
                  focusColor: appbarBgColor ?? colorWhite,
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: isDarkOn.value == true ? colorWhite : colorBlack,
                    size: 25,
                  ),
                ),
              ),
          title: titleWidget ??
              Text(
                title ?? "",
                textAlign: TextAlign.center,
                style: FontStyleUtility.blackDMSerifDisplay20W400,
              ),
          actions: actionWidgets,
          // actions: actions != null ? actions : null,
        ),
      ));
}

// commonAppBar({Color? color,Widget? leading, Widget? title, Widget? actions, double? elevation}) {
//   return AppBar(
//     leading: InkWell(
//       highlightColor: colorWhite,
//       onTap: () => Get.back(),
//       child: leading ??
//           const SizedBox(
//             width: 50,
//           ),
//     ),
//     backgroundColor: color ??  colorWhite,
//     centerTitle: true,
//     title: Center(child: title),
//     actions: [
//       actions ??
//           const SizedBox(
//             width: 50,
//           ),
//     ],
//     elevation: elevation ?? 0.0,
//   );
// }
