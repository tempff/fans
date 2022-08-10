// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) =>
    NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) =>
    json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.notifications,
  });

  List<Notification>? notifications;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        notifications: json["notifications"] == null
            ? null
            : List<Notification>.from(
                json["notifications"].map((x) => Notification.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notifications": notifications == null
            ? null
            : List<dynamic>.from(notifications?.map((x) => x.toJson()) ?? []),
      };
}

class Notification {
  Notification({
    this.idNoty,
    this.type,
    this.target,
    this.createdAt,
    this.userId,
    this.username,
    this.hideName,
    this.name,
    this.avatar,
    this.id,
    this.description,
    this.usernameAuthor,
    this.message,
    this.userDestination,
    this.productName,
  });

  int? idNoty;
  int? type;
  int? target;
  DateTime? createdAt;
  int? userId;
  String? username;
  String? hideName;
  String? name;
  String? avatar;
  int? id;
  String? description;
  String? usernameAuthor;
  dynamic message;
  dynamic userDestination;
  dynamic productName;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
        idNoty: json["id_noty"] == null ? null : json["id_noty"],
        type: json["type"] == null ? null : json["type"],
        target: json["target"] == null ? null : json["target"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        userId: json["userId"] == null ? null : json["userId"],
        username: json["username"] == null ? null : json["username"],
        hideName: json["hide_name"] == null ? null : json["hide_name"],
        name: json["name"] == null ? null : json["name"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
        usernameAuthor:
            json["usernameAuthor"] == null ? null : json["usernameAuthor"],
        message: json["message"],
        userDestination: json["userDestination"],
        productName: json["productName"],
      );

  Map<String, dynamic> toJson() => {
        "id_noty": idNoty == null ? null : idNoty,
        "type": type == null ? null : type,
        "target": target == null ? null : target,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "userId": userId == null ? null : userId,
        "username": username == null ? null : username,
        "hide_name": hideName == null ? null : hideName,
        "name": name == null ? null : name,
        "avatar": avatar == null ? null : avatar,
        "id": id == null ? null : id,
        "description": description == null ? null : description,
        "usernameAuthor": usernameAuthor == null ? null : usernameAuthor,
        "message": message,
        "userDestination": userDestination,
        "productName": productName,
      };
}
