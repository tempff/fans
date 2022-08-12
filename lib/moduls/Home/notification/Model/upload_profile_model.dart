// To parse this JSON data, do
//
//     final uploadProfileModel = uploadProfileModelFromJson(jsonString);

import 'dart:convert';

UploadProfileModel uploadProfileModelFromJson(String str) =>
    UploadProfileModel.fromJson(json.decode(str));

String uploadProfileModelToJson(UploadProfileModel data) =>
    json.encode(data.toJson());

class UploadProfileModel {
  UploadProfileModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory UploadProfileModel.fromJson(Map<String, dynamic> json) =>
      UploadProfileModel(
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
    this.avatar,
  });

  String? avatar;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar == null ? null : avatar,
      };
}
