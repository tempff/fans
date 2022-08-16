// To parse this JSON data, do
//
//     final postCommentModel = postCommentModelFromJson(jsonString);

import 'dart:convert';

PostCommentModel postCommentModelFromJson(String str) => PostCommentModel.fromJson(json.decode(str));

String postCommentModelToJson(PostCommentModel data) => json.encode(data.toJson());

class PostCommentModel {
  PostCommentModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory PostCommentModel.fromJson(Map<String, dynamic> json) => PostCommentModel(
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
    this.comment,
    this.totalComments,
    this.nameUser,
  });

  Comment? comment;
  String? totalComments;
  String? nameUser;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    comment: json["comment"] == null ? null : Comment.fromJson(json["comment"]),
    totalComments: json["totalComments"] == null ? null : json["totalComments"],
    nameUser: json["nameUser"] == null ? null : json["nameUser"],
  );

  Map<String, dynamic> toJson() => {
    "comment": comment == null ? null : comment?.toJson(),
    "totalComments": totalComments == null ? null : totalComments,
    "nameUser": nameUser == null ? null : nameUser,
  };
}

class Comment {
  Comment({
    this.reply,
    this.updatesId,
    this.userId,
    this.date,
    this.id,
    this.likeCount,
  });

  String? reply;
  String? updatesId;
  int? userId;
  DateTime? date;
  int? id;
  int? likeCount;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    reply: json["reply"] == null ? null : json["reply"],
    updatesId: json["updates_id"] == null ? null : json["updates_id"],
    userId: json["user_id"] == null ? null : json["user_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    id: json["id"] == null ? null : json["id"],
    likeCount: json["like_count"] == null ? null : json["like_count"],
  );

  Map<String, dynamic> toJson() => {
    "reply": reply == null ? null : reply,
    "updates_id": updatesId == null ? null : updatesId,
    "user_id": userId == null ? null : userId,
    "date": date == null ? null : date?.toIso8601String(),
    "id": id == null ? null : id,
    "like_count": likeCount == null ? null : likeCount,
  };
}
