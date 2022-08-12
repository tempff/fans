// To parse this JSON data, do
//
//     final postLikeModel = postLikeModelFromJson(jsonString);

import 'dart:convert';

PostLikeModel postLikeModelFromJson(String str) =>
    PostLikeModel.fromJson(json.decode(str));

String postLikeModelToJson(PostLikeModel data) => json.encode(data.toJson());

class PostLikeModel {
  PostLikeModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory PostLikeModel.fromJson(Map<String, dynamic> json) => PostLikeModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        success: json["success"] == null ? null : json["success"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data?.toJson(),
        "message": message == null ? null : message,
        "success": success == null ? null : success,
        "status_code": statusCode == null ? null : statusCode,
      };
}

class Data {
  Data({
    this.liked,
    this.total,
  });

  bool? liked;
  dynamic total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        liked: json["liked"] == null ? null : json["liked"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "liked": liked == null ? null : liked,
        "total": total,
      };
}
