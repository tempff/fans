class ApiConfig {

  ///Old URL
  // static const String baseUrl = "https://fans2.co.tz/api";
  static const String baseUrl = "https://alpha.fans2.co.tz/api";



  static const String appName = "Fans";

  static const String methodPOST = "post";
  static const String methodGET = "get";
  static const String methodPUT = "put";
  static const String methodDELETE = "delete";

  static const String error = "Error";
  static const String success = "Success";
  static const String warning = "Warning";
  static const String subUrlUser = "/user/";


  static const String loginUser = '$baseUrl/login';
  static const String signupUser = '$baseUrl/register';
  static const String forgotPassword = '$baseUrl/password/email';
  static const String mySubscribers = '$baseUrl/my/subscribers';
  static const String mySubscriptions = '$baseUrl/my/subscriptions';
  static const String myPosts = '$baseUrl/my/posts';
  static const String notifications = '$baseUrl/notifications';
  static const String notificationsDelete = '$baseUrl/notifications/delete';
  static const String register = '$baseUrl/register';
  static const String bookmarks = '$baseUrl/my/user/bookmarks';
  static const String addBookmark = '$baseUrl/add/bookmark';
  static const String myPage = '$baseUrl/user';
  static const String restrictions = '$baseUrl/settings/restrictions';
  static const String deleteCover = '$baseUrl/delete/cover';
  static const String messages = '$baseUrl/messages';
  static const String pinPost = '$baseUrl/pin/post';
  static const String home = '$baseUrl/home';
}
