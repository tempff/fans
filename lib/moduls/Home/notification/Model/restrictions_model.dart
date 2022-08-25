// To parse this JSON data, do
//
//     final restrictionsModel = restrictionsModelFromJson(jsonString);

import 'dart:convert';

RestrictionsModel restrictionsModelFromJson(String str) => RestrictionsModel.fromJson(json.decode(str));

String restrictionsModelToJson(RestrictionsModel data) => json.encode(data.toJson());

class RestrictionsModel {
  RestrictionsModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory RestrictionsModel.fromJson(Map<String, dynamic> json) => RestrictionsModel(
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
    this.restrictions,
  });

  List<Restriction>? restrictions;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    restrictions: json["restrictions"] == null ? null : List<Restriction>.from(json["restrictions"].map((x) => Restriction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restrictions": restrictions == null ? null : List<dynamic>.from(restrictions?.map((x) => x.toJson())??[]),
  };
}

class Restriction {
  Restriction({
    this.id,
    this.userId,
    this.userRestricted,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? userId;
  int? userRestricted;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Restriction.fromJson(Map<String, dynamic> json) => Restriction(
    id: json["id"] == null ? null : json["id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    userRestricted: json["user_restricted"] == null ? null : json["user_restricted"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "user_id": userId == null ? null : userId,
    "user_restricted": userRestricted == null ? null : userRestricted,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
  };
}
