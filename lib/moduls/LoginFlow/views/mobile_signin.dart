import 'package:country_code_picker/country_code_picker.dart';
import 'package:fans/moduls/LoginFlow/views/otp_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_function.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_textfield.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:velocity_x/velocity_x.dart';

class MobileSignIn extends StatefulWidget {
  const MobileSignIn({Key? key}) : super(key: key);

  @override
  State<MobileSignIn> createState() => _MobileSignInScreenState();
}

FirebaseAuth auth = FirebaseAuth.instance;

class _MobileSignInScreenState extends State<MobileSignIn> {
  RxBool isRemember = false.obs;
  final phoneController = TextEditingController();
  bool showLoading = false;
  String? verificationId;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController countyController = TextEditingController();
  String dialCode = '+255';

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        appBar: commonAppBar(),
        key: scaffoldKey,
        padding: 0.0,
        context: context,
        child: Form(
          key: globalKey,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
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
                            commonTextField(
                              hintText: 'Enter Your Mobile Number',
                              textEditingController: phoneController,
                              validationFunction: (String val) {
                                return phoneValidationFunction(val);
                              },
                              inputFormatter: [
                                LengthLimitingTextInputFormatter(12),
                              ],
                              keyboardType: TextInputType.phone,
                              preFixWidget: commonCountryCodePicker(
                                hideMainText: true,
                                width: 60,
                                borderColor: colorWhite.withOpacity(0),
                                textController: countyController,
                                onChanged: (CountryCode cCode) {
                                  print(cCode.dialCode);
                                  setState(() {
                                    dialCode = cCode.dialCode.toString();
                                    // countryCode = cCode.code.toString();
                                  });
                                },
                                initialSelection: dialCode,
                              ),
                            ),
                            heightBox(25.0),
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
                                    setState(() {
                                      showLoading = true;
                                    });

                                    await auth.verifyPhoneNumber(
                                      phoneNumber:
                                          dialCode + phoneController.text,
                                      verificationCompleted:
                                          (phoneAuthCredential) async {
                                        setState(() {
                                          showLoading = false;
                                        });

                                        //signInWithPhoneAuthCredential(phoneAuthCredential);
                                      },
                                      verificationFailed:
                                          (verificationFailed) async {
                                        setState(() {
                                          showLoading = false;
                                        });
                                        Fluttertoast.showToast(
                                            msg: 'Invalid Number',
                                            toastLength: Toast.LENGTH_SHORT);
                                      },
                                      codeSent: (verificationId,
                                          resendingToken) async {
                                        setState(() {
                                          showLoading = false;
                                          this.verificationId = verificationId;
                                          Get.to(() =>
                                              OtpScreen(data: verificationId));
                                        });
                                        Fluttertoast.showToast(
                                            msg: 'Sent otp on this number',
                                            toastLength: Toast.LENGTH_SHORT);
                                      },
                                      timeout: const Duration(seconds: 60),
                                      codeAutoRetrievalTimeout:
                                          (verificationId) async {
                                        setState(() {
                                          this.verificationId = verificationId;
                                        });
                                      },
                                    );
                                  }
                                },
                                child: Text(
                                  "Continue",
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
              ),
              showLoading
                  ? Center(
                      child: Container(
                          padding: const EdgeInsets.all(25),
                          decoration: BoxDecoration(
                            color: colorSemiDarkBlack.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const CircularProgressIndicator(
                            color: colorWhite,
                          )))
                  : const SizedBox()
            ],
          ),
        ));
  }
}
