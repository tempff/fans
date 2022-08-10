import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../notification_screen.dart';

class SocialProfileScreen extends StatefulWidget {
  const SocialProfileScreen({Key? key}) : super(key: key);

  @override
  State<SocialProfileScreen> createState() => _SocialProfileScreenState();
}

class _SocialProfileScreenState extends State<SocialProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      appBar: commonAppBar(),
      child: StreamBuilder<Object>(
        stream: isDarkOn.stream,
        builder: (context, snapshot) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonScreenView(
                  icon: Icons.monetization_on_outlined,
                  title: 'Social Profiles',
                  subTitle: 'Add your social media profiles here.'),
              /*Text(
                'Social Profiles',
                style: greyInter22W800.copyWith(
                    color: isDarkOn.value == true ? colorWhite : colorGrey),
              ),*/
              10.heightBox,
              Expanded(
                child: RawScrollbar(
                  thickness: 5.0,
                  thumbColor: colorSplash.withOpacity(0.5),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: kNotificationController.socialProfileList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 15.0),
                        child: commonTextField(
                          filledColor:
                              isDarkOn.value == true ? colorBlack : colorWhite,
                          textStyle: blackInter16W500.copyWith(
                              color:
                                  isDarkOn.value == true ? colorWhite : colorGrey),
                          hintStyle: blackInter16W500.copyWith(
                              color: isDarkOn.value == true
                                  ? colorLightWhite
                                  : colorGrey),
                          preFixWidget: Container(
                              padding: const EdgeInsets.all(15),
                              width: 20,
                              height: 20,
                              child: kNotificationController.socialProfileList[index].icon),
                          hintText: kNotificationController.socialProfileList[index].hint,
                          textEditingController: kNotificationController
                              .socialProfileList[index].controller,
                          // validationFunction: (val) {
                          //   return emailValidation(val);
                          // },
                        ),
                      );
                    },
                  ),
                ),
              ),
              20.heightBox,
            ],
          );
        }
      ),
      bottomNavigation: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: commonFillButtonView(
            height: 50,
            title: 'SUBMIT',
            tapOnButton: () {
              Get.back();
            }),
      ),
    );
  }
}
