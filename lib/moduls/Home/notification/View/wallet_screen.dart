import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../notification_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            10.heightBox,
            commonScreenView(
                icon: Icons.account_balance_wallet_outlined,
                title: 'Wallet',
                subTitle:
                    'Add funds to your wallet to use for\nsubscriptions, tips, and more'),
            20.heightBox,
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: colorPrimary,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TZS10,121.00',
                    style: TextStyle(
                        color: colorWhite,
                        fontSize: 40,
                        fontWeight: FontWeight.w900),
                  ),
                  20.heightBox,
                  Text(
                    'Funds available in your account',
                    style: FontStyleUtility.whiteInter18W500,
                  ),
                ],
              ),
            ),
            20.heightBox,
            commonTextField(
                hintText: 'Amount (Minimum TZS1000 - Maximum TZS50000)',
                textEditingController: null,
                preFixWidget: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'TZS',
                      style: FontStyleUtility.greyInter15W500,
                      textAlign: TextAlign.center,
                    ).paddingOnly(left: 10.0, right: 5.0),
                  ],
                )),
            20.heightBox,
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: isDarkOn.value == true ? colorLightWhite : colorGrey),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Transaction Fee: ',
                        style: greyInter18W500,
                      ),
                      Text(
                        'TZS0',
                        style: greyInter18W500,
                      )
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total: ',
                        style: greyInter18W500,
                      ),
                      Text(
                        'TZS0',
                        style: greyInter18W500,
                      )
                    ],
                  ),
                ],
              ),
            ),
            20.heightBox,
            RadioListTile(
              value: true,
              contentPadding: EdgeInsets.zero,
              visualDensity: const VisualDensity(
                  vertical: VisualDensity.minimumDensity,
                  horizontal: VisualDensity.minimumDensity),
              groupValue: true,
              onChanged: (bool? value) {
                setState(() {
                  /*true = value;*/
                });
              },
              title: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  children: [
                    Image.asset(
                      'assets/appIcons/selcom_icon.png',
                      fit: BoxFit.fitHeight,
                      height: 60,
                      scale: 4.5,
                    ),
                    Text(
                      'Transaction Fee:3.0%',
                      style: greyInter14W400,
                    )
                  ],
                ),
              ),
            ),
            20.heightBox,
            Center(
              child: commonFillButtonView(
                  title: 'Add Funds',
                  color: colorDarkGreen,
                  width: getScreenWidth(context) * 0.7,
                  tapOnButton: () {
                    Get.back();
                  }),
            ),
          ],
        ));
  }
}
