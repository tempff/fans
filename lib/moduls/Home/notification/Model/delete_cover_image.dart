import 'dart:convert';

DeleteCoverImageModel deleteCoverImageModelFromJson(String str) => DeleteCoverImageModel.fromJson(json.decode(str));

String deleteCoverImageModelToJson(DeleteCoverImageModel data) => json.encode(data.toJson());

class DeleteCoverImageModel {
  DeleteCoverImageModel({
    this.success,
  });

  bool? success;

  factory DeleteCoverImageModel.fromJson(Map<String, dynamic> json) => DeleteCoverImageModel(
    success: json["success"] == null ? null : json["success"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
  };
}
