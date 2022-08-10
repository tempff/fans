import 'package:fans/moduls/Home/home_structure.dart';
import 'package:fans/moduls/Home/notification/notification_screen.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:fans/utility/utility_export.dart';

import '../../../../utility/country_code_picker.dart';

// ignore: must_be_immutable
class EditPageScreen extends StatefulWidget {
  String? name;

  EditPageScreen({Key? key, this.name}) : super(key: key);

  @override
  State<EditPageScreen> createState() => _EditPageScreenState();
}

class _EditPageScreenState extends State<EditPageScreen> {
  RxBool isExpansionTileOpen = false.obs;
  RxBool showUserName = false.obs;

  GlobalKey<FormState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      appBar: commonAppBar(),
      child: RawScrollbar(
        thickness: 5.0,
        thumbColor: colorSplash.withOpacity(0.5),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonScreenView(
                    icon: Icons.mode_edit_outline_outlined,
                    title: widget.name ?? 'Edit my page',
                    subTitle: 'Tell us something about you.'),

                // StreamBuilder<Object>(
                //     stream: isExpansionTileOpen.stream,
                //     builder: (context, snapshot) {
                //       return Theme(
                //         data: ThemeData()
                //             .copyWith(dividerColor: Colors.transparent),
                //         child: ExpansionTile(
                //           tilePadding: EdgeInsets.zero,
                //           initiallyExpanded: isExpansionTileOpen.value,
                //           trailing: null,
                //           onExpansionChanged: (val) {
                //             isExpansionTileOpen.value = val;
                //           },
                //           title: Container(
                //               width: getScreenWidth(context) - 20,
                //               height: 50,
                //               decoration: BoxDecoration(
                //                   color: deepPurpleColor,
                //                   borderRadius: BorderRadius.circular(50)),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 children: [
                //                   Icon(
                //                     isExpansionTileOpen.value
                //                         ? Icons.cancel
                //                         : Icons.menu,
                //                     color: colorWhite,
                //                   ),
                //                   10.widthBox,
                //                   Text(
                //                     'Menu',
                //                     style: FontStyleUtility
                //                         .blackDMSerifDisplay18W400
                //                         .copyWith(color: colorWhite),
                //                   ),
                //                 ],
                //               )),
                //           children: <Widget>[
                //             commonAccountView(),
                //           ],
                //         ),
                //       );
                //     }),
                // 20.heightBox,
                commonTextField(
                    preFixWidget: const Icon(
                      Icons.person_outline,
                    ),
                    hintText: 'Admin*',
                    // labelText: 'Full name*',
                    textEditingController: null,
                    filledColor:
                        isDarkOn.value == true ? colorLightBlack : colorWhite,
                    hintStyle: blackInter16W500.copyWith(
                        color: isDarkOn.value == true
                            ? colorLightWhite
                            : colorGrey)),
                20.heightBox,
                commonTextField(
                  hintText: 'User name*',
                  preFixWidget: const Icon(Icons.account_circle),
                  // labelText: 'User name*',
                  textEditingController: null,
                ),
                5.heightBox,
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(
                      () => Switch(
                          // inactiveThumbColor: Colors.grey,
                          dragStartBehavior: DragStartBehavior.start,
                          activeColor: colorPrimary,
                          value: showUserName.value,
                          onChanged: (bool val) {
                            showUserName.value = val;
                          }),
                    ),
                    Text(
                      'Show username instead of your Full name',
                      style: greyInter14W400,
                    ),
                  ],
                ),
                10.heightBox,
                commonTextField(
                  preFixWidget: const Icon(Icons.mail_outline),
                  hintText: 'Email*',
                  textEditingController: null,
                ),
                10.heightBox,
                commonTextField(
                  preFixWidget: const Icon(CupertinoIcons.person_alt),
                  hintText: 'Profession/Occupation',
                  textEditingController: null,
                ),
                10.heightBox,
                commonTextField(
                  preFixWidget: const Icon(Icons.language),
                  hintText: 'English',
                  textEditingController: null,
                ),
                // CountryCodePickerScreen(
                //   initialSelection: 'IN',
                //   onChanged: (val) {
                //     print('==--??? ${val.code}  ${val.name}  ${val.dialCode}');
                //   },
                // ),

                10.heightBox,
                commonTextField(
                  preFixWidget: const Icon(Icons.calendar_month),
                  hintText: '01/01/1970',
                  textEditingController: null,
                ),
                5.heightBox,
                RichText(
                    text: TextSpan(children: [
                  TextSpan(text: 'Valid formats  ', style: greyInter14W400),
                  TextSpan(
                      text: '09-29-2004 - (Can be edited only once)',
                      style: greyInter14W600),
                ])),
                10.heightBox,
                commonTextField(
                  preFixWidget: const Icon(Icons.male_sharp),
                  hintText: 'Male',
                  textEditingController: null,
                ),
                10.heightBox,
                commonTextField(
                  preFixWidget: const Icon(CupertinoIcons.link),
                  hintText: 'Website',
                  textEditingController: null,
                ),
                // 25.heightBox,
                // Text(
                //   'Billing Information',
                //   style: FontStyleUtility.greyInter22W800,
                // ),
                // 10.heightBox,
                // commonTextField(
                //   preFixWidget: const Icon(CupertinoIcons.building_2_fill),
                //   hintText: 'Company',
                //   textEditingController: null,
                // ),
                // 10.heightBox,
                // Container(
                //   margin: const EdgeInsets.only(top: 10),
                //   width: getScreenWidth(context),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(100),
                //       border: Border.all(
                //           color: colorBlack.withOpacity(0.5), width: 1)),
                //   child: CountryCodePickerScreen(
                //     showOnlyCountryWhenClosed: true,
                //     initialSelection: 'TZ',
                //     showFlag: true,
                //     alignLeft: true,
                //     padding: EdgeInsets.zero,
                //     onChanged: (val) {
                //       if (!kNotificationController.blockedCountriesList
                //           .contains(val.name)) {
                //         kNotificationController.blockedCountriesList
                //             .add(val.name!);
                //       }
                //       print(val.name!);
                //       print(kNotificationController.blockedCountriesList.length);
                //     },
                //   ),
                // ),
                //
                // // commonTextField(
                // //   preFixWidget: const Icon(CupertinoIcons.flag),
                // //   hintText: 'Tanzania',
                // //   textEditingController: null,
                // // ),
                // 10.heightBox,
                // commonTextField(
                //   preFixWidget: const Icon(CupertinoIcons.map_pin_ellipse),
                //   hintText: 'City',
                //   textEditingController: null,
                // ),
                // 10.heightBox,
                // commonTextField(
                //   preFixWidget: const Icon(CupertinoIcons.map),
                //   hintText: 'Address',
                //   textEditingController: null,
                // ),
                // 10.heightBox,
                // commonTextField(
                //   preFixWidget: const Icon(CupertinoIcons.location_solid),
                //   hintText: 'Postal/ZIP',
                //   textEditingController: null,
                // ),

                // 25.heightBox,
                // Text(
                //   'Social Profiles',
                //   style: FontStyleUtility.greyInter22W800,
                // ),
                // 10.heightBox,
                // ListView.builder(
                //   physics: const NeverScrollableScrollPhysics(),
                //   shrinkWrap: true,
                //   itemCount: kNotificationController.socialProfileList.length,
                //   itemBuilder: (context, index) {
                //     return commonTextField(
                //       preFixWidget: Container(
                //           padding: const EdgeInsets.all(15),
                //           width: 20,
                //           height: 20,
                //           child: kNotificationController
                //               .socialProfileList[index].icon),
                //       hintText:
                //           kNotificationController.socialProfileList[index].hint,
                //       textEditingController: kNotificationController
                //           .socialProfileList[index].controller,
                //       // validationFunction: (val) {
                //       //   return emailValidation(val);
                //       // },
                //     );
                //   },
                // ),

                20.heightBox,
                // commonButtonView(
                //     title: 'title',
                //     tapOnButton: () {
                //       // if (globalKey.currentState!.validate()) {
                //       //   print('00000000000');
                //       // }
                //     })
              ],
            ),
          ),
        ),
      ),
      bottomNavigation: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
        child: commonFillButtonView(
            height: 50,
            title: 'SUBMIT',
            tapOnButton: () {
              widget.name == "User Profile Details"
                  ? Get.to(() => const HomeStructureView())
                  : Get.back();
            }),
      ),
    );
  }
}
