// To parse this JSON data, do
//
//     final notificationDeleteModel = notificationDeleteModelFromJson(jsonString);

import 'dart:convert';

NotificationDeleteModel notificationDeleteModelFromJson(String str) =>
    NotificationDeleteModel.fromJson(json.decode(str));

String notificationDeleteModelToJson(NotificationDeleteModel data) =>
    json.encode(data.toJson());

class NotificationDeleteModel {
  NotificationDeleteModel({
    this.message,
  });

  String? message;

  factory NotificationDeleteModel.fromJson(Map<String, dynamic> json) =>
      NotificationDeleteModel(
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
      };
}
