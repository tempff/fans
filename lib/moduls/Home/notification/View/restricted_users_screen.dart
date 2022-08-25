import 'package:fans/utility/theme_data.dart';
import 'package:fans/utility/utility_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../notification_screen.dart';

class RestrictedUsersScreen extends StatefulWidget {
  const RestrictedUsersScreen({Key? key}) : super(key: key);

  @override
  State<RestrictedUsersScreen> createState() => _RestrictedUsersScreenState();
}

class _RestrictedUsersScreenState extends State<RestrictedUsersScreen> {
  @override
  void initState() {
    kNotificationController.restrictionsApiCall({}, () {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        appBar: commonAppBar(),
        child: Column(
          children: [
            commonScreenView(icon: Icons.block_flipped, title: 'Restricted user', subTitle: 'Users you have restricted'),
            Column(
              children: [
                50.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'User',
                      style: greyInter16W500,
                    ),
                    Text(
                      'Date',
                      style: greyInter16W500,
                    ),
                    Text(
                      'Acrtion',
                      style: greyInter16W500,
                    ),
                  ],
                ),
                20.heightBox,
                ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: kNotificationController.restrictionsModel.value.data?.restrictions?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 12),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 5,
                                offset: const Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: colorPrimary, width: 1),
                            color: isDarkOn.value == true ? colorLightBlack : colorWhite),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.supervised_user_circle,
                                  size: 50,
                                ),
                                SizedBox(
                                  width: 80,
                                  child: Text(
                                    'kaushil',
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
                                    kNotificationController.restrictionsModel.value.data?.restrictions?[index].updatedAt.toString() ?? ''),
                                maxLines: 3,
                                textAlign: TextAlign.center,
                                style: greyInter16W500,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(color: colorRed, borderRadius: BorderRadius.circular(100)),
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                              child: Center(
                                child: Text(
                                  '✖️ Remove\n restriction',
                                  textAlign: TextAlign.center,
                                  style: greyInter16W500.copyWith(color: colorWhite),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                /*   : SizedBox(
                    height: getScreenHeight(context) * 0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: const EdgeInsets.all(25),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: isDarkOn.value == true
                                        ? colorWhite.withOpacity(0.5)
                                        : colorLightBlack.withOpacity(0.5),
                                    width: 3),
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              Icons.block_flipped,
                              color: isDarkOn.value == true
                                  ? colorWhite.withOpacity(0.5)
                                  : colorLightBlack.withOpacity(0.5),
                              size: 75,
                              // color: colorGrey.withOpacity(0.8),
                            )),
                        20.heightBox,
                        Text(
                          'No results have been found',
                          style: greyInter18W500,
                        ),
                        5.heightBox,
                      ],
                    ),
                  ),*/
                20.heightBox,
              ],
            ),
          ],
        ));
  }
}
