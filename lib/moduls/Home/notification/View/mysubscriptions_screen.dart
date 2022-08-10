import 'package:fans/moduls/Home/notification/notification_screen.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fans/utility/utility_export.dart';

class MySubscriptionsScreen extends StatefulWidget {
  const MySubscriptionsScreen({Key? key}) : super(key: key);

  @override
  State<MySubscriptionsScreen> createState() => _MySubscriptionsScreenState();
}

class _MySubscriptionsScreenState extends State<MySubscriptionsScreen> {
  @override
  void initState() {
    kNotificationController.mySubscriptions({}, () => {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        padding: 0.0,
        context: context,
        appBar: commonAppBar(),
        child: RawScrollbar(
          thickness: 5.0,
          thumbColor: colorSplash.withOpacity(0.5),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                commonScreenView(
                    icon: CupertinoIcons.person_crop_circle_badge_checkmark,
                    title: 'My Subscriptions',
                    subTitle: 'Users you have subscribed to your content'),

                30.heightBox,
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Subscriber',
                          style: greyInter16W500,
                        ),
                        Text(
                          'Date',
                          style: greyInter16W500,
                        ),
                        Text(
                          'Interval',
                          style: greyInter16W500,
                        ),
                        Text(
                          'Endsat',
                          style: greyInter16W500,
                        ),
                        Text(
                          'Status',
                          style: greyInter16W500,
                        ),
                      ],
                    ),
                    20.heightBox,
                    Obx(
                      () => kNotificationController.mySubscriptionsModel.value
                                  .subscriptions?.isNotEmpty ==
                              true
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: kNotificationController
                                      .mySubscriptionsModel
                                      .value
                                      .subscriptions
                                      ?.length ??
                                  0,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 7, horizontal: 12),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.3),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: const Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: colorPrimary, width: 1),
                                      color: isDarkOn.value == true
                                          ? colorLightBlack
                                          : colorWhite),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Icon(
                                            Icons.supervised_user_circle,
                                            size: 50,
                                          ),
                                          SizedBox(
                                            width: 80,
                                            child: Text(
                                              kNotificationController
                                                      .mySubscriptionsModel
                                                      .value
                                                      .subscriptions?[index]
                                                      .name ??
                                                  'Gym Guy',
                                              style: greyInter16W500,
                                              maxLines: 1,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          getFormattedDate(
                                              kNotificationController
                                                      .mySubscriptionsModel
                                                      .value
                                                      .subscriptions?[index]
                                                      .createdAt
                                                      .toString() ??
                                                  ''),
                                          maxLines: 3,
                                          textAlign: TextAlign.center,
                                          style: greyInter16W500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 64,
                                        child: Text(
                                          kNotificationController
                                                  .mySubscriptionsModel
                                                  .value
                                                  .subscriptions?[index]
                                                  .interval ??
                                              '',
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: greyInter16W500,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          getFormattedDate(
                                              kNotificationController
                                                      .mySubscriptionsModel
                                                      .value
                                                      .subscriptions?[index]
                                                      .updatedAt
                                                      .toString() ??
                                                  ''),
                                          maxLines: 3,
                                          textAlign: TextAlign.center,
                                          style: greyInter16W500,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: colorGreen,
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        child: Center(
                                          child: Text(
                                            kNotificationController
                                                        .mySubscriptionsModel
                                                        .value
                                                        .subscriptions?[index]
                                                        .stripeStatus
                                                        ?.isNotEmpty ==
                                                    true
                                                ? (kNotificationController
                                                        .mySubscriptionsModel
                                                        .value
                                                        .subscriptions?[index]
                                                        .stripeStatus ??
                                                    '')
                                                : 'No Data',
                                            textAlign: TextAlign.center,
                                            style: greyInter16W500.copyWith(
                                                color: colorWhite),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                          : SizedBox(
                              height: getScreenHeight(context) * 0.4,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons
                                        .person_crop_circle_badge_checkmark,
                                    size: 90,
                                    color: isDarkOn.value == true
                                        ? colorLightWhite
                                        : colorGreyOpacity30,
                                  ),
                                  20.heightBox,
                                  Text(
                                    'You have not subscribed to any user',
                                    style: FontStyleUtility.greyInter18W500
                                        .copyWith(
                                      color: isDarkOn.value == true
                                          ? colorLightWhite
                                          : colorGreyOpacity30,
                                    ),
                                  ),
                                  5.heightBox,
                                  RichText(
                                      text: TextSpan(children: [
                                    TextSpan(
                                        text: 'Explore Creators',
                                        style: FontStyleUtility.blackInter16W500
                                            .copyWith(
                                                color: skyBlueColor,
                                                decoration:
                                                    TextDecoration.underline),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            print(
                                                '===>> This is explore creators');
                                          }),
                                  ]))
                                ],
                              ),
                            ),
                    ),
                    20.heightBox,
                  ],
                )
                // Expanded(
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Container(
                //           padding: const EdgeInsets.all(25),
                //           decoration: BoxDecoration(
                //               border: Border.all(color: colorGrey.withOpacity(0.5)),
                //               borderRadius: BorderRadius.circular(100)),
                //           child: Icon(
                //             CupertinoIcons.person_crop_circle_badge_checkmark,
                //             size: 75,
                //             color: colorGrey.withOpacity(0.8),
                //           )),
                //       20.heightBox,
                //       Text(
                //         'You have not subscribed to any user',
                //         style: FontStyleUtility.greyInter18W500,
                //       ),
                //       5.heightBox,
                //       RichText(
                //           text: TextSpan(children: [
                //         TextSpan(
                //             text: 'Explore Creators',
                //             style: FontStyleUtility.blackInter16W500.copyWith(
                //                 color: skyBlueColor,
                //                 decoration: TextDecoration.underline),
                //             recognizer: TapGestureRecognizer()
                //               ..onTap = () {
                //                 print('===>> This is explore creators');
                //               }),
                //       ]))
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ));
  }

  String getFormattedDate(String date) {
    var localDate = DateTime.parse(date).toLocal();

    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());
    final DateFormat formatter = DateFormat.yMMMd().add_jms();
    final String formatted = formatter.format(inputDate);

    return formatted.toString();
  }
}
