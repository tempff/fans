import 'dart:io';

import 'package:fans/moduls/Home/notification/View/edit_page_screen.dart';
import 'package:fans/utility/theme_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:fans/utility/utility_export.dart';
import '../../home/home_screen.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({Key? key}) : super(key: key);

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen>
    with TickerProviderStateMixin {
  RxString bgImage = ''.obs;
  RxString profileImage = ''.obs;
  TabController? tabController;
  RxBool isExpansionTileOpen = false.obs;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
    kNotificationController.myPageApiCall({}, () {
      kNotificationController.myPageModel.refresh();
    });
  }

  @override
  void dispose() {
    /*chewieController!.dispose();
    videoPlayerController!.dispose();*/
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        padding: 0,
        context: context,
        child: RawScrollbar(
          thickness: 5.0,
          thumbColor: colorSplash.withOpacity(0.5),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Obx(
              () => Column(
                children: [
                  20.heightBox,
                  SizedBox(
                    height: getScreenHeight(context) * 0.30,
                    width: getScreenWidth(context),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image(
                              height: getScreenHeight(context) * 0.23,
                              width: getScreenWidth(context),
                              fit: BoxFit.cover,
                              image: bgImage.value.isNotEmpty
                                  ? FileImage(File(bgImage.value))
                                      as ImageProvider
                                  : bgPlaceholder,
                            ),

                            /*CachedNetworkImage(
                                imageUrl: "",
                                imageBuilder: (context, imageProvider) => Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                        colorFilter: ColorFilter.mode(
                                            Colors.red, BlendMode.colorBurn)),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image(image: bgPlaceholder),
                              ),*/
                          ),
                        ),
                        Positioned(
                          left: 25,
                          top: getScreenHeight(context) * 0.23 - 50,
                          /*button height = 35 + padding = 15*/
                          child: InkWell(
                            onTap: () {
                              picImageFromGallery(isProfile: false);
                            },
                            child: Container(
                              height: 35,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: colorBlack.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(25)),
                              child: const Icon(
                                CupertinoIcons.camera_fill,
                                color: colorWhite,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: 125,
                              width: 125,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: colorGrey,
                                        offset: Offset(0.0, 3.0),
                                        blurRadius: 10)
                                  ]),
                              child: Stack(
                                children: [
                                  /*kNotificationController.getUserProfileModel.value.data != null && selectedImage.value.isEmpty
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(100),
                                            child: Stack(
                                              children: [
                                                CachedNetworkImage(
                                                  height: 125,
                                                  width: 125,
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      kAuthenticationController.getUserProfileModel.value.data!.profileImg.toString(),
                                                  placeholder: (context, url) => Image(image: profilePlaceholder, fit: BoxFit.cover),
                                                  errorWidget: (context, url, error) =>
                                                      Image(image: profilePlaceholder, fit: BoxFit.cover),
                                                ),
                                              ],
                                            ),
                                          )
                                        :*/
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: colorWhite, width: 3),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Stack(
                                        children: [
                                          Image(
                                            height: 125,
                                            width: 125,
                                            fit: BoxFit.cover,
                                            image: profileImage.value.isNotEmpty
                                                ? FileImage(File(
                                                        profileImage.value))
                                                    as ImageProvider
                                                : profilePlaceholder,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: InkWell(
                                              highlightColor: colorWhite,
                                              splashColor: colorWhite,
                                              onTap: () async {
                                                picImageFromGallery(
                                                    isProfile: true);
                                              },
                                              child: Container(
                                                width: 125,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: colorBlack
                                                        .withOpacity(0.3)),
                                                child: const Icon(
                                                    CupertinoIcons.camera_fill,
                                                    size: 20,
                                                    color: colorWhite),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // backgroundImage: userProfile2,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(kNotificationController.myPageModel.value.name ?? '',
                          style: greyInter22W800.copyWith(fontSize: 20)),
                      10.widthBox,
                      const Icon(
                        Icons.verified_sharp,
                        color: skyBlueColor,
                        size: 20,
                      ),
                      10.widthBox,
                      Image(
                        image: badge,
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),

                  kNotificationController
                              .myPageModel.value.profession?.isNotEmpty ==
                          true
                      ? Text(
                          kNotificationController.myPageModel.value.profession!,
                          style: blackInter14W500,
                        ).paddingOnly(top: 5.0, bottom: 5.0)
                      : const SizedBox.shrink(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: commonFillButtonView(
                            title: '',
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.edit_outlined,
                                  color: colorWhite,
                                  size: 18,
                                ),
                                10.widthBox,
                                Text('Edit page',
                                    style: FontStyleUtility.blackInter14W500
                                        .copyWith(color: colorWhite))
                              ],
                            ),
                            tapOnButton: () {
                              Get.to(() =>  EditPageScreen());
                            },
                          ),
                        ),
                      ),
                      10.widthBox,
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: InkWell(
                            highlightColor: colorWhite,
                            splashColor: colorWhite,
                            onTap: () {
                              print('Clicked share');
                              showAlertDialog(
                                context: context,
                                callback: () {},
                                actions: [
                                  TextButton(
                                    child:
                                        Text('Cancel', style: blackInter16W600),
                                    onPressed: () {
                                      Get.back();
                                    },
                                  )
                                ],
                                child: SizedBox(
                                  height: getScreenHeight(context) * 0.4,
                                  width: getScreenWidth(context) * 0.9,
                                  child: GridView(
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            childAspectRatio: 1.5),
                                    children: [
                                      commonDialogItems(
                                        image: facebook,
                                        title: 'Facebook',
                                        callBack: () {},
                                      ),
                                      commonDialogItems(
                                        image: twitter,
                                        title: 'Twitter',
                                        callBack: () {},
                                      ),
                                      commonDialogItems(
                                        image: whatsApp,
                                        title: 'WhatsApp',
                                        callBack: () {},
                                      ),
                                      commonDialogItems(
                                        image: email,
                                        title: 'Email',
                                        callBack: () {},
                                      ),
                                      commonDialogItems(
                                        image: message,
                                        title: 'Text message',
                                        callBack: () {},
                                      ),
                                      commonDialogItems(
                                        image: copyLink,
                                        title: 'Copy link',
                                        callBack: () {},
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: deepPurpleColor),
                                child:
                                    const Icon(Icons.share, color: colorWhite)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  10.heightBox,
                  // StreamBuilder<Object>(
                  //     stream: isExpansionTileOpen.stream,
                  //     builder: (context, snapshot) {
                  //       return Theme(
                  //         data: ThemeData()
                  //             .copyWith(dividerColor: Colors.transparent),
                  //         child: Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 12),
                  //           child: ExpansionTile(
                  //             tilePadding: EdgeInsets.zero,
                  //             initiallyExpanded: isExpansionTileOpen.value,
                  //             trailing: null,
                  //             // trailing: Container(
                  //             //     height: 50,
                  //             //     width: 50,
                  //             //     decoration:
                  //             //         BoxDecoration(color: deepPurpleColor.withOpacity(0.2), borderRadius: BorderRadius.circular(100)),
                  //             //     child: const Icon(Icons.keyboard_arrow_down_rounded)),
                  //             onExpansionChanged: (val) {
                  //               isExpansionTileOpen.value = val;
                  //             },
                  //             title: Center(
                  //               child: Container(
                  //                   margin: const EdgeInsets.only(top: 5),
                  //                   width: getScreenWidth(context) * 0.5,
                  //                   height: 40,
                  //                   decoration: BoxDecoration(
                  //                       color: deepPurpleColor,
                  //                       borderRadius: BorderRadius.circular(50)),
                  //                   child: Row(
                  //                     mainAxisAlignment: MainAxisAlignment.center,
                  //                     children: [
                  //                       Text(
                  //                         'About me',
                  //                         style: FontStyleUtility
                  //                             .blackDMSerifDisplay14W500
                  //                             .copyWith(color: colorWhite),
                  //                       ),
                  //                       10.widthBox,
                  //                       Icon(
                  //                         isExpansionTileOpen.value
                  //                             ? Icons.keyboard_arrow_up_sharp
                  //                             : Icons.keyboard_arrow_down_sharp,
                  //                         color: colorWhite,
                  //                       ),
                  //                     ],
                  //                   )),
                  //             ),
                  //             children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 10, left: 12, right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                          color: colorGrey.withOpacity(0.2), width: 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 3, top: 15),
                            child: Text(
                              'About me',
                              style: greyInter18W500.copyWith(
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          10.heightBox,
                          commonAboutMeRow(
                              icon: CupertinoIcons.heart, title: 'Likes'),
                          commonAboutMeRow(
                              icon: Icons.pin_drop_outlined,
                              title: '${kNotificationController.myPageModel.value.address}, ${kNotificationController.myPageModel.value.city}'),
                          commonAboutMeRow(
                              icon: Icons.person_outline,
                              title: 'Member since mar 13, 2021'),
                          10.heightBox,
                          Text(
                            kNotificationController.myPageModel.value.story ??
                                '',
                            style: greyInter14W400,
                          ),
                          10.heightBox,
                        ],
                      ),
                    ),
                  ),
                  //         ],
                  //       ),
                  //     ),
                  //   );
                  // }),
                  // 10.heightBox,
                  StreamBuilder<Object>(
                      stream: isDarkOn.stream,
                      builder: (context, snapshot) {
                        return TabBar(
                          controller: tabController,
                          unselectedLabelColor:
                              isDarkOn.value == true ? colorWhite : colorGrey,
                          indicatorColor: colorPrimary,
                          labelColor: colorPrimary,
                          tabs: const [
                            Tab(
                              icon: Icon(Icons.grid_view_rounded, size: 20),
                              text: '10',
                            ),
                            Tab(
                              icon: Icon(Icons.image, size: 20),
                              text: '4',
                            ),
                            Tab(
                              icon: Icon(Icons.videocam),
                              text: '3',
                            ),
                            Tab(
                              icon: Icon(Icons.mic),
                              text: '1',
                            ),
                          ],
                        );
                      }),
                  10.heightBox,
                  SizedBox(
                    height: getScreenHeight(context) * 0.70,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: tabController,
                        children: <Widget>[
                          homeViewData(false, context,'All Post'),
                          homeViewData(false, context,'Images'),
                          homeViewData(false, context,'Videos'),
                          homeViewData(false, context,'Music'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> picImageFromGallery({required bool isProfile}) async {
    var permissionStatus = await Permission.storage.status;
    if (!permissionStatus.isGranted) await Permission.storage.request();
    if (await Permission.storage.isGranted) {
      // Pick an image
      try {
        final image =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (image != null) {
          final imageTemporary = File(image.path);
          if (isProfile) {
            profileImage.value = imageTemporary.path;
          } else {
            bgImage.value = imageTemporary.path;
          }
        }
      } on PlatformException catch (e) {
        print('failed to pic image: $e');
      }
    } else {
      if (permissionStatus.isPermanentlyDenied) {
        print('====> Permanently denied');
        openAppSettings();
      }
      showToast(message: "Provide Storage permission to pic photos.");
    }
  }

  Widget commonAboutMeRow({required IconData icon, required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
          ),
          10.widthBox,
          Text(
            title,
            style: greyInter14W400,
          )
        ],
      ),
    );
  }

// Widget dialog() {
//   return CustomAlertDialog(
//     content: new Container(
//       width: 260.0,
//       height: 230.0,
//       decoration: new BoxDecoration(
//         shape: BoxShape.rectangle,
//         color: const Color(0xFFFFFF),
//         borderRadius: new BorderRadius.all(new Radius.circular(32.0)),
//       ),
//       child: new Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           // dialog top
//           new Expanded(
//             child: new Row(
//               children: <Widget>[
//                 new Container(
//                   // padding: new EdgeInsets.all(10.0),
//                   decoration: new BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   child: new Text(
//                     'Rate',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18.0,
//                       fontFamily: 'helvetica_neue_light',
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // dialog centre
//           new Expanded(
//             child: new Container(
//                 child: new TextField(
//               decoration: new InputDecoration(
//                 border: InputBorder.none,
//                 filled: false,
//                 contentPadding: new EdgeInsets.only(
//                     left: 10.0, top: 10.0, bottom: 10.0, right: 10.0),
//                 hintText: ' add review',
//                 hintStyle: new TextStyle(
//                   color: Colors.grey.shade500,
//                   fontSize: 12.0,
//                   fontFamily: 'helvetica_neue_light',
//                 ),
//               ),
//             )),
//             flex: 2,
//           ),
//
//           // dialog bottom
//           new Expanded(
//             child: new Container(
//               padding: new EdgeInsets.all(16.0),
//               decoration: new BoxDecoration(
//                 color: const Color(0xFF33b17c),
//               ),
//               child: new Text(
//                 'Rate product',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                   fontFamily: 'helvetica_neue_light',
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

}

Widget commonDialogItems(
    {required ExactAssetImage image,
    required String title,
    required Function() callBack}) {
  return InkWell(
    onTap: () {
      Get.back();
      callBack();
    },
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: colorPrimary.withOpacity(0.2)),
          child: StreamBuilder<Object>(
              stream: isDarkOn.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Image(
                    image: image,
                    height: 30,
                    width: 30,
                    color: isDarkOn.value == true ? colorWhite : colorPrimary,
                  ),
                );
              }),
        ),
        20.heightBox,
        Text(
          title,
          style: blackInter14W500,
        )
      ],
    ),
  );
}
