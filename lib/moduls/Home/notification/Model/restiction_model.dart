// To parse this JSON data, do
//
//     final restrictionsModel = restrictionsModelFromJson(jsonString);

import 'dart:convert';

RestrictionsModel restrictionsModelFromJson(String str) => RestrictionsModel.fromJson(json.decode(str));

String restrictionsModelToJson(RestrictionsModel data) => json.encode(data.toJson());

class RestrictionsModel {
  RestrictionsModel({
    this.restrictions,
  });

  List<dynamic>? restrictions;

  factory RestrictionsModel.fromJson(Map<String, dynamic> json) => RestrictionsModel(
    restrictions: json["restrictions"] == null ? null : List<dynamic>.from(json["restrictions"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "restrictions": restrictions == null ? null : List<dynamic>.from(restrictions?.map((x) => x)??[]),
  };
}
