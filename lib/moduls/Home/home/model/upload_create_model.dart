///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class UploadCreateModelDataPost {
/*
{
  "id": 142,
  "image": "",
  "video": "",
  "description": "asdada",
  "user_id": 1,
  "date": "2022-09-01 08:40:55",
  "token_id": "RvDaE0lblwii4PUF7iGgXQpi9mwR6FbnksRFIZX4BeTjLVBYmlbjHSyGD90gyHxQ10GYji2chvmjzCWfxzgqqT78OEQmKrLlJJ6qE2GVbd4eYy4PJ4WNvhaLrtXIoXpMMD58PrTpKYxugZHmeqWeV6",
  "locked": "yes",
  "music": "",
  "file": "",
  "img_type": "",
  "fixed_post": "0",
  "price": "1000.00",
  "video_embed": "",
  "file_name": "",
  "file_size": "",
  "status": "active",
  "comment_count": 0,
  "like_count": 0,
  "is_liked": false,
  "is_bookmarked": false
}
*/

  int? id;
  String? image;
  String? video;
  String? description;
  int? userId;
  String? date;
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

  UploadCreateModelDataPost({
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
  });
  UploadCreateModelDataPost.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    image = json['image']?.toString();
    video = json['video']?.toString();
    description = json['description']?.toString();
    userId = json['user_id']?.toInt();
    date = json['date']?.toString();
    tokenId = json['token_id']?.toString();
    locked = json['locked']?.toString();
    music = json['music']?.toString();
    file = json['file']?.toString();
    imgType = json['img_type']?.toString();
    fixedPost = json['fixed_post']?.toString();
    price = json['price']?.toString();
    videoEmbed = json['video_embed']?.toString();
    fileName = json['file_name']?.toString();
    fileSize = json['file_size']?.toString();
    status = json['status']?.toString();
    commentCount = json['comment_count']?.toInt();
    likeCount = json['like_count']?.toInt();
    isLiked = json['is_liked'];
    isBookmarked = json['is_bookmarked'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['video'] = video;
    data['description'] = description;
    data['user_id'] = userId;
    data['date'] = date;
    data['token_id'] = tokenId;
    data['locked'] = locked;
    data['music'] = music;
    data['file'] = file;
    data['img_type'] = imgType;
    data['fixed_post'] = fixedPost;
    data['price'] = price;
    data['video_embed'] = videoEmbed;
    data['file_name'] = fileName;
    data['file_size'] = fileSize;
    data['status'] = status;
    data['comment_count'] = commentCount;
    data['like_count'] = likeCount;
    data['is_liked'] = isLiked;
    data['is_bookmarked'] = isBookmarked;
    return data;
  }
}

class UploadCreateModelData {
/*
{
  "pending": false,
  "post_id": 142,
  "post": [
    {
      "id": 142,
      "image": "",
      "video": "",
      "description": "asdada",
      "user_id": 1,
      "date": "2022-09-01 08:40:55",
      "token_id": "RvDaE0lblwii4PUF7iGgXQpi9mwR6FbnksRFIZX4BeTjLVBYmlbjHSyGD90gyHxQ10GYji2chvmjzCWfxzgqqT78OEQmKrLlJJ6qE2GVbd4eYy4PJ4WNvhaLrtXIoXpMMD58PrTpKYxugZHmeqWeV6",
      "locked": "yes",
      "music": "",
      "file": "",
      "img_type": "",
      "fixed_post": "0",
      "price": "1000.00",
      "video_embed": "",
      "file_name": "",
      "file_size": "",
      "status": "active",
      "comment_count": 0,
      "like_count": 0,
      "is_liked": false,
      "is_bookmarked": false
    }
  ]
}
*/

  bool? pending;
  int? postId;
  List<UploadCreateModelDataPost?>? post;

  UploadCreateModelData({
    this.pending,
    this.postId,
    this.post,
  });
  UploadCreateModelData.fromJson(Map<String, dynamic> json) {
    pending = json['pending'];
    postId = json['post_id']?.toInt();
    if (json['post'] != null) {
      final v = json['post'];
      final arr0 = <UploadCreateModelDataPost>[];
      v.forEach((v) {
        arr0.add(UploadCreateModelDataPost.fromJson(v));
      });
      post = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['pending'] = pending;
    data['post_id'] = postId;
    if (post != null) {
      final v = post;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['post'] = arr0;
    }
    return data;
  }
}

class UploadCreateModel {
/*
{
  "data": {
    "pending": false,
    "post_id": 142,
    "post": [
      {
        "id": 142,
        "image": "",
        "video": "",
        "description": "asdada",
        "user_id": 1,
        "date": "2022-09-01 08:40:55",
        "token_id": "RvDaE0lblwii4PUF7iGgXQpi9mwR6FbnksRFIZX4BeTjLVBYmlbjHSyGD90gyHxQ10GYji2chvmjzCWfxzgqqT78OEQmKrLlJJ6qE2GVbd4eYy4PJ4WNvhaLrtXIoXpMMD58PrTpKYxugZHmeqWeV6",
        "locked": "yes",
        "music": "",
        "file": "",
        "img_type": "",
        "fixed_post": "0",
        "price": "1000.00",
        "video_embed": "",
        "file_name": "",
        "file_size": "",
        "status": "active",
        "comment_count": 0,
        "like_count": 0,
        "is_liked": false,
        "is_bookmarked": false
      }
    ]
  },
  "message": "Action successful.",
  "success": true,
  "status_code": 200
}
*/

  UploadCreateModelData? data;
  String? message;
  bool? success;
  int? statusCode;

  UploadCreateModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });
  UploadCreateModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? UploadCreateModelData.fromJson(json['data']) : null;
    message = json['message']?.toString();
    success = json['success'];
    statusCode = json['status_code']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['success'] = success;
    data['status_code'] = statusCode;
    return data;
  }
}