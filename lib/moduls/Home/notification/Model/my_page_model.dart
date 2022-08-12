// To parse this JSON data, do
//
//     final myPageModel = myPageModelFromJson(jsonString);

import 'dart:convert';

MyPageModel myPageModelFromJson(String str) =>
    MyPageModel.fromJson(json.decode(str));

String myPageModelToJson(MyPageModel data) => json.encode(data.toJson());

class MyPageModel {
  MyPageModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory MyPageModel.fromJson(Map<String, dynamic> json) => MyPageModel(
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
    this.categoryMaster,
    this.countryMaster,
    this.languageMaster,
    this.genderMaster,
    this.user,
  });

  List<CategoryMaster>? categoryMaster;
  List<CountryMaster>? countryMaster;
  List<LanguageMaster>? languageMaster;
  List<GenderMaster>? genderMaster;
  User? user;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        categoryMaster: json["category_master"] == null
            ? null
            : List<CategoryMaster>.from(
                json["category_master"].map((x) => CategoryMaster.fromJson(x))),
        countryMaster: json["country_master"] == null
            ? null
            : List<CountryMaster>.from(
                json["country_master"].map((x) => CountryMaster.fromJson(x))),
        languageMaster: json["language_master"] == null
            ? null
            : List<LanguageMaster>.from(
                json["language_master"].map((x) => LanguageMaster.fromJson(x))),
        genderMaster: json["gender_master"] == null
            ? null
            : List<GenderMaster>.from(
                json["gender_master"].map((x) => GenderMaster.fromJson(x))),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "category_master": categoryMaster == null
            ? null
            : List<dynamic>.from(categoryMaster?.map((x) => x.toJson()) ?? []),
        "country_master": countryMaster == null
            ? null
            : List<dynamic>.from(countryMaster?.map((x) => x.toJson()) ?? []),
        "language_master": languageMaster == null
            ? null
            : List<dynamic>.from(languageMaster?.map((x) => x.toJson()) ?? []),
        "gender_master": genderMaster == null
            ? null
            : List<dynamic>.from(genderMaster?.map((x) => x.toJson()) ?? []),
        "user": user == null ? null : user?.toJson(),
      };
}

class CategoryMaster {
  CategoryMaster({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.keywords,
    this.mode,
    this.image,
  });

  int? id;
  String? name;
  String? slug;
  Description? description;
  Keywords? keywords;
  Mode? mode;
  String? image;

  factory CategoryMaster.fromJson(Map<String, dynamic> json) => CategoryMaster(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        description: json["description"] == null
            ? null
            : descriptionValues.map?[json["description"]],
        keywords: json["keywords"] == null
            ? null
            : keywordsValues.map?[json["keywords"]],
        mode: json["mode"] == null ? null : modeValues.map?[json["mode"]],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "description": description == null
            ? null
            : descriptionValues.reverse?[description],
        "keywords": keywords == null ? null : keywordsValues.reverse?[keywords],
        "mode": mode == null ? null : modeValues.reverse?[mode],
        "image": image == null ? null : image,
      };
}

enum Description { EMPTY, CATEGORY_ANIMATION }

final descriptionValues = EnumValues({
  "Category Animation": Description.CATEGORY_ANIMATION,
  "": Description.EMPTY
});

enum Keywords { EMPTY, ANIMATE_ANIMATION }

final keywordsValues = EnumValues(
    {"animate, animation": Keywords.ANIMATE_ANIMATION, "": Keywords.EMPTY});

enum Mode { ON }

final modeValues = EnumValues({"on": Mode.ON});

class CountryMaster {
  CountryMaster({
    this.id,
    this.countryCode,
    this.countryName,
  });

  int? id;
  String? countryCode;
  String? countryName;

  factory CountryMaster.fromJson(Map<String, dynamic> json) => CountryMaster(
        id: json["id"] == null ? null : json["id"],
        countryCode: json["country_code"] == null ? null : json["country_code"],
        countryName: json["country_name"] == null ? null : json["country_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "country_code": countryCode == null ? null : countryCode,
        "country_name": countryName == null ? null : countryName,
      };
}

class GenderMaster {
  GenderMaster({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory GenderMaster.fromJson(Map<String, dynamic> json) => GenderMaster(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

class LanguageMaster {
  LanguageMaster({
    this.id,
    this.name,
    this.abbreviation,
  });

  int? id;
  String? name;
  String? abbreviation;

  factory LanguageMaster.fromJson(Map<String, dynamic> json) => LanguageMaster(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        abbreviation:
            json["abbreviation"] == null ? null : json["abbreviation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "abbreviation": abbreviation == null ? null : abbreviation,
      };
}

class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.profession,
    this.language,
    this.birthdate,
    this.gender,
    this.avatar,
    this.cover,
    this.categoriesId,
    this.website,
    this.company,
    this.countriesId,
    this.city,
    this.address,
    this.zip,
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube,
    this.pinterest,
    this.github,
    this.tiktok,
    this.snapchat,
    this.telegram,
    this.vk,
    this.twitch,
    this.discord,
    this.story,
  });

  int? id;
  String? name;
  String? username;
  String? email;
  String? profession;
  String? language;
  String? birthdate;
  String? gender;
  String? avatar;
  String? cover;
  String? categoriesId;
  String? website;
  String? company;
  String? countriesId;
  String? city;
  String? address;
  String? zip;
  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;
  String? pinterest;
  String? github;
  String? tiktok;
  String? snapchat;
  String? telegram;
  String? vk;
  String? twitch;
  String? discord;
  String? story;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        profession: json["profession"] == null ? null : json["profession"],
        language: json["language"] == null ? null : json["language"],
        birthdate: json["birthdate"] == null ? null : json["birthdate"],
        gender: json["gender"] == null ? null : json["gender"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        cover: json["cover"] == null ? null : json["cover"],
        categoriesId:
            json["categories_id"] == null ? null : json["categories_id"],
        website: json["website"] == null ? null : json["website"],
        company: json["company"] == null ? null : json["company"],
        countriesId: json["countries_id"] == null ? null : json["countries_id"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        zip: json["zip"] == null ? null : json["zip"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        pinterest: json["pinterest"] == null ? null : json["pinterest"],
        github: json["github"] == null ? null : json["github"],
        tiktok: json["tiktok"] == null ? null : json["tiktok"],
        snapchat: json["snapchat"] == null ? null : json["snapchat"],
        telegram: json["telegram"] == null ? null : json["telegram"],
        vk: json["vk"] == null ? null : json["vk"],
        twitch: json["twitch"] == null ? null : json["twitch"],
        discord: json["discord"] == null ? null : json["discord"],
        story: json["story"] == null ? null : json["story"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "profession": profession == null ? null : profession,
        "language": language == null ? null : language,
        "birthdate": birthdate == null ? null : birthdate,
        "gender": gender == null ? null : gender,
        "avatar": avatar == null ? null : avatar,
        "cover": cover == null ? null : cover,
        "categories_id": categoriesId == null ? null : categoriesId,
        "website": website == null ? null : website,
        "company": company == null ? null : company,
        "countries_id": countriesId == null ? null : countriesId,
        "city": city == null ? null : city,
        "address": address == null ? null : address,
        "zip": zip == null ? null : zip,
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter == null ? null : twitter,
        "instagram": instagram == null ? null : instagram,
        "youtube": youtube == null ? null : youtube,
        "pinterest": pinterest == null ? null : pinterest,
        "github": github == null ? null : github,
        "tiktok": tiktok == null ? null : tiktok,
        "snapchat": snapchat == null ? null : snapchat,
        "telegram": telegram == null ? null : telegram,
        "vk": vk == null ? null : vk,
        "twitch": twitch == null ? null : twitch,
        "discord": discord == null ? null : discord,
        "story": story == null ? null : story,
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
