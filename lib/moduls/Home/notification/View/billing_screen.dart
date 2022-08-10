import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../utility/country_code_picker.dart';
import '../notification_screen.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({Key? key}) : super(key: key);

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      appBar: commonAppBar(),
      context: context,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonScreenView(
              icon: Icons.monetization_on_outlined,
              title: 'Billing',
              subTitle: 'Add your billing information.'),
         /* Text(
            'Billing Information',
            style: greyInter22W800,
          ),*/
          10.heightBox,
          commonTextField(
              preFixWidget: Icon(
                CupertinoIcons.building_2_fill,
                color: isDarkOn.value == true ? colorWhite : colorGrey,
              ),
              hintText: 'Company',
              textEditingController: null,
              filledColor:
                  isDarkOn.value == true ? colorLightBlack : colorWhite,
              hintStyle: blackInter16W500.copyWith(
                  color: isDarkOn.value == true ? colorLightWhite : colorGrey)),
          10.heightBox,
          Container(
            width: getScreenWidth(context),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border:
                    Border.all(color: colorBlack.withOpacity(0.5), width: 1),
                color: isDarkOn.value == true ? colorLightBlack : colorWhite),
            child: CountryCodePickerScreen(
              showOnlyCountryWhenClosed: true,
              initialSelection: 'TZ',
              dialogBackgroundColor: isDarkOn.value == true?colorBlack:colorWhite,
              showFlag: true,
              alignLeft: true,
              backgroundColor: colorBlack,
              padding: EdgeInsets.zero,
              onChanged: (val) {
                if (!kNotificationController.blockedCountriesList
                    .contains(val.name)) {
                  kNotificationController.blockedCountriesList.add(val.name!);
                }
                print(val.name!);
                print(kNotificationController.blockedCountriesList.length);
              },
            ),
          ),

          // commonTextField(
          //   preFixWidget: const Icon(CupertinoIcons.flag),
          //   hintText: 'Tanzania',
          //   textEditingController: null,
          // ),
          10.heightBox,
          commonTextField(
              preFixWidget: const Icon(CupertinoIcons.map_pin_ellipse),
              hintText: 'City',
              textEditingController: null,
              filledColor:
                  isDarkOn.value == true ? colorLightBlack : colorWhite,
              hintStyle: blackInter16W500.copyWith(
                  color: isDarkOn.value == true ? colorLightWhite : colorGrey)),
          10.heightBox,
          commonTextField(
              preFixWidget: const Icon(CupertinoIcons.map),
              hintText: 'Address',
              textEditingController: null,
              filledColor:
                  isDarkOn.value == true ? colorLightBlack : colorWhite,
              hintStyle: blackInter16W500.copyWith(
                  color: isDarkOn.value == true ? colorLightWhite : colorGrey)),
          10.heightBox,
          commonTextField(
              preFixWidget: const Icon(CupertinoIcons.location_solid),
              hintText: 'Postal/ZIP',
              textEditingController: null,
              filledColor:
                  isDarkOn.value == true ? colorLightBlack : colorWhite,
              hintStyle: blackInter16W500.copyWith(
                  color: isDarkOn.value == true ? colorLightWhite : colorGrey)),
        ],
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
