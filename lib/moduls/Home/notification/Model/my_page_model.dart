// To parse this JSON data, do
//
//     final myPageModel = myPageModelFromJson(jsonString);

import 'dart:convert';

MyPageModel myPageModelFromJson(String str) =>
    MyPageModel.fromJson(json.decode(str));

String myPageModelToJson(MyPageModel data) => json.encode(data.toJson());

class MyPageModel {
  MyPageModel({
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
    this.token,
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
  String? token;
  String? confirmationCode;
  String? paypalAccount;
  String? paymentGateway;
  String? bank;
  String? featured;
  dynamic featuredDate;
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

  factory MyPageModel.fromJson(Map<String, dynamic> json) => MyPageModel(
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
        token: json["token"] == null ? null : json["token"],
        confirmationCode: json["confirmation_code"] == null
            ? null
            : json["confirmation_code"],
        paypalAccount:
            json["paypal_account"] == null ? null : json["paypal_account"],
        paymentGateway:
            json["payment_gateway"] == null ? null : json["payment_gateway"],
        bank: json["bank"] == null ? null : json["bank"],
        featured: json["featured"] == null ? null : json["featured"],
        featuredDate: json["featured_date"],
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
        "token": token == null ? null : token,
        "confirmation_code": confirmationCode == null ? null : confirmationCode,
        "paypal_account": paypalAccount == null ? null : paypalAccount,
        "payment_gateway": paymentGateway == null ? null : paymentGateway,
        "bank": bank == null ? null : bank,
        "featured": featured == null ? null : featured,
        "featured_date": featuredDate,
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
