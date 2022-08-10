import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:fans/moduls/Home/home/goto_post_screen.dart';
import 'package:fans/moduls/Home/notification/View/my_page_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';
import '../../../utility/theme_data.dart';
import '../../../utility/utility_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

FirebaseAnalytics analytics = FirebaseAnalytics.instance;
VideoPlayerController? videoPlayerController;
Future<void>? videoPlayerFuture;
ChewieController? chewieController;
File? zipFileData;
RxBool zipBool = false.obs;
RxBool isMessage = false.obs;
TextEditingController postTextController = TextEditingController();
TextEditingController editPostTextController = TextEditingController();
RxString postText = ''.obs;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    kHomeController.myPostApiCall({}, () {
      kHomeController.myPostModel.refresh();
    });
    kHomeController.homePageApiCall({}, () {});

    videoPlayerController = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    videoPlayerFuture = videoPlayerController!.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: true,
    );
    videoPlayerController?.setLooping(true); // videoPlayerController?.play();
  }


  /* @override
  void dispose() {
    chewieController!.dispose();
    videoPlayerController!.dispose();
    super.dispose();
  }*/

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        /*floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              videoPlayerController!.value.isPlaying
                  ? videoPlayerController?.pause()
                  : videoPlayerController?.play();
            });
          },
          child: Icon(
            videoPlayerController!.value.isPlaying
                ? Icons.pause
                : Icons.play_arrow,
          ),
        ),*/
        child: GestureDetector(
            onTap: () {
              disableFocusScopeNode(context);
            },
            child: homeViewData(true, context, '')));
  }
}

void actionPopUpItemSelected(String value, String? name, BuildContext context,
    int? id, String? description, String? image) {
  kHomeController.scaffoldkey.currentState?.hideCurrentSnackBar();
  String message;
  if (value == 'GoToPost') {
    Get.to(() => const GoToPostScreen());
  } else if (value == 'PinYourProfile') {
    message = 'You selected delete for $name';
    pinYourProfile(id);
  } else if (value == 'CopyLink') {
    message = 'You selected delete for $name';
  } else if (value == 'EditPost') {
    editPostTextController.text = description ?? '';
    editPost(context);
  } else if (value == 'DeletePost') {
    deletePost(context);
  } else {
    message = 'Not implemented';
  }
}

void pinYourProfile(int? id) {
  Map<String, dynamic> params = {
    'id': id,
  };
  kHomeController.pinPostApiCall(params, () {
    Fluttertoast.showToast(
        msg: kHomeController.pinPostModel.value.status ?? '',
        toastLength: Toast.LENGTH_LONG);
  });
}

Future<void> editPost(
  BuildContext context,
) {
  return showDialog(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox(
          // Change as per your requirement
          width: getScreenWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('EditPost', style: FontStyleUtility.blackInter20W600),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
              30.heightBox,
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(35), // Image radius
                      child: Image.asset(
                        'assets/images/profile.jpeg',
                        scale: 3.5,
                        height: 55.0,
                        width: 55.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  20.0.widthBox,
                  Expanded(
                    child: TextFormField(
                      minLines: 4,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: editPostTextController,
                      style: greyInter16W500,
                      decoration: const InputDecoration(
                        hintText: 'Write something...',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                    ),
                  )
                ],
              ),
              20.heightBox,
              Row(
                children: [
                  const Icon(
                    Icons.lock_outline,
                    color: deepPurpleColor,
                    size: 30,
                  ),
                  20.widthBox,
                  const Icon(
                    Icons.emoji_emotions_outlined,
                    color: deepPurpleColor,
                    size: 20,
                  ),
                  const Spacer(),
                  materialButton(
                      background: MaterialStateProperty.all(deepPurpleColor),
                      text: 'Save',
                      height: 45.0,
                      textStyle: FontStyleUtility.blackInter16W500
                          .copyWith(color: colorWhite)),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future deletePost(BuildContext context) {
  return showDialog(
    builder: (BuildContext context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: SizedBox(
          width: getScreenWidth(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/json/cancel.json',
                width: 100,
                height: 100,
                repeat: false,
                fit: BoxFit.fill,
              ),
              Text(
                'Are You Sure?',
                style: greyInter22W800,
              ),
              20.heightBox,
              Text(
                'Sure you want to delete post?',
                style: greyInter14W600,
              ),
              20.heightBox,
              SizedBox(
                width: 160,
                child: materialButton(
                    background: MaterialStateProperty.all(
                        deepPurpleColor.withOpacity(0.5)),
                    textStyle: const TextStyle(color: colorWhite),
                    text: 'No cancel !',
                    onTap: () {
                      Get.back();
                    }),
              ),
              20.heightBox,
              SizedBox(
                width: 160,
                child: materialButton(
                    background: MaterialStateProperty.all(deepPurpleColor),
                    text: 'Yes, delete it!',
                    textStyle: const TextStyle(color: colorWhite),
                    onTap: () {
                      Get.back();
                    }),
              )
            ],
          ),
        ),
      );
    },
    context: context,
  );
}

Widget homeViewData(bool? visible, BuildContext context, String? value) {
  RxBool isExpansionTileOpen = false.obs;
  return RawScrollbar(
    thickness: 5.0,
    thumbColor: colorSplash.withOpacity(0.5),
    child: ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: [
        /* visible == false
            ? const SizedBox()
            : Column(
                children: [
                  20.heightBox,
                  Center(
                    child: materialButton(
                        onTap: () {
                          Get.to(() => const ExplorePostsScreen());
                        },
                        text: 'Explore Posts',
                        textStyle: FontStyleUtility.blackInter14W500
                            .copyWith(color: colorWhite),
                        icon: const Icon(
                          CupertinoIcons.compass,
                          size: 18,
                          color: colorWhite,
                        )),
                  ),
                ],
              ),*/

        /*5.heightBox,
        StreamBuilder<Object>(
            stream: isExpansionTileOpen.stream,
            builder: (context, snapshot) {
              return Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  initiallyExpanded: isExpansionTileOpen.value,
                  childrenPadding: EdgeInsets.zero,
                  trailing: null,
                  // trailing: Container(
                  //     height: 50,
                  //     width: 50,
                  //     decoration:
                  //         BoxDecoration(color: deepPurpleColor.withOpacity(0.2), borderRadius: BorderRadius.circular(100)),
                  //     child: const Icon(Icons.keyboard_arrow_down_rounded)),
                  onExpansionChanged: (val) {
                    isExpansionTileOpen.value = val;
                  },
                  title: Center(
                    child: Container(
                        width: getScreenWidth(context) * 0.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: deepPurpleColor,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              size: 18,
                              isExpansionTileOpen.value
                                  ? Icons.cancel
                                  : CupertinoIcons.compass,
                              color: colorWhite,
                            ),
                            10.widthBox,
                            Text(
                              'Explore Creators',
                              style: FontStyleUtility.blackInter14W500
                                  .copyWith(color: colorWhite),
                            ),
                          ],
                        )),
                  ),

                  children: <Widget>[
                    10.heightBox,
                    exploreCreatorData(),
                  ],
                ),
              );
            }),*/
        10.heightBox,
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(35), // Image radius
                    child: Image.asset(
                      'assets/images/profile.jpeg',
                      scale: 3.5,
                      height: 55.0,
                      width: 55.0,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                20.0.widthBox,
                Expanded(
                  child: TextFormField(
                    minLines: 3,
                    maxLines: null,
                    controller: postTextController,
                    onChanged: (val) {
                      postText.value = val;
                    },
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      hintText: 'Write something...',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                )
              ],
            ),
            StreamBuilder<Object>(
                stream: zipBool.stream,
                builder: (context, snapshot) {
                  return zipFileData != null
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 5.0)
                                .copyWith(bottom: 10.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.attachment,
                                  color: blueColor,
                                ),
                                10.widthBox,
                                Text(
                                  (zipFileData!.path.split('/').last),
                                  style: blackInter15W500,
                                  textAlign: TextAlign.center,
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                    child: IconButton(
                                        onPressed: () {
                                          zipBool.value = false;
                                          zipFileData = null;
                                        },
                                        icon: const Icon(
                                            Icons.highlight_remove_sharp)),
                                  ),
                                )
                              ],
                            ),
                          ))
                      : const SizedBox.shrink();
                }),
            StreamBuilder<Object>(
                stream: kHomeController.imageShowing.stream,
                builder: (context, snapshot) {
                  return kHomeController.imageShowing.value == true
                      ? Container(
                          margin: const EdgeInsets.only(bottom: 10.0),
                          height: 130,
                          child: StreamBuilder<Object>(
                              stream: kHomeController.imageFileList.stream,
                              builder: (context, snapshot) {
                                return Align(
                                  alignment: Alignment.centerLeft,
                                  child: ListView.builder(
                                      itemCount: (kHomeController
                                              .imageFileList.length) +
                                          1,
                                      physics: const ClampingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return index !=
                                                kHomeController
                                                    .imageFileList.length
                                            ? Stack(
                                                children: [
                                                  Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 12,
                                                              top: 5),
                                                      child: Center(
                                                        child: Image.file(
                                                          File(kHomeController
                                                              .imageFileList[
                                                                  index]
                                                              .path),
                                                          fit: BoxFit.cover,
                                                          width: 130,
                                                        ),
                                                      )),
                                                  Positioned(
                                                    top: 5,
                                                    right: 5,
                                                    child: IconButton(
                                                      visualDensity:
                                                          const VisualDensity(
                                                              vertical:
                                                                  VisualDensity
                                                                      .minimumDensity),
                                                      padding: EdgeInsets.zero,
                                                      onPressed: () {
                                                        kHomeController
                                                            .imageFileList
                                                            .removeAt(index);
                                                      },
                                                      icon: const Icon(
                                                        Icons.remove_circle,
                                                        color: colorRed,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            : InkWell(
                                                onTap: () async {
                                            /*      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true);
                                                  if (result != null) {
                                                    kHomeController.selectedImages?.value = result.paths.map((path) => XFile(path??'')).toList();
                                                  } else {
                                                    // User canceled the picker
                                                  }*/

                                                  final List<XFile>?selectedImages = await kHomeController.imagePicker.pickMultiImage();

                                                  if (selectedImages!.isNotEmpty) {
                                                    kHomeController.imageFileList.addAll(selectedImages);
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      border: Border.all(
                                                          color: isDarkOn
                                                                      .value ==
                                                                  true
                                                              ? colorLightWhite
                                                              : colorBlack
                                                                  .withOpacity(
                                                                      0.5))),
                                                  margin: const EdgeInsets.only(
                                                      right: 12),
                                                  width: 130,
                                                  child: Center(
                                                      child: Icon(Icons.add,
                                                          color: isDarkOn
                                                                      .value ==
                                                                  true
                                                              ? colorLightWhite
                                                              : colorBlack
                                                                  .withOpacity(
                                                                      0.5))),
                                                ),
                                              );
                                      }),
                                );
                              }),
                        )
                      : const SizedBox();
                }),
            Obx(
              () => Row(
                children: [
                  IconButton(
                    visualDensity: const VisualDensity(
                        vertical: VisualDensity.minimumDensity),
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      kHomeController.imageShowing.value =
                          !kHomeController.imageShowing.value;
                    },
                    icon: Icon(
                      Icons.image_outlined,
                      color:
                          isDarkOn.value == true ? colorWhite : deepPurpleColor,
                      size: 25,
                    ),
                  ),
                  20.widthBox,
                  IconButton(
                    onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform
                          .pickFiles(
                              type: FileType.custom,
                              allowedExtensions: ['zip']);

                      if (result != null) {
                        zipFileData = File(result.files.single.path ?? '');
                        zipFileData != null ? zipBool.value = true : false;
                        print('>>>>>???>>>$zipFileData');
                      } else {
                        // User canceled the picker
                      }
                    },
                    icon: Icon(
                      Icons.folder_zip_outlined,
                      color:
                          isDarkOn.value == true ? colorWhite : deepPurpleColor,
                      size: 25,
                    ),
                  ),
                  20.widthBox,
                  Icon(
                    Icons.lock_outline,
                    color:
                        isDarkOn.value == true ? colorWhite : deepPurpleColor,
                    size: 25,
                  ),
                  20.widthBox,
                  Icon(
                    Icons.emoji_emotions_outlined,
                    color:
                        isDarkOn.value == true ? colorWhite : deepPurpleColor,
                    size: 25,
                  ),
                ],
              ),
            ),
            20.heightBox,
            materialButton(
                background: MaterialStateProperty.all(lightPurpleColor),
                text: 'Publish',
                onTap: () async {
                  await analytics.logEvent(
                    name: "select_content",
                    parameters: {
                      "content_type": "button",
                      "item_id": 1,
                    },
                  );
                },
                height: 40.0,
                textStyle: FontStyleUtility.blackInter16W500
                    .copyWith(color: colorWhite)),
            20.heightBox,
            Align(
                alignment: Alignment.centerRight,
                child: StreamBuilder<Object>(
                    stream: postText.stream,
                    builder: (context, snapshot) {
                      return Text(
                        '${postText.value.length}',
                        style: FontStyleUtility.greyInter14W500,
                      );
                    }))
          ],
        ),
        15.heightBox,
        Obx(() =>
                /*value == 'All Post'? (kHomeController.myPostModel.value.posts?.isNotEmpty == true && kHomeController.myPostModel.value.posts != null): (value == ''?kHomeController.homePageModel.value.data.updates.data.isNotEmpty==true kHomeController.homePageModel.value.data.updates !=null)
              ?*/
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: value == 'All Post'
                        ? (kHomeController.myPostModel.value.posts?.length ?? 0)
                        : kHomeController.homePageModel.value.data?.updates
                                ?.data?.length ??
                            0,
                    itemBuilder: (context, index) {
                      return commonPost(
                        context,
                        index: index,
                        name: kHomeController.homePageModel.value.data?.updates
                            ?.data?[index].user?.name,
                        date: kHomeController.homePageModel.value.data?.updates
                            ?.data?[index].date,
                        price: kHomeController.homePageModel.value.data?.updates
                            ?.data?[index].price,
                        username: kHomeController.homePageModel.value.data
                            ?.updates?.data?[index].user?.username,
                        description: kHomeController.homePageModel.value.data
                            ?.updates?.data?[index].description,
                        likeCounts: kHomeController.homePageModel.value.data
                            ?.updates?.data?[index].likeCount
                            .toString(),
                        commentsCounts: kHomeController.homePageModel.value.data
                            ?.updates?.data?[index].commentCount
                            .toString(),
                      );
                    })
            /*   : SizedBox(
          height: getScreenHeight(context) * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_not_supported,
            color: isDarkOn.value == true
                ? colorLightWhite
                : colorGreyOpacity30,
            size: 65.0,
          ),
          Text(
            'No Post Posted',
            style: blackInter15W500.copyWith(
              fontSize: 20,
              color: isDarkOn.value == true
                  ? colorLightWhite
                  : colorGreyOpacity30,
            ),
          )
        ],
      ),
    ),*/
            ),
      ],
    ),
  );
}

Widget exploreCreatorData() {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: 2,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: SizedBox(
            height: 160,
            child: Stack(
              children: [
                Image.asset(
                  'assets/images/post1.jpeg',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: colorBlack.withOpacity(0.3),
                    height: 100.0,
                  ),
                ),
                Positioned(
                  left: 15.0,
                  top: 20,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: ExactAssetImage(
                                'assets/images/profile.jpeg',
                              ),
                            ),
                            color: const Color(0xff7c94b6),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50.0)),
                            border: Border.all(
                              color: colorWhite,
                              width: 2.0,
                            ),
                          ),
                        ),
                        20.widthBox,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            23.heightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text('Gym Guy',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: colorWhite)),
                                Icon(
                                  Icons.verified_outlined,
                                  color: colorWhite,
                                  size: 15,
                                ),
                              ],
                            ),
                            3.heightBox,
                            Text(
                              '@gymguy',
                              style: FontStyleUtility.whiteInter14W500,
                            ),
                            10.heightBox,
                            Row(
                              children: [
                                const Icon(
                                  Icons.post_add_sharp,
                                  size: 15,
                                  color: colorWhite,
                                ),
                                Text(
                                  '1',
                                  style: FontStyleUtility.whiteInter12W500,
                                ),
                                8.widthBox,
                                const Icon(
                                  Icons.image_outlined,
                                  size: 15,
                                  color: colorWhite,
                                ),
                                Text(
                                  '1',
                                  style: FontStyleUtility.whiteInter12W500,
                                ),
                                8.widthBox,
                                const Icon(
                                  Icons.videocam_outlined,
                                  size: 15,
                                  color: colorWhite,
                                ),
                                Text(
                                  '0',
                                  style: FontStyleUtility.whiteInter12W500,
                                ),
                                8.widthBox,
                                const Icon(
                                  Icons.mic_none,
                                  size: 15,
                                  color: colorWhite,
                                ),
                                Text(
                                  '0',
                                  style: FontStyleUtility.whiteInter12W500,
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ).paddingOnly(bottom: 10.0);
      });
}

Widget commonPost(BuildContext context,
    {int index = 0,
    String? data,
    String? name,
    String? username,
    DateTime? date,
    String? description,
    String? commentsCounts,
    String? likeCounts,
    String? price}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      StreamBuilder<Object>(
          stream: kHomeController.pinPostModel.stream,
          builder: (context, snapshot) {
            return kHomeController.pinPostModel.value.status == 'pin'
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        CupertinoIcons.pin,
                        color: isDarkOn.value == true
                            ? colorLightWhite
                            : colorGreyOpacity30,
                        size: 20,
                      ),
                      5.widthBox,
                      Text(
                        'Pinned Post',
                        style: greyInter14W500.copyWith(
                            color: isDarkOn.value == true
                                ? colorLightWhite
                                : colorGreyOpacity30),
                      )
                    ],
                  )
                : const SizedBox();
          }),
      10.heightBox,
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipOval(
            child: SizedBox.fromSize(
              size: const Size.fromRadius(35), // Image radius
              child: Image.asset(
                'assets/images/profile.jpeg',
                scale: 3.5,
                height: 55.0,
                width: 55.0,
                fit: BoxFit.fill,
              ),
            ),
          ),
          20.widthBox,
          StreamBuilder<Object>(
              stream: isDarkOn.stream,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          name ?? '',
                          style: FontStyleUtility.blackInter22W500.copyWith(
                              color: isDarkOn.value == true
                                  ? colorWhite
                                  : deepPurpleColor,
                              fontWeight: FontWeight.w900),
                        ),
                        5.widthBox,
                        const Icon(
                          Icons.verified,
                          color: blueColor,
                        ),
                        5.widthBox,
                        Text(
                          username ?? '',
                          style: greyInter14W500,
                        )
                      ],
                    ),
                    5.heightBox,
                    Row(
                      children: [
                        Text(
                          timeUntil(date),
                          style: greyInter16W500.copyWith(
                              color: isDarkOn.value == true
                                  ? colorLightWhite
                                  : colorGrey),
                        ),
                        10.widthBox,
                        Icon(
                          kHomeController.myPostModel.value.posts?[index]
                                      .locked ==
                                  'yes'
                              ? Icons.lock_outline
                              : Icons.public_outlined,
                          color: isDarkOn.value == true
                              ? colorLightWhite
                              : colorGrey,
                          size: 20.0,
                        ),
                        5.widthBox,
                        Text(
                          price ??
                              '' /*kHomeController.myPostModel.value.posts?[index].price ?? ''*/,
                          style: blackInter14W500,
                        )
                      ],
                    ),
                  ],
                );
              }),
          const Spacer(),
          PopupMenuButton(
            icon: const Icon(
              Icons.more_horiz,
              size: 35,
              color: colorGrey,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'GoToPost',
                  child: Row(
                    children: [
                      const Icon(Icons.ios_share_outlined),
                      10.widthBox,
                      const Text('Go to post'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'PinYourProfile',
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.pin),
                      10.widthBox,
                      const Text('Pin your Profile'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'CopyLink',
                  child: Row(
                    children: [
                      const Icon(CupertinoIcons.link),
                      10.widthBox,
                      const Text('Copy link'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'EditPost',
                  child: Row(
                    children: [
                      const Icon(Icons.edit_outlined),
                      10.widthBox,
                      const Text('Edit post'),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'DeletePost',
                  child: Row(
                    children: [
                      const Icon(Icons.delete_outline),
                      10.widthBox,
                      const Text('Delete post'),
                    ],
                  ),
                ),
              ];
            },
            onSelected: (String value) => actionPopUpItemSelected(
              value,
              'name',
              context,
              kHomeController.myPostModel.value.posts?[index].id,
              kHomeController.myPostModel.value.posts?[index].description,
              kHomeController.myPostModel.value.posts?[index].image,
            ),
          ),
        ],
      ),
      15.heightBox,
      Text(
        description ?? '',
        /*kHomeController.myPostModel.value.posts?[index].description*/
        style: greyInter16W500,
      ),
      10.heightBox,
      /*Container(
                  height: 200,
                  color: colorBlack,
                ),*/

    /*  index == 2
          ? FutureBuilder(
              future: videoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return AspectRatio(
                    aspectRatio: videoPlayerController!.value.aspectRatio,
                    child: Chewie(
                      controller: chewieController!,
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/post1.jpeg',
                fit: BoxFit.cover,
              ),
            ),
      5.heightBox,*/
      StreamBuilder<Object>(
          stream: isDarkOn.stream,
          builder: (context, snapshot) {
            return Row(
              children: [
                StreamBuilder<Object>(
                    stream: kHomeController.likeButton.stream,
                    builder: (context, snapshot) {
                      return IconButton(
                          splashColor: colorRed,
                          splashRadius: 20.0,
                          onPressed: () {
                            // kHomeController.likeButton.value = !kHomeController.likeButton.value;
                            kHomeController.homePageModel.value.data?.updates
                                ?.data?[index].isLiked = !(kHomeController
                                    .homePageModel
                                    .value
                                    .data
                                    ?.updates
                                    ?.data?[index]
                                    .isLiked ??
                                false);
                          },
                          icon: Icon(
                            kHomeController.homePageModel.value.data?.updates
                                        ?.data?[index].isLiked ==
                                    true
                                ? CupertinoIcons.heart_fill
                                : CupertinoIcons.suit_heart,
                            size: 25,
                            color: kHomeController.homePageModel.value.data
                                        ?.updates?.data?[index].isLiked ==
                                    true
                                ? colorRed
                                : isDarkOn.value == true
                                    ? colorLightWhite
                                    : colorGrey,
                          ));
                    }),
                Text(
                  likeCounts ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: greyInter18W500.copyWith(
                    color: isDarkOn.value == true ? colorLightWhite : colorGrey,
                  ),
                ),
                2.widthBox,
                IconButton(
                    onPressed: () {
                      isMessage.value = !isMessage.value;
                    },
                    icon: Icon(
                      CupertinoIcons.chat_bubble,
                      size: 22,
                      color:
                          isDarkOn.value == true ? colorLightWhite : colorGrey,
                    )),
                Text(
                  commentsCounts ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: greyInter18W500.copyWith(
                    color: isDarkOn.value == true ? colorLightWhite : colorGrey,
                  ),
                ),
                2.widthBox,
                IconButton(
                    onPressed: () {
                      showAlertDialog(
                        context: context,
                        callback: () {},
                        actions: [
                          TextButton(
                            child: Text('Cancel', style: blackInter16W600),
                            onPressed: () {
                              Get.back();
                            },
                          )
                        ],
                        child: SizedBox(
                          height: getScreenHeight(context) * 0.3,
                          width: getScreenWidth(context) * 0.9,
                          child: GridView(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 1.5),
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
                                image: message,
                                title: 'Text message',
                                callBack: () {},
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      CupertinoIcons.share,
                      size: 22,
                      color:
                          isDarkOn.value == true ? colorLightWhite : colorGrey,
                    )),
                const Spacer(),
                StreamBuilder<Object>(
                    stream: kHomeController.bookmarkButton.stream,
                    builder: (context, snapshot) {
                      return IconButton(
                          splashColor: deepPurpleColor,
                          splashRadius: 20.0,
                          onPressed: () {
                            kHomeController.bookmarkButton.value = !kHomeController.bookmarkButton.value;
                            Map<String, dynamic> params = {
                              'id': data == 'bookmark'
                                  ? (kHomeController.bookMarkModel.value.updates?[index].id ?? '')
                                  : kHomeController.myPostModel.value.posts?[index].id ?? '',
                            };
                            kHomeController.addBookMarkApiCall(params, () {
                              kHomeController.homePageModel.refresh();
                              data == 'bookmark'
                                  ? kHomeController.bookMarkApiCall({}, () {})
                                  : () {};
                            });
                          },
                          icon: Icon(
                            kHomeController.homePageModel.value.data?.updates?.data?[index].isBookmarked == true
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            size: 23,
                            color: kHomeController.bookmarkButton.value == true
                                ? deepPurpleColor
                                : isDarkOn.value == true
                                    ? colorLightWhite
                                    : colorGrey,
                          ));
                    })
              ],
            );
          }),
      Obx(
        () => isMessage.value == true
            ? ListView.builder(
                itemCount: 2 + 1,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return index != 2
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipOval(
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(20), // Image radius
                                child: Image.asset(
                                  'assets/images/profile.jpeg',
                                  scale: 3.5,
                                  height: 30.0,
                                  width: 30.0,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            15.widthBox,
                            Expanded(
                              child: StreamBuilder<Object>(
                                  stream: isDarkOn.stream,
                                  builder: (context, snapshot) {
                                    return Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Admin Account',
                                              style: blackInter15W500.copyWith(
                                                  color: isDarkOn.value == true
                                                      ? colorWhite
                                                      : deepPurpleColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            Icon(Icons.verified,
                                                size: 18,
                                                color: isDarkOn.value == true
                                                    ? colorWhite
                                                    : blueColor)
                                          ],
                                        ),
                                        3.heightBox,
                                        Text(
                                          'best post',
                                          style: blackInter15W500.copyWith(
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                              '1 Hour ago',
                                              style: FontStyleUtility
                                                  .blackInter22W500
                                                  .copyWith(
                                                      color:
                                                          isDarkOn.value == true
                                                              ? colorLightWhite
                                                              : colorGrey,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w400),
                                            ),
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
                                                      textAlign:
                                                          TextAlign.center,
                                                      msg:
                                                          'Are you sure you want to delete this comment ?',
                                                      context: context,
                                                      callback: () {
                                                        kNotificationController
                                                            .notificationDeleteApiCall(
                                                                {}, () {
                                                          kNotificationController
                                                              .notificationApiCall(
                                                                  {}, () {});
                                                        });
                                                      });
                                                },
                                                icon: const Icon(
                                                    Icons.delete_outline,
                                                    size: 20.0),
                                                padding: EdgeInsets.zero,
                                                visualDensity:
                                                    const VisualDensity(
                                                        vertical: VisualDensity
                                                            .minimumDensity)),
                                            const Spacer(),
                                            StreamBuilder<Object>(
                                                stream: kHomeController
                                                    .likeButton.stream,
                                                builder: (context, snapshot) {
                                                  return IconButton(
                                                      splashColor: colorRed,
                                                      splashRadius: 20.0,
                                                      padding: EdgeInsets.zero,
                                                      visualDensity:
                                                          const VisualDensity(
                                                              vertical:
                                                                  VisualDensity
                                                                      .minimumDensity),
                                                      onPressed: () {
                                                        kHomeController
                                                                .likeButton
                                                                .value =
                                                            !kHomeController
                                                                .likeButton
                                                                .value;
                                                      },
                                                      icon: Icon(
                                                        kHomeController
                                                                    .likeButton
                                                                    .value ==
                                                                true
                                                            ? CupertinoIcons
                                                                .heart_fill
                                                            : CupertinoIcons
                                                                .suit_heart,
                                                        size: 18,
                                                        color: kHomeController
                                                                    .likeButton
                                                                    .value ==
                                                                true
                                                            ? colorRed
                                                            : isDarkOn.value ==
                                                                    true
                                                                ? colorLightWhite
                                                                : colorGrey,
                                                      ));
                                                }),
                                          ],
                                        )
                                      ],
                                    );
                                  }),
                            )
                          ],
                        ).paddingOnly(bottom: 10)
                      : commonTextField(
                          hintText: 'Write a comment press send..',
                          textEditingController: null,
                          inputAction: TextInputAction.send,
                          borderRadiusColor: colorGreyOpacity30,
                          isPassword: false,
                          onFieldSubmit: (value) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          });
                })
            : const SizedBox(),
      ),
      20.heightBox
    ],
  );
}
