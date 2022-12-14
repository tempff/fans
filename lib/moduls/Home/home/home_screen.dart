import 'dart:async';
import 'dart:io';
import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:fans/moduls/Home/home/goto_post_screen.dart';
import 'package:fans/moduls/Home/notification/View/my_page_screen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';

import 'package:lottie/lottie.dart';
import 'package:mime/mime.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:video_player/video_player.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../utility/theme_data.dart';
import '../../../utility/utility_export.dart';
import 'package:dio/dio.dart' as dio;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

FirebaseAnalytics analytics = FirebaseAnalytics.instance;
// VideoPlayerController? videoPlayerController;
Future<void>? videoPlayerFuture;
ChewieController? chewieController;
File? zipFileData;
RxBool zipBool = false.obs;
RxBool isMessage = false.obs;
TextEditingController postTextController = TextEditingController();
TextEditingController editPostTextController = TextEditingController();
List<TextEditingController> postCommentController = [];
RxString postText = ''.obs;
RxBool commentValue = true.obs;
RefreshController _refreshController = RefreshController(initialRefresh: true);
List<dynamic> dataList = [];
RxList<String> videoThumbnail = <String>[].obs;
String? videoThumbnailTemp;
RxString lockValue = 'yes'.obs;
BetterPlayerController? betterPlayerController;
int _page = 1;

late ScrollController _controller;

class _HomeScreenState extends State<HomeScreen> {
  final int _limit = 3;

  bool _isFirstLoadRunning = false;
  bool _hasNextPage = true;

  bool _isLoadMoreRunning = false;

  List _posts = [];

  @override
  void initState() {
    super.initState();
    /* kHomeController.myPostApiCall({}, () {
      kHomeController.myPostModel.refresh();
    });*/

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Map<String, dynamic> params = {'page': _page};
      // dataList.clear();
      // kHomeController.likeDataStoreList.clear();
      kHomeController.homePageApiCall(params, () {
        kHomeController.getUserApiCall({}, () {});

        /*   kHomeController.homePageModel.value.data?.updates?.data?.forEach((element) {
          dataList.add(element);
        });

        kHomeController.homePageModel.value.data?.updates?.data?.forEach((element) {
          kHomeController.likeDataStoreList
              .add(LikeDataStore(id: element.id, isLiked: element.isLiked, likeCount: element.likeCount, isBookmark: element.isBookmarked));
        });*/

        // _controller = ScrollController()..addListener(_loadMore);
      }, true.obs);

      // _firstLoad();
      // _controller = ScrollController()..addListener(_loadMore);
    });

    //
    /* videoPlayerController = VideoPlayerController.network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4');
    videoPlayerFuture = videoPlayerController?.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,
      autoPlay: true,
      looping: true,
    );
    videoPlayerController?.setLooping(true);*/ // videoPlayerController?.play();
  }

  @override
  void dispose() {
    chewieController?.dispose();
    betterPlayerController?.dispose();
    super.dispose();
  }

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
            child: homeViewData(true, context, '', setState(() {}), mounted)));
  }
}

void actionPopUpItemSelected(String value, String? name, BuildContext context,
    int? id, String? description, String? image) {
  // kHomeController.scaffoldkey.currentState?.hideCurrentSnackBar();
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

Widget homeViewData(bool? visible, BuildContext context, String? value,
    void setState, bool mounted) {
  RxBool isExpansionTileOpen = false.obs;

  return SmartRefresher(
    controller: _refreshController,
    enablePullDown: true,
    enablePullUp: true,
    header: const WaterDropHeader(),
    onRefresh: () async {
      await Future.delayed(const Duration(milliseconds: 1000));
      _refreshController.refreshCompleted();
      _page = 1;
      Map<String, dynamic> params = {'page': _page};
      kHomeController.homePageApiCall(params, () async {}, false.obs,
          refresh: true);
    },
    onLoading: () async {
      if (kHomeController.pageLoading == false) {
        kHomeController.pageLoading == true;
        if ((kHomeController.homePageModel.value.data?.updates?.currentPage)! <
            int.parse(kHomeController
                    .homePageModel.value.data?.updates?.lastPage
                    .toString() ??
                '1')) {
          _page += 1;
          Map<String, dynamic> params = {'page': _page};
          kHomeController.homePageApiCall(params, () {
            kHomeController.pageLoading = false;
            _refreshController.loadComplete();
            print("Data loaded successfully...");
          }, false.obs);
        } else {
          // _refreshController.loadComplete();
          _refreshController.loadNoData();
          // Fluttertoast.showToast(msg: 'Page pura thay gya bhai....have bv na hoy');
        }
      }

      if (mounted) setState;
      print('::::::::::>>>>>>>');
      // _refreshController.loadComplete();
    },
    child: RawScrollbar(
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
                      maxLength: 5000,
                      onChanged: (val) {
                        postText.value = val;
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        hintText: 'Write something...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        counter: Container(),
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
              Obx(() {
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
                                    itemCount:
                                        (kHomeController.imageFileList.length) +
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
                                                            right: 12, top: 5),
                                                    child: Center(
                                                      child: kHomeController.imageFileList[index].path
                                                                  .endsWith(
                                                                      ".mp3") ||
                                                              kHomeController
                                                                  .imageFileList[
                                                                      index]
                                                                  .path
                                                                  .endsWith(
                                                                      ".mpeg")
                                                          ? Container(
                                                              height: 130,
                                                              width: 130,
                                                              color:
                                                                  lightPurpleColor,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  const Expanded(
                                                                    flex: 3,
                                                                    child: Icon(
                                                                      Icons
                                                                          .music_note_sharp,
                                                                      size:
                                                                          50.0,
                                                                      color:
                                                                          colorWhite,
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Text(
                                                                        '${kHomeController.imageFileList[index].path.split('/').last}',
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        style: FontStyleUtility
                                                                            .whiteInter16W500,
                                                                      ).paddingSymmetric(
                                                                              horizontal: 5.0))
                                                                ],
                                                              ),
                                                            )
                                                          : kHomeController.imageFileList[index].path.endsWith(".mp4") == true ||
                                                                  kHomeController.imageFileList[index].path
                                                                      .endsWith(
                                                                          ".avi") ||
                                                                  kHomeController.imageFileList[index].path
                                                                      .endsWith(
                                                                          ".3gp") ||
                                                                  kHomeController
                                                                      .imageFileList[
                                                                          index]
                                                                      .path
                                                                      .endsWith(
                                                                          ".mkv") ||
                                                                  kHomeController
                                                                      .imageFileList[index]
                                                                      .path
                                                                      .endsWith(".flv")
                                                              ? videoThumbnail.length >= index
                                                                  ? StreamBuilder<Object>(
                                                                      stream: videoThumbnail.stream,
                                                                      builder: (context, snapshot) {
                                                                        return videoThumbnail.isNotEmpty
                                                                            ? Stack(
                                                                                children: [
                                                                                  Image.file(
                                                                                    File(videoThumbnail[index]),
                                                                                    fit: BoxFit.cover,
                                                                                    width: 130,
                                                                                  ),
                                                                                  const Align(
                                                                                      alignment: Alignment.center,
                                                                                      child: Icon(
                                                                                        Icons.play_circle,
                                                                                        color: colorWhite,
                                                                                        size: 50,
                                                                                      )),
                                                                                ],
                                                                              )
                                                                            : const SizedBox();
                                                                      })
                                                                  : const SizedBox()
                                                              : Image.file(
                                                                  File(kHomeController
                                                                      .imageFileList[
                                                                          index]
                                                                      .path),
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      const Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            15),
                                                                    child: Icon(
                                                                      Icons
                                                                          .play_arrow,
                                                                      color:
                                                                          colorWhite,
                                                                      size: 30,
                                                                    ),
                                                                  ),
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: 130,
                                                                ),
                                                    )),
                                                Positioned(
                                                  top: 5,
                                                  right: 5,
                                                  child: IconButton(
                                                    visualDensity:
                                                        const VisualDensity(
                                                            vertical: VisualDensity
                                                                .minimumDensity),
                                                    padding: EdgeInsets.zero,
                                                    onPressed: () {
                                                      kHomeController
                                                          .imageFileList
                                                          .removeAt(index);
                                                      videoThumbnail
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
                                                FilePickerResult? result =
                                                    await FilePicker.platform
                                                        .pickFiles(
                                                            allowMultiple:
                                                                true);

                                                // if (result != null) {
                                                //   kHomeController.selectedImages?.value = result.paths.map((path) => XFile(path ?? '')).toList();
                                                // } else {
                                                // }
                                                //   // User canceled the picker

                                                if (result != null) {
                                                  for (var element
                                                      in result.files) {
                                                    await videoImage(
                                                        element.path ?? '');
                                                    kHomeController
                                                        .imageFileList
                                                        .addIf(
                                                            kHomeController
                                                                    .imageFileList
                                                                    .contains(
                                                                        element) ==
                                                                false,
                                                            element);
                                                    if (element.path != null) {
                                                      final mime =
                                                          lookupMimeType(
                                                              element.path!);
                                                      dio.FormData formData =
                                                          dio.FormData.fromMap({
                                                        "photo": await dio
                                                                .MultipartFile
                                                            .fromFile(
                                                                element.path!,
                                                                filename:
                                                                    element
                                                                        .name,
                                                                contentType: MediaType
                                                                    .parse(mime
                                                                        .toString())),
                                                      });

                                                      await kHomeController
                                                          .uploadMediaApiCall(
                                                              formData, () {});
                                                    }
                                                  }
                                                }

                                                /*
                                                final List<XFile>? selectedImages = await kHomeController.imagePicker.pickMultiImage();

                                                    if (selectedImages!.isNotEmpty) {
                                                      kHomeController.imageFileList.addAll(selectedImages);
                                                    }*/
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    border: Border.all(
                                                        color: isDarkOn.value ==
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
                                                        color: isDarkOn.value ==
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
                        color: isDarkOn.value == true
                            ? colorWhite
                            : deepPurpleColor,
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
                        color: isDarkOn.value == true
                            ? colorWhite
                            : deepPurpleColor,
                        size: 25,
                      ),
                    ),
                    20.widthBox,
                    IconButton(
                      onPressed: () {
                        lockValue.value == 'yes'
                            ? lockValue.value = 'no'
                            : lockValue.value = 'yes';
                      },
                      icon: Icon(
                        lockValue.value == 'yes'
                            ? Icons.lock_outline
                            : Icons.lock_open,
                        color: isDarkOn.value == true
                            ? colorWhite
                            : deepPurpleColor,
                        size: 25,
                      ),
                    ),
                    20.widthBox,
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: materialButton(
                            background:
                                MaterialStateProperty.all(lightPurpleColor),
                            text: 'Publish',
                            onTap: () async {
                              print(postTextController.value.text.toString());
                              await analytics.logEvent(
                                name: "select_content",
                                parameters: {
                                  "content_type": "button",
                                  "item_id": 1,
                                },
                              );

                              // videoParamsList.add(VideoParams(
                              //     key: 'file',
                              //     value: kHomeController.uploadMediaModel.value
                              //             .data?.files?[0]?.name ??
                              //         ''));
                              String fileString = '';
                              for (final e in kHomeController
                                  .uploadMediaModel.value.data!.files as List) {
                                fileString += "{\"file\": \"${e.name}\"},";
                              }
                              if (fileString != "") {
                                fileString = fileString.substring(
                                    0, fileString.length - 1);
                              }

                              Map<String, dynamic> params = {
                                "description":
                                    postTextController.value.text.toString(),
                                'price': 1000,
                                'fileuploader-list-photo': "[$fileString]",
                                'locked': lockValue.value
                              };

                              kHomeController.uploadCreateApiCall(params,
                                  (resp) {
                                print(resp);
                              });
                            },
                            height: 40.0,
                            width: 120,
                            textStyle: FontStyleUtility.blackInter16W500
                                .copyWith(color: colorWhite, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
              18.heightBox,
              Align(
                  alignment: Alignment.centerRight,
                  child: StreamBuilder<Object>(
                      stream: postText.stream,
                      builder: (context, snapshot) {
                        return Text(
                          '${postText.value.length}/5000',
                          style: FontStyleUtility.greyInter14W500
                              .copyWith(fontWeight: FontWeight.w400),
                        );
                      }))
            ],
          ),
          15.heightBox,

          /*value == 'All Post'? (kHomeController.myPostModel.value.posts?.isNotEmpty == true && kHomeController.myPostModel.value.posts != null): (value == ''?kHomeController.homePageModel.value.data.updates.data.isNotEmpty==true kHomeController.homePageModel.value.data.updates !=null)
                ?*/

          StreamBuilder<Object>(
              stream: kHomeController.homePageModel.stream,
              builder: (context, snapshot) {
                return kHomeController.homePostData.length != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value == 'All Post'
                            ? (kHomeController
                                    .myPostModel.value.posts?.length ??
                                0)
                            : kHomeController.homePostData.length ?? 0,
                        itemBuilder: (context, index) {
                          return commonPost(
                            context,
                            postIndex: index,
                            name:
                                kHomeController.homePostData[index].user?.name,
                            date: kHomeController.homePostData[index].date,
                            price: kHomeController.homePostData[index].price,
                            username: kHomeController
                                .homePostData[index].user?.username,
                            description:
                                kHomeController.homePostData[index].description,
                            likeCounts:
                                kHomeController.homePostData[index].likeCount ??
                                    0,
                            commentsCounts: kHomeController
                                .homePostData[index].commentCount
                                .toString(),
                          );
                        })
                    : SizedBox(
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
                      );
              })
        ],
      ),
    ),
  );
}

List<VideoParams> videoParamsList = <VideoParams>[];

class VideoParams {
  String key;
  String value;

  VideoParams({required this.key, required this.value});
}

Future videoImage(String path) async {
  if (path.endsWith(".mp4") ||
      path.endsWith(".avi") ||
      path.endsWith(".3gp") ||
      path.endsWith(".mkv") ||
      path.endsWith(".flv")) {
    videoThumbnailTemp = await VideoThumbnail.thumbnailFile(
      video: path,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 130,
      maxHeight: 130,
      quality: 100,
    );

    videoThumbnail.addIf(videoThumbnail.contains(videoThumbnailTemp) == false,
        videoThumbnailTemp ?? path);

    print('ioioi${videoThumbnail}');
    // return videoThumbnail;
  } else {
    videoThumbnail.addIf(videoThumbnail.contains(path) == false, path);
    // return videoThumbnail;
  }
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
    {required int postIndex,
    String? data,
    String? name,
    String? username,
    DateTime? date,
    String? description,
    String? commentsCounts,
    int likeCounts = 0,
    String? price,
    int? bookmarkId,
    bool? isBookmarked}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      /// Post Top portion
      postChangesData(context, postIndex, name, price, description, date),

      10.heightBox,

      /// Video Image File

      kHomeController.homePostData[postIndex].media?.isNotEmpty == true &&
              kHomeController.homePostData[postIndex].media?[0].type == 'video'
          ? AspectRatio(
              aspectRatio: 16 / 9,
              child: /*Chewie(
                controller: ChewieController(
                  videoPlayerController:
                      getController(kHomeController.homePostData[postIndex].media?[0].mediaHlsUrl ?? ''),
                  aspectRatio: 16 / 9,
                  autoPlay: false,
                  autoInitialize: true,
                  cupertinoProgressColors: ChewieProgressColors(
                      playedColor: lightPurpleColor,
                      backgroundColor: lightPurpleColor,
                      handleColor: lightPurpleColor,
                      bufferedColor: lightPurpleColor),
                  showControls: true,

                  // placeholder: Image.network(
                  //   kHomeController.homePostData[postIndex].media?[0].videoPosterUrl ?? '',
                  //   fit: BoxFit.cover,
                  // ),
                  looping: true,
                ),
              ),*/
                  /*    BetterPlayerListVideoPlayer(
                betterPlayerListVideoPlayerController: c,
                BetterPlayerDataSource(BetterPlayerDataSourceType.network, kHomeController.homePostData[postIndex].media?[0].mediaHlsUrl ?? ''),
                key: Key(kHomeController.homePostData[postIndex].media?[0].mediaHlsUrl ?? ''),
                playFraction: 0.8,
                autoPlay: true,
              ),*/
                  // VideoPlayerController()

                  BetterPlayer.network(
                      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4'),
            )
          : kHomeController.homePostData[postIndex].media?.isNotEmpty == true &&
                  kHomeController.homePostData[postIndex].media?[0].type ==
                      'image'
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: kHomeController
                            .homePostData[postIndex].media?[0].mediaUrl ??
                        '',
                    placeholder: (context, url) =>
                        Image(image: profilePlaceholder, fit: BoxFit.cover),
                    errorWidget: (context, url, error) =>
                        Image(image: profilePlaceholder, fit: BoxFit.cover),
                  ),
                )
              : kHomeController.homePostData[postIndex].media?.isNotEmpty ==
                          true &&
                      kHomeController.homePostData[postIndex].media?[0].type ==
                          'audio'
                  ? Container()
                  : kHomeController.homePostData[postIndex].media?.isNotEmpty ==
                              true &&
                          kHomeController
                                  .homePostData[postIndex].media?[0].type ==
                              'file'
                      ? const Icon(
                          Icons.folder_zip,
                          size: 80,
                          color: deepPurpleColor,
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: const SizedBox()),
      5.heightBox,

      /// Post Options
      postOptions(
        context,
        postIndex,
        commentsCounts,
        data,
        bookmarkId,
        isBookmarked,
      ),

      /// Comment Section

      commentSection(postIndex),

      20.heightBox
    ],
  );
}

/*double getVideoHeight(url) {
  videoPlayerController = VideoPlayerController.network(url);
  return videoPlayerController?.value.size.height ?? 250;
}*/

VideoPlayerController() {
  // videoPlayerController = VideoPlayerController.network(url);

  /*BetterPlayerDataSource betterPlayerDataSource =*/ BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
  betterPlayerController = BetterPlayerController(
    const BetterPlayerConfiguration(
        autoPlay: true,
        aspectRatio: 16 / 9), /*betterPlayerDataSource: betterPlayerDataSource*/
  );

  // return videoPlayerController ?? VideoPlayerController.network(url);

  // return _betterPlayerDataSource;
}

/*double getRatio(url) {
  videoPlayerController = VideoPlayerController.network(url);
  print('---- ${videoPlayerController?.value.aspectRatio}');
  return videoPlayerController?.value.aspectRatio ?? 0.0;
}*/

postOptions(
  BuildContext context,
  int postIndex,
  String? commentsCounts,
  String? data,
  int? bookmarkId,
  bool? isBookmarked,
) {
  return Obx(() {
    return Row(
      children: [
        IconButton(
            splashColor: colorRed,
            splashRadius: 20.0,
            onPressed: () {
              // kHomeController.likeButton.value = !kHomeController.likeButton.value;
              /*         kHomeController.homePageModel.value.data?.updates
                                          ?.data?[index].isLiked = !(kHomeController
                                              .homePageModel
                                              .value
                                              .data
                                              ?.updates
                                              ?.data?[index]
                                              .isLiked ??
                                          false);*/

              Map<String, dynamic> params = {
                'id': kHomeController.likeDataStoreList[postIndex].id
              };
              kHomeController.postLikeApiCall(params, () {
                // kHomeController.homePageApiCall({}, () {}, false);

                kHomeController.likeDataStoreList[postIndex].isLiked =
                    kHomeController.postLikeModel.value.data!.liked;

                if (kHomeController.likeDataStoreList[postIndex].isLiked ??
                    true) {
                  kHomeController.likeDataStoreList[postIndex].likeCount =
                      (kHomeController.likeDataStoreList[postIndex].likeCount ??
                              0) +
                          1;
                } else if ((kHomeController
                            .likeDataStoreList[postIndex].likeCount ??
                        0) >
                    0) {
                  kHomeController.likeDataStoreList[postIndex].likeCount =
                      (kHomeController.likeDataStoreList[postIndex].likeCount ??
                              1) -
                          1;
                }
                kHomeController.likeDataStoreList.refresh();
              });
            },
            icon: Icon(
              kHomeController.likeDataStoreList[postIndex].isLiked == true
                  ? CupertinoIcons.heart_fill
                  : CupertinoIcons.suit_heart,
              size: 25,
              color:
                  kHomeController.likeDataStoreList[postIndex].isLiked == true
                      ? colorRed
                      : isDarkOn.value == true
                          ? colorLightWhite
                          : colorGrey,
            )),
        Text(
          kHomeController.likeDataStoreList[postIndex].likeCount.toString(),
          overflow: TextOverflow.ellipsis,
          style: greyInter18W500.copyWith(
            color: isDarkOn.value == true ? colorLightWhite : colorGrey,
          ),
        ),
        2.widthBox,
        IconButton(
            onPressed: () {
              isMessage.value = !isMessage.value;
              commentValue.value = !commentValue.value;
            },
            icon: Icon(
              CupertinoIcons.chat_bubble,
              size: 22,
              color: isDarkOn.value == true ? colorLightWhite : colorGrey,
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
              color: isDarkOn.value == true ? colorLightWhite : colorGrey,
            )),
        const Spacer(),
        IconButton(
            splashColor: deepPurpleColor,
            splashRadius: 20.0,
            onPressed: () {
              kHomeController.bookmarkButton.value =
                  !kHomeController.bookmarkButton.value;
              Map<String, dynamic> params = {
                'id': data == 'bookmark'
                    ? (bookmarkId ?? '')
                    : kHomeController.likeDataStoreList[postIndex].id ?? '',
              };
              kHomeController.addBookMarkApiCall(params, () {
                if (kHomeController.addBookMarkModel.value.data?.type ==
                    'added') {
                  kHomeController.likeDataStoreList[postIndex].isBookmark =
                      true;
                  isBookmarked = true;
                } else {
                  kHomeController.likeDataStoreList[postIndex].isBookmark =
                      false;
                  isBookmarked = false;
                }
                kHomeController.likeDataStoreList.refresh();

                /*   data == 'bookmark'
                                ? kHomeController.bookMarkApiCall({}, () {
                                    kHomeController.homePageApiCall({}, () {}, false);
                                  })
                                : kHomeController.homePageApiCall({}, () {}, false);*/
              });
            },
            icon: data == 'bookmark'
                ? Icon(
                    isBookmarked == true
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    size: 23,
                    color: isBookmarked == true
                        ? deepPurpleColor
                        : isDarkOn.value == true
                            ? colorLightWhite
                            : colorGrey,
                  )
                : Icon(
                    kHomeController.likeDataStoreList[postIndex].isBookmark ==
                            true
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    size: 23,
                    color: kHomeController
                                .likeDataStoreList[postIndex].isBookmark ==
                            true
                        ? deepPurpleColor
                        : isDarkOn.value == true
                            ? colorLightWhite
                            : colorGrey,
                  )),
      ],
    );
  });
}

postChangesData(BuildContext context, int postIndex, String? name,
    String? price, String? description, DateTime? date) {
  return Obx(() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHomeController.pinPostModel.value.status == 'pin'
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
            : const SizedBox(),
        10.heightBox,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(35), // Image radius
                child: kHomeController.homePostData[postIndex].user?.avatarUrl
                            ?.isNotEmpty ==
                        true
                    ? CachedNetworkImage(
                        height: 40.0,
                        width: 40.0,
                        fit: BoxFit.fill,
                        imageUrl: kHomeController
                                .homePostData[postIndex].user?.avatarUrl ??
                            '',
                        placeholder: (context, url) =>
                            Image(image: profilePlaceholder, fit: BoxFit.cover),
                        errorWidget: (context, url, error) =>
                            Image(image: profilePlaceholder, fit: BoxFit.cover),
                      )
                    : Center(
                        child: Image.asset(
                          'user',
                          scale: 3.5,
                          height: 40.0,
                          width: 40.0,
                          fit: BoxFit.fill,
                        ),
                      ),
              ),
            ),
            20.widthBox,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      name ?? '',
                      style: FontStyleUtility.blackInter22W500
                          .copyWith(fontSize: 18)
                          .copyWith(
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
                      '@${/*username ??*/ 'opopooppo'}',
                      overflow: TextOverflow.ellipsis,
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
                      kHomeController
                                  .myPostModel.value.posts?[postIndex].locked ==
                              'yes'
                          ? Icons.lock_outline
                          : Icons.public_outlined,
                      color:
                          isDarkOn.value == true ? colorLightWhite : colorGrey,
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
            ),
            Expanded(
              child: PopupMenuButton(
                icon: const Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.more_horiz,
                    size: 35,
                    color: colorGrey,
                  ),
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
                  kHomeController.myPostModel.value.posts?[postIndex].id,
                  kHomeController
                      .myPostModel.value.posts?[postIndex].description,
                  kHomeController.myPostModel.value.posts?[postIndex].image,
                ),
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
      ],
    );
  });
}

commentSection(int postIndex) {
  return Obx(() {
    return Column(
      children: [
        isMessage.value == true
            ? ListView.builder(
                itemCount: 2 + 1,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  postCommentController.add(TextEditingController());
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
                          textEditingController:
                              postCommentController[postIndex],
                          inputAction: TextInputAction.send,
                          borderRadiusColor: colorGreyOpacity30,
                          onFieldSubmit: (value) {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Map<String, dynamic> params = {
                              'update_id': kHomeController
                                  .homePostData[postIndex].id
                                  .toString(),
                              'comment':
                                  postCommentController[postIndex].value.text
                            };
                            kHomeController.postCommentApiCall(params, () {
                              Map<String, dynamic> params = {'page': _page};
                              kHomeController.homePageApiCall(
                                  params, () {}, false);
                            });
                          });
                })
            : const SizedBox(),
        kHomeController.homePostData[postIndex].latestComment != null &&
                commentValue.value == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      5.widthBox,
                      Text(
                        kHomeController.homePostData[postIndex].latestComment
                                ?.user?.username ??
                            '',
                        overflow: TextOverflow.ellipsis,
                        style: greyInter18W500.copyWith(
                            color: isDarkOn.value == true
                                ? colorWhite
                                : deepPurpleColor,
                            fontSize: 16),
                      ),
                      5.widthBox,
                      Expanded(
                        child: Text(
                          kHomeController.homePostData[postIndex].latestComment
                                  ?.reply ??
                              '',
                          overflow: TextOverflow.ellipsis,
                          style: greyInter18W500.copyWith(
                              color: isDarkOn.value == true
                                  ? colorLightWhite
                                  : colorGrey,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  5.heightBox,
                  InkWell(
                    onTap: () {
                      isMessage.value = !isMessage.value;
                      commentValue.value = !commentValue.value;
                    },
                    child: Text(
                      'View all comment',
                      overflow: TextOverflow.ellipsis,
                      style: greyInter18W500.copyWith(
                          color: isDarkOn.value == true
                              ? colorWhite
                              : colorLightWhite,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ).paddingOnly(left: 5.0),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  });
}
