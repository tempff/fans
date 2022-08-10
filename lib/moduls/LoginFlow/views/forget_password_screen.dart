import 'package:fans/utility/utility_export.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        appBar: commonAppBar(),
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
                    Image.asset(
                      'assets/logo/fans_logo1.png',
                      scale: 3.4,
                      height: 130.0,
                      width: 130.0,
                    ),
                    30.heightBox,
                    Text('Password Recover',
                        textAlign: TextAlign.center,
                        style: greyInter22W500.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 25)),
                    heightBox(20.0),
                    Text('You will receive an email to reset your password',
                        textAlign: TextAlign.center, style: greyInter22W500.copyWith(fontWeight: FontWeight.w500,fontSize: 20)).paddingSymmetric(horizontal: 10.0),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: getScreenHeight(context) * 0.5,
                  padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 20.0)
                      .copyWith(top: 25),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(28),
                          topLeft: Radius.circular(28)),
                      color: deepPurpleColor),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      commonTextField(
                          preFixWidget: const Icon(Icons.mail_outline),
                          hintText: 'Enter Your Email',
                          textEditingController: emailController,
                          validationFunction: (val) {
                            return emailValidation(val);
                          }),
                      heightBox(20.0),
                      Center(
                        child: SizedBox(
                          height: 50,
                          width: getScreenWidth(context) * 0.7,
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
                                /* Map<String, dynamic> params = {
                                  'email': emailController.text.trim()
                                };*/
                                forgetPassword();
                              }
                            },
                            child: Text(
                              "Send Password Recover Link",
                              style: FontStyleUtility.blackInter16W500
                                  .copyWith(color: colorWhite),
                            ),
                          ),
                        ),
                      ),
                      /* heightBox(20.0),*/
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  forgetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Navigator.of(context).popUntil((route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      Navigator.of(context).pop();
    }
  }
}
