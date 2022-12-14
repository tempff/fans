// To parse this JSON data, do
//
//     final bookmarkModel = bookmarkModelFromJson(jsonString);

import 'dart:convert';

BookmarkModel bookmarkModelFromJson(String str) => BookmarkModel.fromJson(json.decode(str));

String bookmarkModelToJson(BookmarkModel data) => json.encode(data.toJson());

class BookmarkModel {
  BookmarkModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory BookmarkModel.fromJson(Map<String, dynamic> json) => BookmarkModel(
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
    this.updates,
    this.counterPosts,
    this.total,
  });

  List<Update>? updates;
  int? counterPosts;
  dynamic total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        updates: json["updates"] == null ? null : List<Update>.from(json["updates"].map((x) => Update.fromJson(x))),
        counterPosts: json["counterPosts"] == null ? null : json["counterPosts"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "updates": updates == null ? null : List<dynamic>.from(updates?.map((x) => x.toJson()) ?? []),
        "counterPosts": counterPosts == null ? null : counterPosts,
        "total": total,
      };
}

class Update {
  Update({
    this.id,
    this.image,
    this.video,
    this.description,
    this.userId,
    this.date,
    this.tokenId,
    this.locked,
    this.music,
    this.file,
    this.imgType,
    this.fixedPost,
    this.price,
    this.videoEmbed,
    this.fileName,
    this.fileSize,
    this.status,
    this.commentCount,
    this.likeCount,
    this.isLiked,
    this.isBookmarked,
    this.pivot,
  });

  int? id;
  String? image;
  String? video;
  String? description;
  int? userId;
  DateTime? date;
  String? tokenId;
  String? locked;
  String? music;
  String? file;
  String? imgType;
  String? fixedPost;
  String? price;
  String? videoEmbed;
  String? fileName;
  String? fileSize;
  String? status;
  int? commentCount;
  int? likeCount;
  bool? isLiked;
  bool? isBookmarked;
  Pivot? pivot;

  factory Update.fromJson(Map<String, dynamic> json) => Update(
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : json["image"],
        video: json["video"] == null ? null : json["video"],
        description: json["description"] == null ? null : json["description"],
        userId: json["user_id"] == null ? null : json["user_id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        tokenId: json["token_id"] == null ? null : json["token_id"],
        locked: json["locked"] == null ? null : json["locked"],
        music: json["music"] == null ? null : json["music"],
        file: json["file"] == null ? null : json["file"],
        imgType: json["img_type"] == null ? null : json["img_type"],
        fixedPost: json["fixed_post"] == null ? null : json["fixed_post"],
        price: json["price"] == null ? null : json["price"],
        videoEmbed: json["video_embed"] == null ? null : json["video_embed"],
        fileName: json["file_name"] == null ? null : json["file_name"],
        fileSize: json["file_size"] == null ? null : json["file_size"],
        status: json["status"] == null ? null : json["status"],
        commentCount: json["comment_count"] == null ? null : json["comment_count"],
        likeCount: json["like_count"] == null ? null : json["like_count"],
        isLiked: json["is_liked"] == null ? null : json["is_liked"],
        isBookmarked: json["is_bookmarked"] == null ? null : json["is_bookmarked"],
        pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "image": image == null ? null : image,
        "video": video == null ? null : video,
        "description": description == null ? null : description,
        "user_id": userId == null ? null : userId,
        "date": date == null ? null : date?.toIso8601String(),
        "token_id": tokenId == null ? null : tokenId,
        "locked": locked == null ? null : locked,
        "music": music == null ? null : music,
        "file": file == null ? null : file,
        "img_type": imgType == null ? null : imgType,
        "fixed_post": fixedPost == null ? null : fixedPost,
        "price": price == null ? null : price,
        "video_embed": videoEmbed == null ? null : videoEmbed,
        "file_name": fileName == null ? null : fileName,
        "file_size": fileSize == null ? null : fileSize,
        "status": status == null ? null : status,
        "comment_count": commentCount == null ? null : commentCount,
        "like_count": likeCount == null ? null : likeCount,
        "is_liked": isLiked == null ? null : isLiked,
        "is_bookmarked": isBookmarked == null ? null : isBookmarked,
        "pivot": pivot == null ? null : pivot?.toJson(),
      };
}

class Pivot {
  Pivot({
    this.userId,
    this.updatesId,
  });

  int? userId;
  int? updatesId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        userId: json["user_id"] == null ? null : json["user_id"],
        updatesId: json["updates_id"] == null ? null : json["updates_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "updates_id": updatesId == null ? null : updatesId,
      };
}
