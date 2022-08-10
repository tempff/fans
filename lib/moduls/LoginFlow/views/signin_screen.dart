import 'package:fans/moduls/LoginFlow/views/forget_password_screen.dart';
import 'package:fans/moduls/LoginFlow/views/mobile_signin.dart';
import 'package:fans/moduls/LoginFlow/views/signup_screen.dart';
import 'package:fans/moduls/splash_screen.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../Home/home_structure.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  RxBool isRemember = false.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      isRemember.value = getObject('Remember') ?? false;
      emailController.text = getObject('email') ?? '';
      passController.text = getObject('password') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        padding: 0.0,
        context: context,
        child: Form(
          key: formKey,
          child: ListView(
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
                    Text('Join now and Start making money\nwith your content!',
                        textAlign: TextAlign.center, style: greyInter22W500),
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
                        preFixWidget: const Icon(
                          Icons.mail_outline,
                          color: colorPrimary,
                        ),
                        hintText: 'Enter your email',
                        textEditingController: emailController,
                        validationFunction: (val) {
                          // return emptyFieldValidation(
                          //     val, 'Please enter value');
                          GetUtils.isEmail(val);
                        },
                      ),
                      heightBox(10.0),
                      commonTextField(
                          preFixWidget: const Icon(
                            Icons.vpn_key_outlined,
                            color: colorPrimary,
                          ),
                          hintText: 'Password',
                          textEditingController: passController,
                          validationFunction: (val) {
                            return emptyFieldValidation(
                                val, 'Please enter value');
                          },
                          isEnabled: true,
                          isPassword: true),
                      heightBox(13.0),
                      InkWell(
                        onTap: () {
                          Get.to(() => const ForgetPasswordScreen());
                        },
                        child: Text(
                          'Forget Password?',
                          style: FontStyleUtility.whiteInter16W500,
                        ),
                      ),
                      heightBox(20.0),
                      InkWell(
                        onTap: () {
                          isRemember.value = !isRemember.value;
                        },
                        child: SizedBox(
                          width: getScreenWidth(context) * 0.4,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Obx(
                                () => SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: colorWhite),
                                    child: Checkbox(
                                        side:
                                            MaterialStateBorderSide.resolveWith(
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
                              commonText(
                                  text: 'Remember me',
                                  style: FontStyleUtility.whiteInter16W500),
                            ],
                          ),
                        ),
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
                            if (formKey.currentState!.validate()) {
                              disableFocusScopeNode(context);
                              Map<String, dynamic> params = {
                                'username': emailController.text,
                                'password': passController.text
                              };
                              kAuthenticationController.loginApiCall(params,
                                  () {
                                showLog('Login Success...');
                                if (isRemember.value) {
                                  setObject('Remember', true);
                                  setObject('email', emailController.text);
                                  setObject('password', passController.text);
                                }
                                Get.offAll(() => const HomeStructureView());
                              });
                            }
                          },
                          child: Text(
                            "Login",
                            style: FontStyleUtility.blackInter16W500
                                .copyWith(color: colorWhite),
                          ),
                        ),
                      ),
                      heightBox(20.0),
                      Center(
                          child: InkWell(
                        onTap: () {
                          brightness?.index == 1 ? isDarkOn.value = false : isDarkOn.value = true;
                          Get.to(() => const SignUpScreen());
                        },
                        child: Text('Don\'t have an account?',
                            style: FontStyleUtility.whiteInter20W500),
                      )),
                      50.heightBox,
                      InkWell(
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
