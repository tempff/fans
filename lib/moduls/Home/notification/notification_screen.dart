import 'package:fans/moduls/Home/notification/View/dashboard_screen.dart';
import 'package:fans/moduls/Home/notification/View/my_page_screen.dart';
import 'package:fans/moduls/Home/notification/View/mysubscriptions_screen.dart';
import 'package:fans/moduls/Home/notification/View/password_screen.dart';
import 'package:fans/moduls/Home/notification/View/restricted_users_screen.dart';
import 'package:fans/moduls/Home/notification/View/subscription_price.dart';
import 'package:fans/moduls/Home/notification/View/verified_account_screen.dart';
import 'package:fans/utility/colors_utility.dart';
import 'package:fans/utility/common_structure.dart';
import 'package:fans/utility/common_widgets.dart';
import 'package:fans/utility/constants.dart';
import 'package:fans/utility/font_style_utility.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';

import 'View/block_countries_screen.dart';
import 'View/edit_page_screen.dart';
import 'View/mysubscribers_screen.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  RxBool isExpansionTileOpen = false.obs;

  @override
  void initState() {
    kNotificationController.notificationApiCall({}, () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: RawScrollbar(
          thickness: 5.0,
          thumbColor: colorSplash.withOpacity(0.5),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                30.heightBox,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.notifications_none,
                        size: 30,
                      ),
                      10.widthBox,
                      Text(
                        'Notifications',
                        style: greyInter18W500.copyWith(
                            fontSize: 25, fontWeight: FontWeight.w700),
                      ),
                      10.widthBox,
                      IconButton(
                          onPressed: () {
                            showNotificationDialog(context);
                          },
                          icon: const Icon(
                            Icons.settings,
                            color: colorPrimary,
                          )),
                      IconButton(
                          onPressed: () {
                            showAlertDialog(
                                title: 'Are you sure?',
                                child: Center(
                                  child: Lottie.asset(
                                    'assets/json/cancel.json',
                                    width: 100,
                                    height: 100,
                                    repeat: false,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                msg:
                                    'Are you sure you want to delete all notifications?',
                                context: context,
                                callback: () {
                                  kNotificationController
                                      .notificationDeleteApiCall({}, () {
                                    kNotificationController
                                        .notificationApiCall({}, () {});
                                  });
                                });
                          },
                          icon: const Icon(
                            CupertinoIcons.delete_solid,
                            color: colorPrimary,
                          )),
                      Expanded(
                        child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20))),
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20))),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            // Align(
                                            //     alignment: Alignment.topRight,
                                            //     child: Padding(
                                            //       padding: const EdgeInsets.only(
                                            //           right: 15, top: 5),
                                            //       child: IconButton(
                                            //           onPressed: () {
                                            //             Get.back();
                                            //           },
                                            //           icon: const Icon(Icons.close)),
                                            //     )),

                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              height: 5,
                                              width: 125,
                                              decoration: BoxDecoration(
                                                  color: colorGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100)),
                                            ),

                                            ListTile(
                                                onTap: () {
                                                  Get.back();
                                                  Get.to(() =>
                                                      const VerifiedAccountView());
                                                },
                                                trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 18,
                                                  color: colorGrey,
                                                ),
                                                leading: const Icon(
                                                    Icons.verified_outlined),
                                                title: const Text(
                                                    'Verified account!')),

                                            ListTile(
                                                onTap: () {
                                                  Get.back();
                                                  Get.to(() =>
                                                      const SubscriptionPrice());
                                                },
                                                trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 18,
                                                  color: colorGrey,
                                                ),
                                                leading: const Icon(Icons
                                                    .subscriptions_outlined),
                                                title: const Text(
                                                    'Subscription price')),
                                            ListTile(
                                                onTap: () {
                                                  Get.back();
                                                },
                                                trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 18,
                                                  color: colorGrey,
                                                ),
                                                leading: const Icon(
                                                    Icons.privacy_tip_outlined),
                                                title: const Text(
                                                    'Privacy and security')),
                                            ListTile(
                                                onTap: () {
                                                  Get.back();
                                                  Get.to(() =>
                                                      const PasswordScreen());
                                                },
                                                trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 18,
                                                  color: colorGrey,
                                                ),
                                                leading: const Icon(Icons.key),
                                                title: const Text('Password')),
                                            ListTile(
                                                onTap: () {
                                                  Get.back();
                                                  Get.to(() =>
                                                      const BlockCountriesScreen());
                                                },
                                                trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 18,
                                                  color: colorGrey,
                                                ),
                                                leading: const Icon(
                                                    CupertinoIcons.eye_slash),
                                                title: const Text(
                                                    'Block countries')),
                                            ListTile(
                                                onTap: () {
                                                  Get.back();
                                                  Get.to(() =>
                                                      const RestrictedUsersScreen());
                                                },
                                                trailing: const Icon(
                                                  Icons
                                                      .arrow_forward_ios_rounded,
                                                  size: 18,
                                                  color: colorGrey,
                                                ),
                                                leading: const Icon(
                                                    Icons.block_flipped),
                                                title: const Text(
                                                    'Restricted user')),
                                          ],
                                        ));
                                  });
                            },
                            icon: const Icon(
                              Icons.grid_view_rounded,
                              color: colorPrimary,
                            )),
                      ),
                    ],
                  ),
                ),
                5.heightBox,
                StreamBuilder<Object>(
                    stream: isDarkOn.stream,
                    builder: (context, snapshot) {
                      return Text(
                        'New subscribers, likes and comments',
                        style: greyInter18W500.copyWith(
                            color: isDarkOn.value == true
                                ? colorWhite.withOpacity(0.7)
                                : colorDarkBlue.withOpacity(0.7),
                            letterSpacing: 1),
                      );
                    }),
                30.heightBox,

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
                //           // trailing: Container(
                //           //     height: 50,
                //           //     width: 50,
                //           //     decoration:
                //           //         BoxDecoration(color: deepPurpleColor.withOpacity(0.2), borderRadius: BorderRadius.circular(100)),
                //           //     child: const Icon(Icons.keyboard_arrow_down_rounded)),
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
                //             commonSubscriptionView(),
                //             commonPrivacyView(),
                //           ],
                //         ),
                //       );
                //     }),
                Obx(
                  () => kNotificationController
                                  .notificationModel.value.notifications !=
                              null &&
                          kNotificationController.notificationModel.value
                                  .notifications?.isNotEmpty ==
                              true
                      ? Obx(
                          () => ListView.builder(
                            shrinkWrap: true,
                            itemCount: kNotificationController.notificationModel
                                    .value.notifications?.length ??
                                0,
                            physics: const ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: colorGrey.withOpacity(0.2),
                                      width: 1),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  child: ListTile(
                                    title: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text:
                                                'Your video has been processed successfully (Post) ',
                                            style: blackInter16W600.copyWith(
                                                color: isDarkOn.value == true
                                                    ? colorWhite
                                                    : colorGrey,
                                                height: 1.2)),
                                        TextSpan(
                                            text: kNotificationController
                                                    .notificationModel
                                                    .value
                                                    .notifications?[index]
                                                    .description ??
                                                '',
                                            style: blackInter16W600.copyWith(
                                                color: colorPrimary,
                                                height: 1.2)),
                                      ]),
                                    ),
                                    subtitle: Text(
                                      '5 days ago',
                                      style: FontStyleUtility.greyInter14W400
                                          .copyWith(height: 2),
                                    ),
                                    leading: const Icon(
                                      Icons.play_circle_outline,
                                      color: colorPrimary,
                                      size: 40,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : SizedBox(
                          height: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications_off_outlined,
                                size: 80.0,
                                color: isDarkOn.value == true
                                    ? colorLightWhite
                                    : colorGreyOpacity30,
                              ),
                              Text(
                                'No have Notifications',
                                style: greyInter16W500.copyWith(
                                  fontSize: 20,
                                  color: isDarkOn.value == true
                                      ? colorLightWhite
                                      : colorGreyOpacity30,
                                ),
                              )
                            ],
                          ),
                        ),
                )
              ],
            ),
          ),
        ));
  }

  Future<dynamic> showNotificationDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            content: SizedBox(
              height: getScreenHeight(context) * 0.70,
              // Change as per your requirement
              width: getScreenWidth(context),
              // Cha
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Receive notification when:',
                            style: blackInter18W600.copyWith(
                                color: isDarkOn.value == true
                                    ? colorWhite
                                    : colorGrey)),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),
                    20.heightBox,
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          kNotificationController.notificationList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Obx(
                                  () => Switch(
                                      // inactiveThumbColor: Colors.grey,
                                      dragStartBehavior:
                                          DragStartBehavior.start,
                                      activeColor: colorPrimary,
                                      value: kNotificationController
                                          .notificationList[index]
                                          .isChecked
                                          .value,
                                      onChanged: (bool val) {
                                        kNotificationController
                                            .notificationList[index]
                                            .isChecked
                                            .value = val;
                                      }),
                                ),
                              ),
                              Expanded(
                                  child: Text(kNotificationController
                                      .notificationList[index].title)),
                            ],
                          ),
                        );
                      },
                    ),
                    20.heightBox,
                    Text('Email notification',
                        style: blackInter18W600.copyWith(
                            color: isDarkOn.value == true
                                ? colorWhite
                                : colorGrey)),
                    20.heightBox,
                    ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          kNotificationController.emailNotificationList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                                child: Obx(
                                  () => Switch(
                                      activeColor: colorPrimary,
                                      dragStartBehavior:
                                          DragStartBehavior.start,
                                      value: kNotificationController
                                          .emailNotificationList[index]
                                          .isChecked
                                          .value,
                                      onChanged: (bool val) {
                                        kNotificationController
                                            .emailNotificationList[index]
                                            .isChecked
                                            .value = val;
                                      }),
                                ),
                              ),
                              Expanded(
                                  child: Text(kNotificationController
                                      .emailNotificationList[index].title)),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

Widget commonAccountView() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: colorGrey.withOpacity(0.2), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'ACCOUNT',
            style: FontStyleUtility.greyInter18W500
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ListTile(
          onTap: () {
            Get.to(() => const DashboardScreen());
          },
          leading: const Icon(Icons.speed),
          title: const Text('Dashboard'),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 18,
            color: colorGrey,
          ),
        ),
        ListTile(
            onTap: () {
              Get.to(() => const MyPageScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.person_outline),
            title: const Text('My page')),
        ListTile(
            onTap: () {
              Get.to(() =>  EditPageScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.mode_edit_outline_outlined),
            title: const Text('Edit my page')),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.account_balance_wallet_outlined),
            title: const Text('Wallet')),
        ListTile(
            onTap: () {
              Get.to(() => const VerifiedAccountView());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.verified_outlined),
            title: const Text('Verified account!')),
      ],
    ),
  );
}

Widget commonSubscriptionView() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: colorGrey.withOpacity(0.2), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'SUBSCRIPTION',
            style: FontStyleUtility.greyInter18W500
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.subscriptions_outlined),
            title: const Text('Subscription price')),
        ListTile(
            onTap: () {
              Get.to(() => const MySubscribersScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.group_outlined),
            title: const Text('My subscribers')),
        ListTile(
            onTap: () {
              Get.to(() => const MySubscriptionsScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading:
                const Icon(CupertinoIcons.person_crop_circle_badge_checkmark),
            title: const Text('My subscriptions')),
      ],
    ),
  );
}

Widget commonPrivacyView() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      border: Border.all(color: colorGrey.withOpacity(0.2), width: 1),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 15),
          child: Text(
            'PRIVACY AND SECURITY',
            style: FontStyleUtility.greyInter18W500
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.privacy_tip_outlined),
            title: const Text('Privacy and security')),
        ListTile(
            onTap: () {
              Get.to(() => const PasswordScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.key),
            title: const Text('Password')),
        ListTile(
            onTap: () {
              Get.to(() => const BlockCountriesScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(CupertinoIcons.eye_slash),
            title: const Text('Block countries')),
        ListTile(
            onTap: () {
              Get.to(() => const RestrictedUsersScreen());
            },
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 18,
              color: colorGrey,
            ),
            leading: const Icon(Icons.block_flipped),
            title: const Text('Restricted user')),
      ],
    ),
  );
}

Widget commonScreenView(
    {required IconData icon, required String title, required String subTitle}) {
  return Column(
    children: [
      30.heightBox,
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              /* color: colorGrey,*/
            ),
            10.widthBox,
            Text(
              title,
              style: greyInter18W500.copyWith(
                  fontSize: 25, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      5.heightBox,
      Text(
        subTitle,
        style: greyInter18W500.copyWith(
            color: isDarkOn.value == true
                ? colorWhite.withOpacity(0.7)
                : colorDarkBlue.withOpacity(0.7),
            letterSpacing: 1),
        textAlign: TextAlign.center,
      ),
      30.heightBox,
    ],
  );
}
