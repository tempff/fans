import 'package:fans/moduls/Home/home_structure.dart';
import 'package:fans/moduls/Home/notification/View/edit_page_screen.dart';
import 'package:fans/moduls/LoginFlow/views/forget_password_screen.dart';
import 'package:fans/moduls/LoginFlow/views/mobile_signin.dart';
import 'package:fans/moduls/LoginFlow/views/signup_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_function.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_textfield.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreen extends StatefulWidget {
  String? data;

  OtpScreen({Key? key, this.data}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenScreenState();
}

class _OtpScreenScreenState extends State<OtpScreen> {
  RxBool isRemember = false.obs;
  final otpController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  RxBool showLoading = false.obs;
  GlobalKey<FormState> globalKey = GlobalKey();
  RxString codeValue = "".obs;

  @override
  void initState() {
    super.initState();
    smsOtp();
  }

  void smsOtp() async {
    await SmsAutoFill().listenForCode;
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        key: scaffoldKey,
        padding: 0.0,
        context: context,
        child: Obx(() {
          return Form(
            key: globalKey,
            child: Stack(
              children: [
                ListView(
                  physics: const ClampingScrollPhysics(),
                  /*padding: const EdgeInsets.symmetric(horizontal: 16.0),*/
                  children: [
                    SizedBox(
                      height: getScreenHeight(context) * 0.4,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          heightBox(50.0),
                          InkWell(
                            onTap: () {
                              Get.isDarkMode
                                  ? Get.changeTheme(ThemeData.light())
                                  : Get.changeTheme(ThemeData.light());
                            },
                            child: Image.asset(
                              'assets/logo/fans_logo1.png',
                              scale: 3.4,
                              height: 130.0,
                              width: 130.0,
                            ),
                          ),
                          heightBox(50.0),
                          Text(
                              'Join now and Start making money\nwith your content!',
                              textAlign: TextAlign.center,
                              style: greyInter22W500),
                          // const ChangeThemeButtonWidget(),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: getScreenHeight(context) * 0.6,
                        padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 20.0)
                            .copyWith(top: 25),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(28),
                              topLeft: Radius.circular(28)),
                          color: deepPurpleColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisSize: MainAxisSize.max,
                          children: [
                            20.heightBox,
                            PinFieldAutoFill(
                              decoration: UnderlineDecoration(
                                textStyle: const TextStyle(
                                    fontSize: 20, color: colorWhite),
                                colorBuilder: FixedColorBuilder(
                                    colorWhite.withOpacity(0.5)),
                              ),
                              currentCode: codeValue.value,
                              controller: otpController,
                              onCodeSubmitted: (code) {},
                              onCodeChanged: (code) {
                                if (code!.length == 6) {
                                  codeValue.value = code;
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                }
                              },
                            ),
                            /* commonTextField(
                                preFixWidget: const Icon(
                                  Icons.phone_android_sharp,
                                  color: colorPrimary,
                                ),
                                inputFormatter: [
                                  LengthLimitingTextInputFormatter(7),
                                ],
                                hintText: 'Enter Your OTP',
                                validationFunction: (val) {
                                  return emptyFieldValidation(
                                      val, 'Please enter otp');
                                },
                                textEditingController: otpController,
                                // inputAction: [],
                                keyboardType: TextInputType.phone),*/
                            heightBox(60.0),
                            SizedBox(
                              height: 50,
                              width: getScreenWidth(context),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      lightPurpleColor),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                    ),
                                  ),
                                ),
                                onPressed: () async {
                                  if (globalKey.currentState?.validate() ==
                                      true) {
                                    showLoading.value = true;
                                    final phoneAuthCredential =
                                        PhoneAuthProvider.credential(
                                            verificationId: widget.data ?? '',
                                            smsCode: otpController.text);
                                    try {
                                      final authCredential =
                                          await auth.signInWithCredential(
                                              phoneAuthCredential);
                                      if (authCredential.user != null) {
                                        showLoading.value = false;
                                        Fluttertoast.showToast(
                                            msg: 'Verification success',
                                            timeInSecForIosWeb: 5);
                                        Get.offAll(() => EditPageScreen(
                                            name: 'User Profile Details'));
                                      }
                                    } on FirebaseAuthException catch (e) {
                                      showLoading.value = false;
                                      Fluttertoast.showToast(
                                        msg: e.message ?? '',
                                        toastLength: Toast.LENGTH_LONG,
                                        timeInSecForIosWeb: 5,
                                      );
                                    }
                                  }
                                },
                                child: Text(
                                  "Verify",
                                  style: FontStyleUtility.blackInter16W500
                                      .copyWith(color: colorWhite),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                showLoading.value
                    ? Center(
                        child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: colorSemiDarkBlack.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const CircularProgressIndicator(
                            color: colorWhite,
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          );
        }));
  }
}
