// To parse this JSON data, do
//
//     final pinPostModel = pinPostModelFromJson(jsonString);

import 'dart:convert';

PinPostModel pinPostModelFromJson(String str) => PinPostModel.fromJson(json.decode(str));

String pinPostModelToJson(PinPostModel data) => json.encode(data.toJson());

class PinPostModel {
  PinPostModel({
    this.success,
    this.status,
  });

  bool? success;
  String? status;

  factory PinPostModel.fromJson(Map<String, dynamic> json) => PinPostModel(
    success: json["success"] == null ? null : json["success"],
    status: json["status"] == null ? null : json["status"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "status": status == null ? null : status,
  };
}
