// To parse this JSON data, do
//
//     final addBookmarkModel = addBookmarkModelFromJson(jsonString);

import 'dart:convert';

AddBookmarkModel addBookmarkModelFromJson(String str) => AddBookmarkModel.fromJson(json.decode(str));

String addBookmarkModelToJson(AddBookmarkModel data) => json.encode(data.toJson());

class AddBookmarkModel {
  AddBookmarkModel({
    this.success,
    this.type,
  });

  bool? success;
  String? type;

  factory AddBookmarkModel.fromJson(Map<String, dynamic> json) => AddBookmarkModel(
    success: json["success"] == null ? null : json["success"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "type": type == null ? null : type,
  };
}
