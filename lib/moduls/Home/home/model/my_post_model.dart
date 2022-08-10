// To parse this JSON data, do
//
//     final myPostModel = myPostModelFromJson(jsonString);

import 'dart:convert';

MyPostModel myPostModelFromJson(String str) => MyPostModel.fromJson(json.decode(str));

String myPostModelToJson(MyPostModel data) => json.encode(data.toJson());

class MyPostModel {
  MyPostModel({
    this.posts,
  });

  List<Post>? posts;

  factory MyPostModel.fromJson(Map<String, dynamic> json) => MyPostModel(
    posts: json["posts"] == null ? null : List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "posts": posts == null ? null : List<dynamic>.from(posts?.map((x) => x.toJson())??[]),
  };
}

class Post {
  Post({
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

  factory Post.fromJson(Map<String, dynamic> json) => Post(
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
  };
}
