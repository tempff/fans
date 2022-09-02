import 'dart:convert';

import 'package:fans/API/api_call.dart';
import 'package:fans/API/api_config.dart';
import 'package:fans/moduls/Home/home/model/add_bookmark_model.dart';
import 'package:fans/moduls/Home/home/model/bookmark_model.dart';
import 'package:fans/moduls/Home/home/model/get_user_model.dart';
import 'package:fans/moduls/Home/home/model/home_model.dart';
import 'package:fans/moduls/Home/home/model/my_post_model.dart';
import 'package:fans/moduls/Home/home/model/pin_post_model.dart';
import 'package:fans/moduls/Home/home/model/post_comment_model.dart';
import 'package:fans/moduls/Home/home/model/post_like_model.dart';
import 'package:fans/moduls/Home/home/model/search_home_model.dart';
import 'package:fans/moduls/Home/home/model/upload_create_model.dart';
import 'package:fans/moduls/Home/home/model/upload_media_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../Utility/common_function.dart';

class HomeController extends GetxController {
  // final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  RxBool likeButton = false.obs;
  RxBool bookmarkButton = false.obs;
  RxBool imageShowing = false.obs;
  ImagePicker imagePicker = ImagePicker();
  RxList<XFile>? selectedImages;
  RxList imageFileList = [].obs;
  RxList<LikeDataStore> likeDataStoreList = <LikeDataStore>[].obs;
  RxBool? loadValue = true.obs;
  bool pageLoading = false;

  ScrollController homeScrollController = ScrollController();

  // RxList<Map<String, dynamic>> addFieldsModelList = <Map<String, dynamic>>[].obs;

  ///My Post Api Call

  Rx<MyPostModel> myPostModel = MyPostModel().obs;

  myPostApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        success: (dio.Response<dynamic> response) {
          try {
            myPostModel.value = MyPostModel.fromJson(json.decode(response.data));
            print('><><><><>${myPostModel.value}');
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        isProgressShow: true,
        params: {},
        methodType: MethodType.get,
        isPassHeader: true,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        url: ApiConfig.myPosts);
  }

  ///Bookmark Api Cal

  Rx<BookmarkModel> bookMarkModel = BookmarkModel().obs;

  bookMarkApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        success: (dio.Response<dynamic> response) {
          try {
            bookMarkModel.value = BookmarkModel.fromJson(response.data);
            callback();
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        isProgressShow: true,
        params: {},
        methodType: MethodType.get,
        isPassHeader: true,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        url: ApiConfig.bookmarks);
  }

  ///Add Bookmark Api Call

  Rx<AddBookmarkModel> addBookMarkModel = AddBookmarkModel().obs;

  addBookMarkApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        success: (dio.Response<dynamic> response) {
          try {
            addBookMarkModel.value = AddBookmarkModel.fromJson(json.decode(response.data));
            callback();
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        isProgressShow: false,
        params: params,
        methodType: MethodType.post,
        isPassHeader: true,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        url: ApiConfig.addBookmark);
  }

  ///Pin Post Api Call

  Rx<PinPostModel> pinPostModel = PinPostModel().obs;

  pinPostApiCall(Map<String, dynamic> params, Function callback) {
    Api().call(
        success: (dio.Response<dynamic> response) {
          try {
            pinPostModel.value = PinPostModel.fromJson(json.decode(response.data));
            callback();
          } catch (e) {
            Fluttertoast.showToast(msg: e.toString());
          }
        },
        isProgressShow: true,
        params: params,
        methodType: MethodType.post,
        isPassHeader: true,
        error: (dio.Response<dynamic> response) {
          showLog(response.toString());
        },
        url: ApiConfig.pinPost);
  }

  /// Home Api Call

  Rx<HomePageModel> homePageModel = HomePageModel().obs;
  RxList<Datum> homePostData = <Datum>[].obs;

  homePageApiCall(Map<String, dynamic> params, Function callback, loadValue,{bool refresh = false}) {
    Api().call(
      url: ApiConfig.home,
      success: (dio.Response<dynamic> response) {
        try {
          loadValue.value = false;
          homePageModel.value = HomePageModel.fromJson(response.data);

          if (homePageModel.value.data != null) {
            if (refresh)
            {
              homePostData.clear();
              likeDataStoreList.clear();
            }

            homePageModel.value.data?.updates?.data?.forEach((element) {
              homePostData.add(element);
              likeDataStoreList
                  .add(LikeDataStore(id: element.id, isLiked: element.isLiked, likeCount: element.likeCount, isBookmark: element.isBookmarked));

              print('homePostData Length = ${homePostData.length}');
              print('likeDataStoreList Length ==>> ${likeDataStoreList.length}');
              // likeDataStoreList
              //     .add(LikeDataStore(id: element.id, isLiked: element.isLiked, likeCount: element.likeCount, isBookmark: element.isBookmarked));
            });
          }
          callback();
        } catch (e) {
          e.toString();
        }
      },
      isPassHeader: true,
      methodType: MethodType.get,
      error: (dio.Response<dynamic> response) {
        Fluttertoast.showToast(msg: json.decode(response.statusMessage ?? ''), toastLength: Toast.LENGTH_LONG);
      },
      isProgressShow: loadValue.value == true ? true : false,
      params: params,
    );
  }

  ///Post Like Api Call

  Rx<PostLikeModel> postLikeModel = PostLikeModel().obs;

  postLikeApiCall(
    Map<String, dynamic> params,
    Function callback,
  ) {
    Api().call(
      url: ApiConfig.postLike,
      success: (dio.Response<dynamic> response) {
        try {
          postLikeModel.value = PostLikeModel.fromJson(json.decode(response.data));
          callback();
        } catch (e) {
          e.toString();
        }
      },
      isPassHeader: true,
      methodType: MethodType.post,
      error: (dio.Response<dynamic> response) {
        Fluttertoast.showToast(msg: json.decode(response.statusMessage ?? ''), toastLength: Toast.LENGTH_LONG);
      },
      isProgressShow: false,
      params: params,
    );
  }

  ///Post Comment Api Call

  Rx<PostCommentModel> postCommentModel = PostCommentModel().obs;

  postCommentApiCall(
    Map<String, dynamic> params,
    Function callback,
  ) {
    Api().call(
        url: ApiConfig.postComment,
        success: (dio.Response<dynamic> response) {
          try {
            postCommentModel.value = PostCommentModel.fromJson(json.decode(response.data));
            callback();
          } catch (e) {
            e.toString();
          }
        },
        methodType: MethodType.post,
        isProgressShow: true,
        params: params,
        error: (dio.Response<dynamic> response) {
          Fluttertoast.showToast(msg: json.decode(response.statusMessage ?? ''), toastLength: Toast.LENGTH_LONG);
        },
        isPassHeader: true);
  }

  /// Upload Media Api Call

  Rx<UploadMediaModel> uploadMediaModel = UploadMediaModel().obs;

  uploadMediaApiCall(
    dio.FormData formData,
    Function callback,
  ) {
    Api().call(
        url: ApiConfig.uploadMedia,
        success: (dio.Response<dynamic> response) {
          try {
            uploadMediaModel.value = UploadMediaModel.fromJson(json.decode(response.data));
            callback();
          } catch (e) {
            e.toString();
          }
        },
        methodType: MethodType.post,
        isProgressShow: true,
        formValues: formData,
        error: (dio.Response<dynamic> response) {
          Fluttertoast.showToast(msg: json.decode(response.statusMessage ?? ''), toastLength: Toast.LENGTH_LONG);
        },
        isPassHeader: true);
  }

  /// Upload Create Media Api Call

  Rx<UploadCreateModel> uploadCreateModel = UploadCreateModel().obs;

  uploadCreateApiCall(
    Map<String, dynamic> params,
    Function callback,
  ) {
    Api().call(
        url: ApiConfig.updateCreate,
        success: (dio.Response<dynamic> response) {
          try {
            uploadCreateModel.value = UploadCreateModel.fromJson(json.decode(response.data));
            /*  uploadMediaModel.value.success == false{

            }*/
            callback();
          } catch (e) {
            e.toString();
          }
        },
        methodType: MethodType.post,
        isProgressShow: true,
        params: params,
        error: (dio.Response<dynamic> response) {
          Fluttertoast.showToast(msg: json.decode(response.statusMessage ?? ''), toastLength: Toast.LENGTH_LONG);
        },
        isPassHeader: true);
  }

  Rx<SearchHomeModel> searchHomeModel = SearchHomeModel().obs;

  searchHomeApiCall(
    Map<String, dynamic> params,
    Function callback,
  ) {
    Api().call(
        url: ApiConfig.searchCreators,
        success: (dio.Response<dynamic> response) {
          try {
            searchHomeModel.value = SearchHomeModel.fromJson(response.data);
            /*  uploadMediaModel.value.success == false{

            }*/
            callback();
          } catch (e) {
            e.toString();
          }
        },
        methodType: MethodType.get,
        isProgressShow: false,
        params: params,
        error: (dio.Response<dynamic> response) {
          Fluttertoast.showToast(msg: json.decode(response.statusMessage ?? ''), toastLength: Toast.LENGTH_LONG);
        },
        isPassHeader: true);
  }


  /// Get User Data

  Rx<GetUserModel> getUserModel = GetUserModel().obs;

  getUserApiCall(
      Map<String, dynamic> params,
      Function callback,
      ) {
    Api().call(
        url: ApiConfig.user,
        success: (dio.Response<dynamic> response) {
          try {
            getUserModel.value = GetUserModel.fromJson(response.data);
            callback();
          } catch (e) {
            e.toString();
          }
        },
        methodType: MethodType.get,
        isProgressShow: true,
        params: params,
        error: (dio.Response<dynamic> response) {
          Fluttertoast.showToast(msg: json.decode(response.statusMessage ?? ''), toastLength: Toast.LENGTH_LONG);
        },
        isPassHeader: true);
  }



}

class LikeDataStore {
  int? id;
  bool? isLiked;
  bool? isBookmark;
  int? likeCount;

  LikeDataStore({this.likeCount, this.id, this.isLiked, this.isBookmark});
}
