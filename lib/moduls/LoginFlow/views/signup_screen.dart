
import 'package:fans/moduls/LoginFlow/views/mobile_signin.dart';
import 'package:fans/moduls/LoginFlow/views/signin_screen.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../utility/theme_data.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  RxBool isRemember = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();
  final Uri _url = Uri.parse('https://fans2.co.tz/p/privacy');

  String? privacyPolicy;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    loadAsset(context);
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        padding: 0,
        context: context,
        child: Form(
          key: formKey,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              heightBox(50.0),
              Image.asset(
                'assets/logo/fans_logo1.png',
                scale: 3.4,
                height: 130.0,
                width: 130.0,
              ),
              heightBox(50.0),
              Text('Join now and Start making money\nwith your content!',
                  textAlign: TextAlign.center, style: greyInter22W500),
              heightBox(50.0),
              heightBox(30.0),
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
                    children: [
                      commonTextField(
                          preFixWidget: const Icon(
                            Icons.account_circle_outlined,
                            color: colorPrimary,
                          ),
                          hintText: 'Full Name',
                          textEditingController: userNameController,
                          validationFunction: (val) {
                            return emptyFieldValidation(
                                val, 'Please enter value');
                          }),
                      heightBox(10.0),
                      commonTextField(
                          preFixWidget: const Icon(
                            Icons.email_outlined,
                            color: colorPrimary,
                          ),
                          hintText: 'Email',
                          textEditingController: emailController,
                          isEnabled: true,
                          validationFunction: (val) {
                            return emailValidation(val);
                          }),
                      heightBox(10.0),
                      commonTextField(
                          preFixWidget: const Icon(
                            Icons.vpn_key_outlined,
                            color: colorPrimary,
                          ),
                          hintText: 'PassWord',
                          textEditingController: passController,
                          isEnabled: true,
                          isPassword: true,
                          validationFunction: (val) {
                            return emptyFieldValidation(val, 'error');
                          }),
                      heightBox(20.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => SizedBox(
                              height: 24,
                              width: 24,
                              child: Theme(
                                data: ThemeData(
                                    unselectedWidgetColor: colorWhite),
                                child: Checkbox(
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          width: 1.0, color: Colors.white),
                                    ),
                                    activeColor: deepPurpleColor,
                                    value: isRemember.value,
                                    onChanged: (bool? value) {
                                      isRemember.value = value ?? false;
                                    }),
                              ),
                            ),
                          ),
                          widthBox(10),
                          Expanded(
                            child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        'I agree with the processing of personal data ',
                                    style: FontStyleUtility.whiteInter16W500,
                                    recognizer: /*TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.to(() {
                                        print('kfghjdfjkghfkldgkl');
                                        isRemember.value = !isRemember.value;
                                      });
                                    },*/
                                        TapGestureRecognizer()
                                          ..onTap = () => isRemember.value =
                                              !isRemember.value),
                                TextSpan(
                                    text: 'Privacy policy',
                                    style: FontStyleUtility.whiteInter16W500
                                        .copyWith(color: colorPrimary),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => conditionDialog())
                              ]),
                            ),
                          ),
                          /* commonText(
                              text:
                                  'I agree with the processing of personal data privacy policy',
                              style: FontStyleUtility.whiteInter16W500),*/
                        ],
                      ),
                      heightBox(30.0),
                      SizedBox(
                        height: 50,
                        width: getScreenWidth(context),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(lightPurpleColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              if (isRemember.value == true) {
                                Map<String, dynamic> params = {
                                  'name': userNameController.text.trim(),
                                  'email': emailController.text.trim(),
                                  'password': passController.text.trim(),
                                  'agree_gdpr': isRemember.value
                                };

                                kAuthenticationController.signupApiCall(params,
                                    () {
                                  Get.off(() => const SignInScreen());
                                });
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'select argument policy');
                              }
                            }
                          },
                          child: Text(
                            "Sign up",
                            style: FontStyleUtility.blackInter16W500
                                .copyWith(color: colorWhite),
                          ),
                        ),
                      ),
                      heightBox(25.0),
                      Center(
                          child: InkWell(
                        onTap: () {
                          Get.off(() => const SignInScreen());
                        },
                        child: Text(' Already have account?',
                            style: FontStyleUtility.whiteInter20W500),
                      )),
                      heightBox(40.0),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Get.to(() => const MobileSignIn());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.phone_android_sharp,
                                color: colorWhite,
                              ),
                              widthBox(20.0),
                              Text(
                                'Login with Mobile Number',
                                style: FontStyleUtility.whiteInter16W500,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  conditionDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 15),
            contentPadding: EdgeInsets.zero,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
              height: getScreenHeight(context) * 0.70,
              // Change as per your requirement
              width: getScreenWidth(context),
              // Cha
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(Icons.close)),
                    ),
                    20.heightBox,
                    Text(privacyPolicy ?? ''),
                    /*Text(loadAsset.toString(),
                        style: blackInter18W600.copyWith(
                            color: isDarkOn.value == true
                                ? colorWhite
                                : colorGrey)),*/
                    10.heightBox
                  ],
                ),
              ),
            ),
          );
        });
  }

  void loadAsset(BuildContext context) async {
    privacyPolicy = await DefaultAssetBundle.of(context)
        .loadString('assets/privacy_policy.txt');
  }
}
