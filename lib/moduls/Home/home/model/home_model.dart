// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  HomePageModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });

  Data? data;
  String? message;
  bool? success;
  int? statusCode;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
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
    this.users,
    this.updates,
  });

  Users? users;
  Updates? updates;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        users: json["users"] == null ? null : Users.fromJson(json["users"]),
        updates:
            json["updates"] == null ? null : Updates.fromJson(json["updates"]),
      );

  Map<String, dynamic> toJson() => {
        "users": users == null ? null : users?.toJson(),
        "updates": updates == null ? null : updates?.toJson(),
      };
}

class Updates {
  Updates({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<UpdatesDatum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Updates.fromJson(Map<String, dynamic> json) => Updates(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<UpdatesDatum>.from(
                json["data"].map((x) => UpdatesDatum.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl:
            json["next_page_url"] == null ? null : json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "links": links == null
            ? null
            : List<dynamic>.from(links?.map((x) => x.toJson()) ?? []),
        "next_page_url": nextPageUrl == null ? null : nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}

class UpdatesDatum {
  UpdatesDatum({
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
    this.user,
    this.media,
    this.latestComment,
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
  UserElement? user;
  List<Media>? media;
  dynamic latestComment;

  factory UpdatesDatum.fromJson(Map<String, dynamic> json) => UpdatesDatum(
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
        commentCount:
            json["comment_count"] == null ? null : json["comment_count"],
        likeCount: json["like_count"] == null ? null : json["like_count"],
        isLiked: json["is_liked"] == null ? null : json["is_liked"],
        isBookmarked:
            json["is_bookmarked"] == null ? null : json["is_bookmarked"],
        user: json["user"] == null ? null : UserElement.fromJson(json["user"]),
        media: json["media"] == null
            ? null
            : List<Media>.from(json["media"].map((x) => Media.fromJson(x))),
        latestComment: json["latest_comment"],
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
        "user": user == null ? null : user?.toJson(),
        "media": media == null
            ? null
            : List<dynamic>.from(media?.map((x) => x.toJson()) ?? []),
        "latest_comment": latestComment,
      };
}

class Media {
  Media({
    this.id,
    this.updatesId,
    this.userId,
    this.type,
    this.image,
    this.width,
    this.height,
    this.imgType,
    this.video,
    this.encoded,
    this.videoPoster,
    this.videoEmbed,
    this.music,
    this.file,
    this.fileName,
    this.fileSize,
    this.token,
    this.status,
    this.chapters,
    this.createdAt,
    this.updatedAt,
    this.mediaUrl,
    this.videoPosterUrl,
  });

  int? id;
  int? updatesId;
  int? userId;
  String? type;
  String? image;
  dynamic width;
  dynamic height;
  String? imgType;
  String? video;
  String? encoded;
  dynamic videoPoster;
  String? videoEmbed;
  String? music;
  String? file;
  String? fileName;
  String? fileSize;
  String? token;
  String? status;
  List<Chapter>? chapters;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? mediaUrl;
  String? videoPosterUrl;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        id: json["id"] == null ? null : json["id"],
        updatesId: json["updates_id"] == null ? null : json["updates_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        type: json["type"] == null ? null : json["type"],
        image: json["image"] == null ? null : json["image"],
        width: json["width"],
        height: json["height"],
        imgType: json["img_type"] == null ? null : json["img_type"],
        video: json["video"] == null ? null : json["video"],
        encoded: json["encoded"] == null ? null : json["encoded"],
        videoPoster: json["video_poster"],
        videoEmbed: json["video_embed"] == null ? null : json["video_embed"],
        music: json["music"] == null ? null : json["music"],
        file: json["file"] == null ? null : json["file"],
        fileName: json["file_name"] == null ? null : json["file_name"],
        fileSize: json["file_size"] == null ? null : json["file_size"],
        token: json["token"] == null ? null : json["token"],
        status: json["status"] == null ? null : json["status"],
        chapters: json["chapters"] == null
            ? null
            : List<Chapter>.from(
                json["chapters"].map((x) => Chapter.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        mediaUrl: json["media_url"] == null ? null : json["media_url"],
        videoPosterUrl:
            json["video_poster_url"] == null ? null : json["video_poster_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "updates_id": updatesId == null ? null : updatesId,
        "user_id": userId == null ? null : userId,
        "type": type == null ? null : type,
        "image": image == null ? null : image,
        "width": width,
        "height": height,
        "img_type": imgType == null ? null : imgType,
        "video": video == null ? null : video,
        "encoded": encoded == null ? null : encoded,
        "video_poster": videoPoster,
        "video_embed": videoEmbed == null ? null : videoEmbed,
        "music": music == null ? null : music,
        "file": file == null ? null : file,
        "file_name": fileName == null ? null : fileName,
        "file_size": fileSize == null ? null : fileSize,
        "token": token == null ? null : token,
        "status": status == null ? null : status,
        "chapters": chapters == null
            ? null
            : List<dynamic>.from(chapters?.map((x) => x.toJson()) ?? []),
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "media_url": mediaUrl == null ? null : mediaUrl,
        "video_poster_url": videoPosterUrl == null ? null : videoPosterUrl,
      };
}

class Chapter {
  Chapter({
    this.end,
    this.start,
    this.title,
  });

  String? end;
  String? start;
  String? title;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        end: json["end"] == null ? null : json["end"],
        start: json["start"] == null ? null : json["start"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toJson() => {
        "end": end == null ? null : end,
        "start": start == null ? null : start,
        "title": title == null ? null : title,
      };
}

class UserElement {
  UserElement({
    this.id,
    this.name,
    this.username,
    this.countriesId,
    this.email,
    this.date,
    this.avatar,
    this.cover,
    this.status,
    this.role,
    this.permission,
    this.confirmationCode,
    this.paypalAccount,
    this.paymentGateway,
    this.bank,
    this.featured,
    this.featuredDate,
    this.about,
    this.story,
    this.profession,
    this.oauthUid,
    this.oauthProvider,
    this.categoriesId,
    this.website,
    this.stripeId,
    this.pmType,
    this.pmLastFour,
    this.trialEndsAt,
    this.price,
    this.balance,
    this.verifiedId,
    this.address,
    this.city,
    this.zip,
    this.facebook,
    this.twitter,
    this.instagram,
    this.youtube,
    this.pinterest,
    this.github,
    this.lastSeen,
    this.emailNewSubscriber,
    this.plan,
    this.notifyNewSubscriber,
    this.notifyLikedPost,
    this.notifyCommentedPost,
    this.company,
    this.postLocked,
    this.ip,
    this.darkMode,
    this.gender,
    this.birthdate,
    this.allowDownloadFiles,
    this.language,
    this.freeSubscription,
    this.wallet,
    this.tiktok,
    this.snapchat,
    this.paystackPlan,
    this.paystackAuthorizationCode,
    this.paystackLast4,
    this.paystackExp,
    this.paystackCardBrand,
    this.notifyNewTip,
    this.hideProfile,
    this.hideLastSeen,
    this.lastLogin,
    this.hideCountSubscribers,
    this.hideMyCountry,
    this.showMyBirthdate,
    this.notifyNewPost,
    this.notifyEmailNewPost,
    this.customFee,
    this.hideName,
    this.birthdateChanged,
    this.emailNewTip,
    this.emailNewPpv,
    this.notifyNewPpv,
    this.activeStatusOnline,
    this.payoneerAccount,
    this.zelleAccount,
    this.notifyLikedComment,
    this.permissions,
    this.blockedCountries,
    this.twoFactorAuth,
    this.notifyLiveStreaming,
    this.notifyMentions,
    this.stripeConnectId,
    this.completedStripeOnboarding,
    this.deviceToken,
    this.telegram,
    this.vk,
    this.twitch,
    this.discord,
    this.apiToken,
  });

  int? id;
  String? name;
  String? username;
  String? countriesId;
  String? email;
  DateTime? date;
  String? avatar;
  String? cover;
  String? status;
  String? role;
  String? permission;
  String? confirmationCode;
  String? paypalAccount;
  String? paymentGateway;
  String? bank;
  String? featured;
  DateTime? featuredDate;
  String? about;
  String? story;
  String? profession;
  String? oauthUid;
  String? oauthProvider;
  String? categoriesId;
  String? website;
  dynamic stripeId;
  dynamic pmType;
  dynamic pmLastFour;
  dynamic trialEndsAt;
  String? price;
  String? balance;
  String? verifiedId;
  String? address;
  String? city;
  String? zip;
  String? facebook;
  String? twitter;
  String? instagram;
  String? youtube;
  String? pinterest;
  String? github;
  DateTime? lastSeen;
  String? emailNewSubscriber;
  String? plan;
  String? notifyNewSubscriber;
  String? notifyLikedPost;
  String? notifyCommentedPost;
  String? company;
  String? postLocked;
  String? ip;
  String? darkMode;
  String? gender;
  String? birthdate;
  String? allowDownloadFiles;
  String? language;
  String? freeSubscription;
  String? wallet;
  String? tiktok;
  String? snapchat;
  String? paystackPlan;
  String? paystackAuthorizationCode;
  int? paystackLast4;
  String? paystackExp;
  String? paystackCardBrand;
  String? notifyNewTip;
  String? hideProfile;
  String? hideLastSeen;
  String? lastLogin;
  String? hideCountSubscribers;
  String? hideMyCountry;
  String? showMyBirthdate;
  String? notifyNewPost;
  String? notifyEmailNewPost;
  int? customFee;
  String? hideName;
  String? birthdateChanged;
  String? emailNewTip;
  String? emailNewPpv;
  String? notifyNewPpv;
  String? activeStatusOnline;
  String? payoneerAccount;
  String? zelleAccount;
  String? notifyLikedComment;
  String? permissions;
  String? blockedCountries;
  String? twoFactorAuth;
  String? notifyLiveStreaming;
  String? notifyMentions;
  dynamic stripeConnectId;
  int? completedStripeOnboarding;
  dynamic deviceToken;
  String? telegram;
  String? vk;
  String? twitch;
  String? discord;
  String? apiToken;

  factory UserElement.fromJson(Map<String, dynamic> json) => UserElement(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        username: json["username"] == null ? null : json["username"],
        countriesId: json["countries_id"] == null ? null : json["countries_id"],
        email: json["email"] == null ? null : json["email"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        avatar: json["avatar"] == null ? null : json["avatar"],
        cover: json["cover"] == null ? null : json["cover"],
        status: json["status"] == null ? null : json["status"],
        role: json["role"] == null ? null : json["role"],
        permission: json["permission"] == null ? null : json["permission"],
        confirmationCode: json["confirmation_code"] == null
            ? null
            : json["confirmation_code"],
        paypalAccount:
            json["paypal_account"] == null ? null : json["paypal_account"],
        paymentGateway:
            json["payment_gateway"] == null ? null : json["payment_gateway"],
        bank: json["bank"] == null ? null : json["bank"],
        featured: json["featured"] == null ? null : json["featured"],
        featuredDate: json["featured_date"] == null
            ? null
            : DateTime.parse(json["featured_date"]),
        about: json["about"] == null ? null : json["about"],
        story: json["story"] == null ? null : json["story"],
        profession: json["profession"] == null ? null : json["profession"],
        oauthUid: json["oauth_uid"] == null ? null : json["oauth_uid"],
        oauthProvider:
            json["oauth_provider"] == null ? null : json["oauth_provider"],
        categoriesId:
            json["categories_id"] == null ? null : json["categories_id"],
        website: json["website"] == null ? null : json["website"],
        stripeId: json["stripe_id"],
        pmType: json["pm_type"],
        pmLastFour: json["pm_last_four"],
        trialEndsAt: json["trial_ends_at"],
        price: json["price"] == null ? null : json["price"],
        balance: json["balance"] == null ? null : json["balance"],
        verifiedId: json["verified_id"] == null ? null : json["verified_id"],
        address: json["address"] == null ? null : json["address"],
        city: json["city"] == null ? null : json["city"],
        zip: json["zip"] == null ? null : json["zip"],
        facebook: json["facebook"] == null ? null : json["facebook"],
        twitter: json["twitter"] == null ? null : json["twitter"],
        instagram: json["instagram"] == null ? null : json["instagram"],
        youtube: json["youtube"] == null ? null : json["youtube"],
        pinterest: json["pinterest"] == null ? null : json["pinterest"],
        github: json["github"] == null ? null : json["github"],
        lastSeen: json["last_seen"] == null
            ? null
            : DateTime.parse(json["last_seen"]),
        emailNewSubscriber: json["email_new_subscriber"] == null
            ? null
            : json["email_new_subscriber"],
        plan: json["plan"] == null ? null : json["plan"],
        notifyNewSubscriber: json["notify_new_subscriber"] == null
            ? null
            : json["notify_new_subscriber"],
        notifyLikedPost: json["notify_liked_post"] == null
            ? null
            : json["notify_liked_post"],
        notifyCommentedPost: json["notify_commented_post"] == null
            ? null
            : json["notify_commented_post"],
        company: json["company"] == null ? null : json["company"],
        postLocked: json["post_locked"] == null ? null : json["post_locked"],
        ip: json["ip"] == null ? null : json["ip"],
        darkMode: json["dark_mode"] == null ? null : json["dark_mode"],
        gender: json["gender"] == null ? null : json["gender"],
        birthdate: json["birthdate"] == null ? null : json["birthdate"],
        allowDownloadFiles: json["allow_download_files"] == null
            ? null
            : json["allow_download_files"],
        language: json["language"] == null ? null : json["language"],
        freeSubscription: json["free_subscription"] == null
            ? null
            : json["free_subscription"],
        wallet: json["wallet"] == null ? null : json["wallet"],
        tiktok: json["tiktok"] == null ? null : json["tiktok"],
        snapchat: json["snapchat"] == null ? null : json["snapchat"],
        paystackPlan:
            json["paystack_plan"] == null ? null : json["paystack_plan"],
        paystackAuthorizationCode: json["paystack_authorization_code"] == null
            ? null
            : json["paystack_authorization_code"],
        paystackLast4:
            json["paystack_last4"] == null ? null : json["paystack_last4"],
        paystackExp: json["paystack_exp"] == null ? null : json["paystack_exp"],
        paystackCardBrand: json["paystack_card_brand"] == null
            ? null
            : json["paystack_card_brand"],
        notifyNewTip:
            json["notify_new_tip"] == null ? null : json["notify_new_tip"],
        hideProfile: json["hide_profile"] == null ? null : json["hide_profile"],
        hideLastSeen:
            json["hide_last_seen"] == null ? null : json["hide_last_seen"],
        lastLogin: json["last_login"] == null ? null : json["last_login"],
        hideCountSubscribers: json["hide_count_subscribers"] == null
            ? null
            : json["hide_count_subscribers"],
        hideMyCountry:
            json["hide_my_country"] == null ? null : json["hide_my_country"],
        showMyBirthdate: json["show_my_birthdate"] == null
            ? null
            : json["show_my_birthdate"],
        notifyNewPost:
            json["notify_new_post"] == null ? null : json["notify_new_post"],
        notifyEmailNewPost: json["notify_email_new_post"] == null
            ? null
            : json["notify_email_new_post"],
        customFee: json["custom_fee"] == null ? null : json["custom_fee"],
        hideName: json["hide_name"] == null ? null : json["hide_name"],
        birthdateChanged: json["birthdate_changed"] == null
            ? null
            : json["birthdate_changed"],
        emailNewTip:
            json["email_new_tip"] == null ? null : json["email_new_tip"],
        emailNewPpv:
            json["email_new_ppv"] == null ? null : json["email_new_ppv"],
        notifyNewPpv:
            json["notify_new_ppv"] == null ? null : json["notify_new_ppv"],
        activeStatusOnline: json["active_status_online"] == null
            ? null
            : json["active_status_online"],
        payoneerAccount:
            json["payoneer_account"] == null ? null : json["payoneer_account"],
        zelleAccount:
            json["zelle_account"] == null ? null : json["zelle_account"],
        notifyLikedComment: json["notify_liked_comment"] == null
            ? null
            : json["notify_liked_comment"],
        permissions: json["permissions"] == null ? null : json["permissions"],
        blockedCountries: json["blocked_countries"] == null
            ? null
            : json["blocked_countries"],
        twoFactorAuth:
            json["two_factor_auth"] == null ? null : json["two_factor_auth"],
        notifyLiveStreaming: json["notify_live_streaming"] == null
            ? null
            : json["notify_live_streaming"],
        notifyMentions:
            json["notify_mentions"] == null ? null : json["notify_mentions"],
        stripeConnectId: json["stripe_connect_id"],
        completedStripeOnboarding: json["completed_stripe_onboarding"] == null
            ? null
            : json["completed_stripe_onboarding"],
        deviceToken: json["device_token"],
        telegram: json["telegram"] == null ? null : json["telegram"],
        vk: json["vk"] == null ? null : json["vk"],
        twitch: json["twitch"] == null ? null : json["twitch"],
        discord: json["discord"] == null ? null : json["discord"],
        apiToken: json["api_token"] == null ? null : json["api_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "username": username == null ? null : username,
        "countries_id": countriesId == null ? null : countriesId,
        "email": email == null ? null : email,
        "date": date == null ? null : date?.toIso8601String(),
        "avatar": avatar == null ? null : avatar,
        "cover": cover == null ? null : cover,
        "status": status == null ? null : status,
        "role": role == null ? null : role,
        "permission": permission == null ? null : permission,
        "confirmation_code": confirmationCode == null ? null : confirmationCode,
        "paypal_account": paypalAccount == null ? null : paypalAccount,
        "payment_gateway": paymentGateway == null ? null : paymentGateway,
        "bank": bank == null ? null : bank,
        "featured": featured == null ? null : featured,
        "featured_date":
            featuredDate == null ? null : featuredDate?.toIso8601String(),
        "about": about == null ? null : about,
        "story": story == null ? null : story,
        "profession": profession == null ? null : profession,
        "oauth_uid": oauthUid == null ? null : oauthUid,
        "oauth_provider": oauthProvider == null ? null : oauthProvider,
        "categories_id": categoriesId == null ? null : categoriesId,
        "website": website == null ? null : website,
        "stripe_id": stripeId,
        "pm_type": pmType,
        "pm_last_four": pmLastFour,
        "trial_ends_at": trialEndsAt,
        "price": price == null ? null : price,
        "balance": balance == null ? null : balance,
        "verified_id": verifiedId == null ? null : verifiedId,
        "address": address == null ? null : address,
        "city": city == null ? null : city,
        "zip": zip == null ? null : zip,
        "facebook": facebook == null ? null : facebook,
        "twitter": twitter == null ? null : twitter,
        "instagram": instagram == null ? null : instagram,
        "youtube": youtube == null ? null : youtube,
        "pinterest": pinterest == null ? null : pinterest,
        "github": github == null ? null : github,
        "last_seen": lastSeen == null ? null : lastSeen?.toIso8601String(),
        "email_new_subscriber":
            emailNewSubscriber == null ? null : emailNewSubscriber,
        "plan": plan == null ? null : plan,
        "notify_new_subscriber":
            notifyNewSubscriber == null ? null : notifyNewSubscriber,
        "notify_liked_post": notifyLikedPost == null ? null : notifyLikedPost,
        "notify_commented_post":
            notifyCommentedPost == null ? null : notifyCommentedPost,
        "company": company == null ? null : company,
        "post_locked": postLocked == null ? null : postLocked,
        "ip": ip == null ? null : ip,
        "dark_mode": darkMode == null ? null : darkMode,
        "gender": gender == null ? null : gender,
        "birthdate": birthdate == null ? null : birthdate,
        "allow_download_files":
            allowDownloadFiles == null ? null : allowDownloadFiles,
        "language": language == null ? null : language,
        "free_subscription": freeSubscription == null ? null : freeSubscription,
        "wallet": wallet == null ? null : wallet,
        "tiktok": tiktok == null ? null : tiktok,
        "snapchat": snapchat == null ? null : snapchat,
        "paystack_plan": paystackPlan == null ? null : paystackPlan,
        "paystack_authorization_code": paystackAuthorizationCode == null
            ? null
            : paystackAuthorizationCode,
        "paystack_last4": paystackLast4 == null ? null : paystackLast4,
        "paystack_exp": paystackExp == null ? null : paystackExp,
        "paystack_card_brand":
            paystackCardBrand == null ? null : paystackCardBrand,
        "notify_new_tip": notifyNewTip == null ? null : notifyNewTip,
        "hide_profile": hideProfile == null ? null : hideProfile,
        "hide_last_seen": hideLastSeen == null ? null : hideLastSeen,
        "last_login": lastLogin == null ? null : lastLogin,
        "hide_count_subscribers":
            hideCountSubscribers == null ? null : hideCountSubscribers,
        "hide_my_country": hideMyCountry == null ? null : hideMyCountry,
        "show_my_birthdate": showMyBirthdate == null ? null : showMyBirthdate,
        "notify_new_post": notifyNewPost == null ? null : notifyNewPost,
        "notify_email_new_post":
            notifyEmailNewPost == null ? null : notifyEmailNewPost,
        "custom_fee": customFee == null ? null : customFee,
        "hide_name": hideName == null ? null : hideName,
        "birthdate_changed": birthdateChanged == null ? null : birthdateChanged,
        "email_new_tip": emailNewTip == null ? null : emailNewTip,
        "email_new_ppv": emailNewPpv == null ? null : emailNewPpv,
        "notify_new_ppv": notifyNewPpv == null ? null : notifyNewPpv,
        "active_status_online":
            activeStatusOnline == null ? null : activeStatusOnline,
        "payoneer_account": payoneerAccount == null ? null : payoneerAccount,
        "zelle_account": zelleAccount == null ? null : zelleAccount,
        "notify_liked_comment":
            notifyLikedComment == null ? null : notifyLikedComment,
        "permissions": permissions == null ? null : permissions,
        "blocked_countries": blockedCountries == null ? null : blockedCountries,
        "two_factor_auth": twoFactorAuth == null ? null : twoFactorAuth,
        "notify_live_streaming":
            notifyLiveStreaming == null ? null : notifyLiveStreaming,
        "notify_mentions": notifyMentions == null ? null : notifyMentions,
        "stripe_connect_id": stripeConnectId,
        "completed_stripe_onboarding": completedStripeOnboarding == null
            ? null
            : completedStripeOnboarding,
        "device_token": deviceToken,
        "telegram": telegram == null ? null : telegram,
        "vk": vk == null ? null : vk,
        "twitch": twitch == null ? null : twitch,
        "discord": discord == null ? null : discord,
        "api_token": apiToken == null ? null : apiToken,
      };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"] == null ? null : json["url"],
        label: json["label"] == null ? null : json["label"],
        active: json["active"] == null ? null : json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
        "label": label == null ? null : label,
        "active": active == null ? null : active,
      };
}

class Users {
  Users({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<UserElement>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        currentPage: json["current_page"] == null ? null : json["current_page"],
        data: json["data"] == null
            ? null
            : List<UserElement>.from(
                json["data"].map((x) => UserElement.fromJson(x))),
        firstPageUrl:
            json["first_page_url"] == null ? null : json["first_page_url"],
        from: json["from"] == null ? null : json["from"],
        lastPage: json["last_page"] == null ? null : json["last_page"],
        lastPageUrl:
            json["last_page_url"] == null ? null : json["last_page_url"],
        links: json["links"] == null
            ? null
            : List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"] == null ? null : json["path"],
        perPage: json["per_page"] == null ? null : json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] == null ? null : json["to"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage == null ? null : currentPage,
        "data": data == null
            ? null
            : List<dynamic>.from(data?.map((x) => x.toJson()) ?? []),
        "first_page_url": firstPageUrl == null ? null : firstPageUrl,
        "from": from == null ? null : from,
        "last_page": lastPage == null ? null : lastPage,
        "last_page_url": lastPageUrl == null ? null : lastPageUrl,
        "links": links == null
            ? null
            : List<dynamic>.from(links?.map((x) => x.toJson()) ?? []),
        "next_page_url": nextPageUrl,
        "path": path == null ? null : path,
        "per_page": perPage == null ? null : perPage,
        "prev_page_url": prevPageUrl,
        "to": to == null ? null : to,
        "total": total == null ? null : total,
      };
}
