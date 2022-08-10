import 'package:fans/moduls/Home/notification/View/edit_page_screen.dart';
import 'package:fans/moduls/Home/notification/notification_screen.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: Column(
          children: [
            commonScreenView(
                icon: Icons.check_circle_outline,
                title: 'Verify Account',
                subTitle:
                    'Fill in your address, city, ZIP and attach your government issued picture ID'),
            20.heightBox,
            Container(
              decoration: BoxDecoration(
                color: colorRed,
                borderRadius: BorderRadius.circular(5)
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.warning_rounded,
                        color: colorWhite,
                      ),
                      Expanded(
                        child: Text(
                          ' To submit a verification request you must complete your profile.',
                          style: FontStyleUtility.whiteInter16W500,
                        ),
                      ),
                    ],
                  ),
                  20.heightBox,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.dangerous_outlined,
                        color: colorWhite,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: ' Upload a profile picture ',
                            style: FontStyleUtility.whiteInter16W500,
                          ),
                          TextSpan(
                            text: 'Upload',
                            style: FontStyleUtility.whiteInter16W500
                                .copyWith(decoration: TextDecoration.underline),
                          )
                        ]),
                      ),
                      const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: colorWhite,
                      )
                    ],
                  ),  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.dangerous_outlined,
                        color: colorWhite,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: ' Upload a cover image ',
                            style: FontStyleUtility.whiteInter16W500,
                          ),
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () => Get.to(()=> EditPageScreen()),
                            text: 'Upload',
                            style: FontStyleUtility.whiteInter16W500
                                .copyWith(decoration: TextDecoration.underline),
                          )
                        ]),
                      ),
                      const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: colorWhite,
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.dangerous_outlined,
                        color: colorWhite,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: ' Set your date of birth ',
                            style: FontStyleUtility.whiteInter16W500,
                          ),
                          TextSpan(
                            text: 'Edit',
                            style: FontStyleUtility.whiteInter16W500
                                .copyWith(decoration: TextDecoration.underline),
                          )
                        ]),
                      ),
                      const Icon(
                        Icons.arrow_right_alt_rounded,
                        color: colorWhite,
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
