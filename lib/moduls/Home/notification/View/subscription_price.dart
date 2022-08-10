import 'package:fans/moduls/Home/notification/notification_screen.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SubscriptionPrice extends StatefulWidget {
  const SubscriptionPrice({Key? key}) : super(key: key);

  @override
  State<SubscriptionPrice> createState() => _SubscriptionPriceState();
}

class _SubscriptionPriceState extends State<SubscriptionPrice> {
  RxBool weeklyBool = true.obs;
  RxBool threeMonthsBool = false.obs;
  RxBool sixMonthsBool = false.obs;
  RxBool oneYearBool = false.obs;
  RxBool freeSubscriptionBool = false.obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        appBar: commonAppBar(),
        padding: 0.0,
        context: context,
        child: RawScrollbar(
          thickness: 5.0,
          thumbColor: colorSplash.withOpacity(0.5),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonScreenView(
                    icon: Icons.subscriptions_outlined,
                    title: 'Subscription price',
                    subTitle: 'Set up your subscription'),
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(Weekly)',
                    isSwitchOn: weeklyBool),
                10.heightBox,
                commonPriceRow(
                    padding: 10.0,
                    price: '1000.00',
                    title: 'Subscription price(Month)*',
                    isToggleShow: false,
                    isSwitchOn: false.obs),
                10.heightBox,
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(3 Months)',
                    isSwitchOn: threeMonthsBool),
                10.heightBox,
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(6 Months)',
                    isSwitchOn: sixMonthsBool),
                10.heightBox,
                commonPriceRow(
                    price: '1000.00',
                    title: 'Subscription price(12 Months)',
                    isSwitchOn: oneYearBool),
                20.heightBox,
                Row(
                  children: [
                    Obx(
                      () => CupertinoSwitch(
                          value: freeSubscriptionBool.value,
                          activeColor: colorPrimary,
                          trackColor: colorGrey.withOpacity(0.4),
                          onChanged: (val) {
                            freeSubscriptionBool.value = val;
                          }).paddingOnly(left: 10.0),
                    ),
                    5.widthBox,
                    Text(
                      'Free Subscription',
                      style: greyInter14W400,
                    )
                  ],
                ),
                20.heightBox,
                Center(
                  child: commonFillButtonView(
                      title: 'Save changes',
                      color: deepPurpleColor,
                      width: getScreenWidth(context) * 0.7,
                      tapOnButton: () {
                        Get.back();
                      }),
                ),
                50.heightBox,
              ],
            ),
          ),
        ));
  }

  Widget commonPriceRow(
      {required String title,
      required String price,
      bool? isToggleShow,
      double? padding,
      required RxBool isSwitchOn}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        elevation: 8,
        shadowColor: colorBlack,
        shape: const RoundedRectangleBorder(
            side: BorderSide(color: colorPrimary),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: appBarColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16)
              .copyWith(bottom: padding ?? 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              13.heightBox,
              Text(
                title,
                style: FontStyleUtility.greyInter22W800.copyWith(fontSize: 18),
              ),
              15.heightBox,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                width: getScreenWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: colorBlack.withOpacity(0.5), width: 1)),
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                    text: 'TZS: ',
                    style: FontStyleUtility.blackInter18W500.copyWith(
                        color: colorGrey, fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: price,
                    style: FontStyleUtility.blackInter18W500,
                  )
                ])),
              ),
              5.heightBox,
              isToggleShow ?? true
                  ? Row(
                      children: [
                        Obx(
                          () => Switch(
                              activeColor: deepPurpleColor,
                              value: isSwitchOn.value,
                              onChanged: (val) {
                                isSwitchOn.value = val;
                              }),
                        ),
                        Text(
                          'Status',
                          style: FontStyleUtility.greyInter14W400,
                        )
                      ],
                    )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
