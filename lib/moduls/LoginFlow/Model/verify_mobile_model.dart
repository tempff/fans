// To parse this JSON data, do
//
//     final verifyMobileModel = verifyMobileModelFromJson(jsonString);

import 'dart:convert';

VerifyMobileModel verifyMobileModelFromJson(String str) => VerifyMobileModel.fromJson(json.decode(str));

String verifyMobileModelToJson(VerifyMobileModel data) => json.encode(data.toJson());

class VerifyMobileModel {
  VerifyMobileModel({
    this.success,
    this.message,
  });

  bool? success;
  String? message;

  factory VerifyMobileModel.fromJson(Map<String, dynamic> json) => VerifyMobileModel(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}
