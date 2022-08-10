import 'dart:ffi';

import 'package:fans/moduls/Home/notification/notification_screen.dart';
import 'package:fans/utility/country_code_picker.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class BlockCountriesScreen extends StatefulWidget {
  const BlockCountriesScreen({Key? key}) : super(key: key);

  @override
  State<BlockCountriesScreen> createState() => _BlockCountriesScreenState();
}

class _BlockCountriesScreenState extends State<BlockCountriesScreen> {
  TextEditingController blockCountriesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonScreenView(
                  icon: CupertinoIcons.eye_slash,
                  title: 'Block countries',
                  subTitle:
                      'Select the countries in which you do not want your profile to be displayed, they will not be able to see your profile in any section of the site.'),
              30.heightBox,
              SizedBox(
                width: getScreenWidth(context),
                // decoration: BoxDecoration(
                //     border: Border.all(
                //         color: borderColor ?? colorBlack.withOpacity(0.5),
                //         width: 1),
                //     borderRadius: BorderRadius.circular(5)),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: getScreenWidth(context),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: isDarkOn.value == true
                                  ? colorLightBlack
                                  : colorWhite,
                              border: Border.all(
                                  color: borderColor ??
                                      colorBlack.withOpacity(0.5),
                                  width: 1),
                              borderRadius: BorderRadius.circular(100)),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.language,
                                /*color: colorGrey,*/
                              ),
                              10.widthBox,

                              // Wrap(
                              //   children: [
                              //     ListView.builder(
                              //       itemCount: kNotificationController
                              //           .blockedCountriesList.length,
                              //       itemBuilder: (context, index) {
                              //         return Container(
                              //           decoration: BoxDecoration(
                              //             borderRadius: BorderRadius.circular(15),
                              //             color: colorPrimary,
                              //           ),
                              //           child: Row(
                              //             children: [
                              //               Text(
                              //                 kNotificationController
                              //                     .blockedCountriesList[index],
                              //                 style: FontStyleUtility
                              //                     .blackInter14W500
                              //                     .copyWith(color: colorWhite),
                              //               )
                              //             ],
                              //           ),
                              //         );
                              //       },
                              //     )
                              //   ],
                              // ),
                              Text(
                                'Add Country',
                                style: blackInter14W500,
                              )
                            ],
                          ),
                        ),
                        CountryCodePickerScreen(
                          alignLeft: true,
                          showOnlyCountryWhenClosed: true,
                          // hideMainText: true,
                          // showFlag: true,
                          showFlagMain: false,
                          dialogBackgroundColor:isDarkOn.value == true
                              ? colorLightBlack
                              : colorWhite,
                          textStyle: FontStyleUtility.blackInter16W500
                              .copyWith(color: colorWhite.withOpacity(0)),
                          onChanged: (val) {
                            if (!kNotificationController.blockedCountriesList
                                .contains(val.name)) {
                              kNotificationController.blockedCountriesList
                                  .add(val.name!);
                            }
                            print(val.name!);
                            print(kNotificationController
                                .blockedCountriesList.length);
                          },
                        ),
                      ],
                    ),
                    10.heightBox,
                    Obx(
                      () => Wrap(
                        children: kNotificationController.blockedCountriesList
                            .map((element) => Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: deepPurpleColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  margin: const EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        element,
                                        style: blackInter14W500.copyWith(color: colorWhite),
                                        textAlign: TextAlign.center,
                                      ),
                                      10.widthBox,
                                      InkWell(
                                          onTap: () {
                                            if (kNotificationController
                                                .blockedCountriesList
                                                .contains(element)) {
                                              kNotificationController
                                                  .blockedCountriesList
                                                  .remove(element);
                                            }
                                          },
                                          child: Container(
                                              height: 25,
                                              width: 25,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                  color: deepPurpleColor),
                                              child: const Icon(
                                                Icons.close,
                                                size: 16,
                                                color: colorWhite,
                                              )))
                                    ],
                                  ),
                                ))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),

              // 10.heightBox,
              // InkWell(
              //   onTap: () {
              //
              //     // showCountryCodePickerDialog();
              //   },
              //   highlightColor: colorWhite,
              //   splashColor: colorWhite,
              //   child: Container(
              //     width: getScreenWidth(context),
              //     padding: const EdgeInsets.all(15),
              //     decoration: BoxDecoration(
              //         border: Border.all(
              //             color: borderColor ?? colorBlack.withOpacity(0.5),
              //             width: 1),
              //         borderRadius: BorderRadius.circular(5)),
              //     child: Row(
              //       children: [
              //         const Icon(
              //           Icons.language,
              //           color: colorGrey,
              //         ),
              //         10.widthBox,
              //         Text(
              //           'Block countries',
              //           style: FontStyleUtility.greyInter16W400,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              30.heightBox,
              Center(
                child: commonFillButtonView(
                    title: 'Save changes',
                    tapOnButton: () {
                      print('save changes');
                    }),
              )
            ],
          ),
        ));
  }
}
