// To parse this JSON data, do
//
//     final addBookmarkModel = addBookmarkModelFromJson(jsonString);

import 'dart:convert';

AddBookmarkModel addBookmarkModelFromJson(String str) => AddBookmarkModel.fromJson(json.decode(str));

String addBookmarkModelToJson(AddBookmarkModel data) => json.encode(data.toJson());

class AddBookmarkModel {
  AddBookmarkModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory AddBookmarkModel.fromJson(Map<String, dynamic> json) => AddBookmarkModel(
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
    this.type,
  });

  String? type;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
      };
}
