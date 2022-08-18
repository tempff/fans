// To parse this JSON data, do
//
//     final uploadMedia = uploadMediaFromJson(jsonString);

import 'dart:convert';

UploadMedia uploadMediaFromJson(String str) => UploadMedia.fromJson(json.decode(str));

String uploadMediaToJson(UploadMedia data) => json.encode(data.toJson());

class UploadMedia {
  UploadMedia({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory UploadMedia.fromJson(Map<String, dynamic> json) => UploadMedia(
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
    this.hasWarnings,
    this.isSuccess,
    this.warnings,
    this.files,
  });

  bool? hasWarnings;
  bool? isSuccess;
  List<dynamic> ?warnings;
  List<FileElement> ?files;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    hasWarnings: json["hasWarnings"] == null ? null : json["hasWarnings"],
    isSuccess: json["isSuccess"] == null ? null : json["isSuccess"],
    warnings: json["warnings"] == null ? null : List<dynamic>.from(json["warnings"].map((x) => x)),
    files: json["files"] == null ? null : List<FileElement>.from(json["files"].map((x) => FileElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hasWarnings": hasWarnings == null ? null : hasWarnings,
    "isSuccess": isSuccess == null ? null : isSuccess,
    "warnings": warnings == null ? null : List<dynamic>.from(warnings?.map((x) => x)??[]),
    "files": files == null ? null : List<dynamic>.from(files?.map((x) => x.toJson())??[]),
  };
}

class FileElement {
  FileElement({
    this.extension,
    this.format,
    this.name,
    this.size,
    this.size2,
    this.type,
    this.uploaded,
    this.replaced,
  });

  String? extension;
  String? format;
  String? name;
  int? size;
  String? size2;
  String? type;
  bool? uploaded;
  bool? replaced;

  factory FileElement.fromJson(Map<String, dynamic> json) => FileElement(
    extension: json["extension"] == null ? null : json["extension"],
    format: json["format"] == null ? null : json["format"],
    name: json["name"] == null ? null : json["name"],
    size: json["size"] == null ? null : json["size"],
    size2: json["size2"] == null ? null : json["size2"],
    type: json["type"] == null ? null : json["type"],
    uploaded: json["uploaded"] == null ? null : json["uploaded"],
    replaced: json["replaced"] == null ? null : json["replaced"],
  );

  Map<String, dynamic> toJson() => {
    "extension": extension == null ? null : extension,
    "format": format == null ? null : format,
    "name": name == null ? null : name,
    "size": size == null ? null : size,
    "size2": size2 == null ? null : size2,
    "type": type == null ? null : type,
    "uploaded": uploaded == null ? null : uploaded,
    "replaced": replaced == null ? null : replaced,
  };
}
