// To parse this JSON data, do
//
//     final signupModel = signupModelFromJson(jsonString);

import 'dart:convert';

SignupModel signupModelFromJson(String str) =>
    SignupModel.fromJson(json.decode(str));

String signupModelToJson(SignupModel data) => json.encode(data.toJson());

class SignupModel {
  SignupModel({
    this.success,
    this.user,
    this.errors,
  });

  bool? success;
  User? user;
  Errors? errors;

  factory SignupModel.fromJson(Map<String, dynamic> json) => SignupModel(
        success: json["success"] == null ? null : json["success"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
        errors: json["errors"] == null ? null : Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "user": user == null ? null : user?.toJson(),
        "errors": errors == null ? null : errors?.toJson(),
      };
}

class User {
  User({
    this.username,
    this.countriesId,
    this.name,
    this.email,
    this.avatar,
    this.cover,
    this.status,
    this.role,
    this.permission,
    this.confirmationCode,
    this.oauthUid,
    this.oauthProvider,
    this.token,
    this.story,
    this.verifiedId,
    this.ip,
    this.language,
    this.date,
    this.id,
  });

  String? username;
  String? countriesId;
  String? name;
  String? email;
  String? avatar;
  String? cover;
  String? status;
  String? role;
  String? permission;
  String? confirmationCode;
  String? oauthUid;
  String? oauthProvider;
  String? token;
  String? story;
  String? verifiedId;
  String? ip;
  String? language;
  DateTime? date;
  int? id;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"] == null ? null : json["username"],
        countriesId: json["countries_id"] == null ? null : json["countries_id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        cover: json["cover"] == null ? null : json["cover"],
        status: json["status"] == null ? null : json["status"],
        role: json["role"] == null ? null : json["role"],
        permission: json["permission"] == null ? null : json["permission"],
        confirmationCode: json["confirmation_code"] == null
            ? null
            : json["confirmation_code"],
        oauthUid: json["oauth_uid"] == null ? null : json["oauth_uid"],
        oauthProvider:
            json["oauth_provider"] == null ? null : json["oauth_provider"],
        token: json["token"] == null ? null : json["token"],
        story: json["story"] == null ? null : json["story"],
        verifiedId: json["verified_id"] == null ? null : json["verified_id"],
        ip: json["ip"] == null ? null : json["ip"],
        language: json["language"] == null ? null : json["language"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "username": username == null ? null : username,
        "countries_id": countriesId == null ? null : countriesId,
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "avatar": avatar == null ? null : avatar,
        "cover": cover == null ? null : cover,
        "status": status == null ? null : status,
        "role": role == null ? null : role,
        "permission": permission == null ? null : permission,
        "confirmation_code": confirmationCode == null ? null : confirmationCode,
        "oauth_uid": oauthUid == null ? null : oauthUid,
        "oauth_provider": oauthProvider == null ? null : oauthProvider,
        "token": token == null ? null : token,
        "story": story == null ? null : story,
        "verified_id": verifiedId == null ? null : verifiedId,
        "ip": ip == null ? null : ip,
        "language": language == null ? null : language,
        "date": date == null ? null : date?.toIso8601String(),
        "id": id == null ? null : id,
      };
}

class Errors {
  Errors({
    this.email,
  });

  List<String>? email;

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        email: json["email"] == null
            ? null
            : List<String>.from(json["email"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "email": email == null
            ? null
            : List<dynamic>.from(email?.map((x) => x) ?? []),
      };
}
