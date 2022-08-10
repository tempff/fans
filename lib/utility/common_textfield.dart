import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Color? borderColor;

OutlineInputBorder textFieldBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(color: borderColor ?? colorBlack.withOpacity(0.5), width: 1),
  borderRadius: BorderRadius.circular(25.0),
);

Widget commonTextField(
    {String? fieldTitleText,
    required String hintText,
    String? labelText,
    bool isPassword = false,
    required TextEditingController? textEditingController,
    Function? validationFunction,
    Function? onSavedFunction,
    double? borderOpacity,
    Function? onFieldSubmit,
    TextInputType? keyboardType,
    Function? onEditingComplete,
    Function? onTapFunction,
    Function? onChangedFunction,
    TextAlign? align,
    TextInputAction? inputAction,
    List<TextInputFormatter>? inputFormatter,
    bool? isEnabled,
    int? errorMaxLines,
    int? maxLine,
    FocusNode? textFocusNode,
    GlobalKey<FormFieldState>? key,
    bool isReadOnly = false,
    bool isBorder = true,
    Widget? suffixIcon,
    ExactAssetImage? preFixIcon,
    Widget? preFixWidget,
    Color? filledColor = textFieldColor,
    TextStyle? textStyle,
    Color? borderRadiusColor,
    RxBool? showPassword,
    int? maxLength,
    EdgeInsetsGeometry? contentPadding,
    ScrollController? scrollController,
    TextStyle? hintStyle}) {
  bool passwordVisible = isPassword;
  return StatefulBuilder(builder: (context, newSetState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // if (fieldTitleText != null && fieldTitleText.isNotEmpty) fieldTitle(fieldTitleText),
        if (fieldTitleText != null && fieldTitleText.isNotEmpty)
          const SizedBox(
            height: 10.0,
          ),
        labelText == null || labelText.isEmpty
            ? const SizedBox()
            : Text(labelText, style: FontStyleUtility.greyInter14W500),

        Obx(
          () => TextFormField(
            maxLength: maxLength ?? 10000,
            scrollController: scrollController,
            // for scroll extra while keyboard open
            // scrollPadding: EdgeInsets.fromLTRB(20, 20, 20, 120),
            enabled: isEnabled != null && !isEnabled ? false : true,
            textAlign: align ?? TextAlign.start,
            showCursor: !isReadOnly,
            onTap: () {
              borderColor = colorBlack.withOpacity(borderOpacity ?? 0.5);
              if (onTapFunction != null) {
                onTapFunction();
              }
            },
            key: key,
            focusNode: textFocusNode,
            onChanged: (value) {
              if (onChangedFunction != null) {
                onChangedFunction(value);
              }
            },
            onEditingComplete: () {
              if (onEditingComplete != null) {
                onEditingComplete();
              }
            },
            validator: (value) {
              return validationFunction != null
                  ? validationFunction(value)
                  : null;
            },
            // onSaved: onSavedFunction != null ? onSavedFunction : (value) {},
            onSaved: (value) {
              // ignore: void_checks
              return onSavedFunction != null ? onSavedFunction(value) : null;
            },
            onFieldSubmitted: (value) {
              // ignore: void_checks
              return onFieldSubmit != null ? onFieldSubmit(value) : null;
            },
            maxLines: maxLine ?? 1,
            keyboardType: keyboardType,
            controller: textEditingController,
            // initialValue: initialText,
            cursorColor: colorPrimary,
            obscureText: passwordVisible,
            textInputAction: inputAction ?? TextInputAction.next,
            style: textStyle ??
                blackInter16W500.copyWith(
                    color:
                        isDarkOn.value == true ? colorLightWhite : colorBlack),
            inputFormatters: inputFormatter,
            decoration: InputDecoration(
              counterText: '',
              errorMaxLines: errorMaxLines ?? 1,
              filled: true,
              fillColor: isDarkOn.value == true ? colorLightBlack : filledColor,
              contentPadding: contentPadding ??
                  const EdgeInsets.fromLTRB(13.0, 11.0, 10.0, 11.0),
              focusedBorder: isBorder ? textFieldBorderStyle : null,
              disabledBorder: isBorder ? textFieldBorderStyle : null,
              enabledBorder: isBorder
                  ? textFieldBorderStyle.copyWith(
                      borderSide: BorderSide(
                          color: borderRadiusColor ??
                              borderColor ??
                              colorBlack.withOpacity(0.5)),
                    )
                  : null,
              errorBorder: isBorder ? textFieldBorderStyle : null,
              focusedErrorBorder: isBorder ? textFieldBorderStyle : null,
              border: isBorder ? textFieldBorderStyle : null,
              hintText: hintText,
              prefixIcon: preFixIcon != null
                  ? Image(
                      image: preFixIcon,
                      height: 15,
                      // color: color_8D8D8D,
                    )
                  : preFixWidget,
              suffixIcon: isPassword
                  ? InkWell(
                      onTap: () {
                        newSetState(() {
                          passwordVisible = !passwordVisible;
                        });
                      },
                      child: passwordVisible
                          ? const Icon(
                              CupertinoIcons.eye_slash,
                              /* color: textColor,*/
                            )
                          : const Icon(
                              CupertinoIcons.eye,
                              /*color: textColor,*/
                            ))
                  : suffixIcon ?? const SizedBox.shrink(),
              hintStyle: hintStyle ??
                  blackInter16W500.copyWith(
                      color:
                          isDarkOn.value == true ? colorLightWhite : colorGrey),
            ),
          ),
        ),
      ],
    );
  });
}
