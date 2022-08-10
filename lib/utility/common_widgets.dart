import 'package:country_code_picker/country_code_picker.dart';
import 'package:fans/utility/assets_utility.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_textfield.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

RxInt selectedIndex = 0.obs;

Widget commonText(
    {required String text, required TextStyle style, TextAlign? textAlign}) {
  return Expanded(
      child: Text(text, style: style, textAlign: textAlign ?? TextAlign.start));
}

disableFocusScopeNode(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}

Widget commonRow(
    {required String title,
    required Widget suffix,
    TextStyle? titleTextStyle,
    TextStyle? textStyle,
    double? borderOpacity}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              child: commonText(
                  text: title,
                  style: titleTextStyle ?? FontStyleUtility.greyInter16W500)),
          suffix,
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 15),
        child: Divider(color: colorGrey.withOpacity(borderOpacity ?? 0.1)),
      ),
    ],
  );
}

Widget searchCommonRow(
    {required String title,
    required Widget suffix,
    TextStyle? titleTextStyle,
    TextStyle? textStyle,
    double? borderOpacity}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 100,
              child: commonText(
                  text: title,
                  style: titleTextStyle ?? FontStyleUtility.blackInter14W500)),
          suffix,
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 15),
        child: Divider(color: colorGrey.withOpacity(borderOpacity ?? 0.1)),
      ),
    ],
  );
}

Widget commonInboxCard(
    {required String text,
    required String timeText,
    Widget? suffixImage,
    Color? backgroundColor}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, bottom: 10),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: colorDarkBlack.withOpacity(0.3),
          ),
          color: backgroundColor ?? colorOffWhite),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: commonText(
                          text: text,
                          style: FontStyleUtility.blackInter16W500
                              .copyWith(height: 1.4)),
                    ),
                    heightBox(15),
                    commonText(
                        text: timeText,
                        style: FontStyleUtility.greyInter16W500),
                  ],
                ),
              ),
            ),
            ClipRRect(
              child: suffixImage ?? const SizedBox(),
            )
          ],
        ),
      ),
    ),
  );
}

Widget introScreenCommonRow({required String text, bool? isSelected}) {
  return Container(
    height: 60,
    alignment: Alignment.centerLeft,
    decoration: BoxDecoration(
        color: isSelected ?? false ? colorPrimary.withOpacity(0.1) : colorWhite,
        border: isSelected ?? false
            ? Border.all(color: colorPrimary)
            : Border.all(color: colorBlack.withOpacity(0.1)),
        borderRadius: BorderRadius.circular(5)),
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: commonText(
          text: text,
          style: FontStyleUtility.greyInter14W500.copyWith(
              fontWeight:
                  isSelected ?? false ? FontWeight.w600 : FontWeight.w500)),
    ),
  );
}

getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

Widget loginFlowCommonBottomBar(
    {required Function() onTap,
    required String textSpanMessage,
    required String textSpanClick}) {
  return SizedBox(
    height: 40,
    child: Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Center(
        child: InkWell(
          highlightColor: colorWhite,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: textSpanMessage,
                    style: FontStyleUtility.blackInter16W500),
                TextSpan(
                    text: " $textSpanClick",
                    style: FontStyleUtility.blackInter16W500
                        .copyWith(color: colorPrimary))
              ]),
            ),
          ),
        ),
      ),
    ),
  );
}

Widget commonProfileRow(
    {required Widget title,
    Widget? subTitle,
    required Function() onTap,
    int? height}) {
  return Column(
    children: [
      InkWell(
        onTap: () {},
        child: Container(
          color: colorWhite,
          child: ListTile(
            minLeadingWidth: 1,
            contentPadding: const EdgeInsets.only(
              left: 0.0,
            ),
            onTap: onTap,
            title: title,
            subtitle: subTitle == null
                ? null
                : Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: subTitle,
                  ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              color: colorSemiDarkBlack,
              size: 16,
            ),
          ),
        ),
      ),
      Divider(color: colorDarkBlack.withOpacity(0.3))
    ],
  );
}

Widget simpleDropDownButton(
    {required BuildContext context,
    required RxString dropdownValue,
    required List<String> options,
    bool isBorder = false,
    bool alignedDropdown = false}) {
  return Container(
    width: getScreenWidth(context),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
            color: isBorder
                ? colorBlack.withOpacity(0.1)
                : colorBlack.withOpacity(0))),
    child: Obx(
      () => DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: alignedDropdown,
          child: DropdownButton<String>(
            value: dropdownValue.value,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            icon: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.keyboard_arrow_down_outlined),
            ),
            elevation: 3,
            style: const TextStyle(color: textColor),
            onChanged: (String? newValue) {
              disableFocusScopeNode(context);
              dropdownValue.value = newValue!;
            },
            items: options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
      ),
    ),
  );
}

// BorderRadius commonButtonBorderRadius = BorderRadius.circular(5.0);

OutlineInputBorder countryBorder = OutlineInputBorder(
  borderSide:
      BorderSide(color: borderColor ?? colorBlack.withOpacity(0.1), width: 1),
  borderRadius: BorderRadius.circular(5.0),
);

Future<void> showAlertDialog(
    {String? title,
    String? msg,
    String? positiveTitle,
    String? negativeTitle,
    required BuildContext context,
    Widget? child,
    List<Widget>? actions,
    bool? showPositiveButton = true,
    bool? showNegativeButton = true,
    TextAlign? textAlign,
    required Function() callback}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        titlePadding:
            title == null ? EdgeInsets.zero : const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.only(top: 10),
        title: Text(title ?? '', style: blackInter20W600),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              child ?? const SizedBox.shrink(),
              msg != null
                  ? Text(msg,
                      style: blackInter16W500.copyWith(
                          height: 1.5,
                          color: isDarkOn.value == true
                              ? colorWhite.withOpacity(0.8)
                              : colorBlack.withOpacity(0.8)),
                      textAlign: textAlign ?? TextAlign.start)
                  : const SizedBox.shrink(),
            ],
          ),
        ),
        actions: actions ??
            <Widget>[
              showNegativeButton ?? true
                  ? TextButton(
                      child:
                          Text(negativeTitle ?? 'No', style: blackInter16W600),
                      onPressed: () {
                        Get.back();
                      },
                    )
                  : const SizedBox.shrink(),
              showPositiveButton ?? true
                  ? TextButton(
                      child: Text(positiveTitle ?? 'Yes', style: blackInter16W600),
                      onPressed: () {
                        callback();
                        Get.back();
                      },
                    )
                  : const SizedBox.shrink(),
            ],
      );
    },
  );
}

commonCountryCodePicker({
  required Function onChanged,
  required String initialSelection,
  required TextEditingController textController,
  FocusNode? focusNode,
  bool? hideMainText,
  Color? borderColor,
  double? height,
  double? width,
  bool? alignLeft = false,
  bool isShowDropIcon = true,
}) {
  return Builder(builder: (context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 60,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          border: Border.all(
              color: borderColor ?? colorBlack.withOpacity(0.1), width: 1),
          borderRadius: BorderRadius.circular(5.0)),
      child: Stack(
        children: [
          isShowDropIcon
              ? const Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black,
                    size: 25,
                  ),
                )
              : const SizedBox(),
          Center(
            child: CountryCodePicker(
              onInit: (code) {},
              flagWidth: 30,
              // hideMainText: true,
              padding: const EdgeInsets.all(0),
              onChanged: (cCode) {
                onChanged(cCode);
              },
              initialSelection: initialSelection,
              showCountryOnly: true,
              showOnlyCountryWhenClosed: true,
              searchStyle: FontStyleUtility.blackInter16W500,
              dialogTextStyle: FontStyleUtility.blackInter18W500,
              showFlagDialog: true,
              alignLeft: alignLeft ?? true,
              closeIcon: const Icon(
                Icons.close_sharp,
                size: 30,
                color: colorBlack,
              ),
              hideMainText: hideMainText ?? false,
              dialogBackgroundColor: Colors.black,
              showFlag: true,
              boxDecoration: BoxDecoration(
                  color: colorWhite, borderRadius: BorderRadius.circular(20.0)),
              searchDecoration: InputDecoration(
                filled: true,
                // prefixIcon: const Icon(
                //   Icons.search,
                //   color: colorBlack,
                // ),
                fillColor: textFieldColor,
                contentPadding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                focusedBorder: countryBorder,
                disabledBorder: countryBorder,
                enabledBorder: countryBorder,
                errorBorder: countryBorder,
              ),
              textStyle: FontStyleUtility.blackInter16W500,
              dialogSize: Size(Get.width, Get.height - 60),
            ),
          ),
        ],
      ),
    );
  });
}

Widget heightBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget widthBox(double width) {
  return SizedBox(
    width: width,
  );
}
