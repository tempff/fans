import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'common_widgets.dart';

Widget commonFillButtonView(
    {
// required BuildContext context,
    required String title,
    required Function() tapOnButton,
    // required bool isLoading,
    bool isLightButton = false,
    Color? color,
    Color? fontColor,
    Widget? child,
    double? height = 40.0,
    double? width}) {
  return Builder(
    builder: (BuildContext context) {
      return Container(
        width: width ?? getScreenWidth(context) * 0.5,
        height: height,
        decoration: BoxDecoration(color: color ?? deepPurpleColor, borderRadius: BorderRadius.circular(50)),
        child: TextButton(
            onPressed: tapOnButton,
            child: child ??
                Text(
                  title,
                  style: FontStyleUtility.blackInter14W500.copyWith(color: fontColor ?? colorWhite),
                )),
      );
    },
  );
}

Widget commonMediaButtonView(
    {
// required BuildContext context,
    required Function() tapOnButton,
    // required bool isLoading,
    required Image prefixIcon,
    Color? color,
    double? height = 50,
    double? width}) {
  return Builder(
    builder: (BuildContext context) {
      return SizedBox(
          width: width ?? 50,
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: color ?? colorWhite,
              borderRadius: BorderRadius.circular(7),
            ),
            child: InkWell(
              highlightColor: color ?? colorWhite,
              splashColor: color ?? colorWhite,
              onTap: tapOnButton,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: prefixIcon,

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     prefixIcon ?? const SizedBox(),
                //     widthBox(width: 10),
                //     commonText(
                //       text: title,
                //       style: FontStyleUtility.blackInter16W600.copyWith(color: fontColor ?? textColor),
                //     ),
                //   ],
                // ),
              ),
            ),
          ));
    },
  );
}

Widget commonButtonView(
    {
// required BuildContext context,
    required String title,
    required Function() tapOnButton,
    // required bool isLoading,
    bool isLightButton = false,
    Image? suffixImage,
    Image? prefixImage,
    Color? color,
    Color? fontColor,
    double? height = 50,
    double? width}) {
  return Builder(
    builder: (BuildContext context) {
      return SizedBox(
          width: width ?? MediaQuery.of(context).size.width - 20,
          height: height,
          child: Container(
            decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.circular(7),
              border: Border.all(color: colorBlack.withOpacity(0.1), width: 1),
            ),
            child: InkWell(
              highlightColor: colorWhite,
              onTap: tapOnButton,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    suffixImage ?? const SizedBox(),
                    commonText(
                      text: title,
                      textAlign: TextAlign.center,
                      style: FontStyleUtility.blackInter16W600,
                    ),
                  ],
                ),
              ),
            ),
          ));
    },
  );
}

Widget commonRoundedCornerButton({required Function() onTap, required String title, Widget? child, Widget? icon}) {
  return InkWell(
    onTap: onTap,
    highlightColor: colorWhite,
    child: Builder(builder: (context) {
      return Container(
        height: 40,
        width: getScreenWidth(context) * 0.5,
        decoration: BoxDecoration(
            color: colorWhite,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: colorGrey.withOpacity(0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            widthBox(10),
            child ?? commonText(text: title, style: FontStyleUtility.blackInter16W500),
          ],
        ),
      );
    }),
  );
}

Widget materialButton(
    {double? height,
    String? text,
    Function()? onTap,
    TextStyle? textStyle,
    MaterialStateProperty<Color?>? background,
    Widget? icon}) {
  return Builder(builder: (context) {
    return SizedBox(
      height: height ?? 40,
      width: getScreenWidth(context) * 0.5,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: background ?? MaterialStateProperty.all(deepPurpleColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon ?? const SizedBox(),
            10.widthBox,
            Text(
              text ?? '',
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  });
}
