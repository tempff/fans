///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class CategorySearchModelDataUsersLinks {
/*
{
  "url": null,
  "label": "pagination.previous",
  "active": false
}
*/

  String? url;
  String? label;
  bool? active;

  CategorySearchModelDataUsersLinks({
    this.url,
    this.label,
    this.active,
  });
  CategorySearchModelDataUsersLinks.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    label = json['label']?.toString();
    active = json['active'];
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class CategorySearchModelDataUsersData {
/*
{
  "id": 42,
  "name": "Deo Deo",
  "username": "deodeo",
  "countries_id": "212",
  "email": "deo@test.com",
  "date": "2022-08-17T06:51:25.000000Z",
  "avatar": "deodeo-421661520160vpoolj9s9m.jpg",
  "cover": "u42-421660806755oeskrc4spx.jpg",
  "status": "active",
  "role": "normal",
  "permission": "none",
  "confirmation_code": "",
  "paypal_account": "",
  "payment_gateway": "",
  "bank": "",
  "featured": "no",
  "featured_date": null,
  "about": "",
  "story": "Welcome to my page. If you like my content, please consider support. Thank you for your support!",
  "profession": "Comedian",
  "oauth_uid": "",
  "oauth_provider": "",
  "categories_id": "10",
  "website": "",
  "stripe_id": null,
  "pm_type": null,
  "pm_last_four": null,
  "trial_ends_at": null,
  "price": "0.00",
  "balance": "800.00",
  "verified_id": "yes",
  "address": "",
  "city": "Arusha",
  "zip": "255",
  "facebook": "",
  "twitter": "",
  "instagram": "",
  "youtube": "",
  "pinterest": "",
  "github": "",
  "last_seen": "2022-08-28 09:54:39",
  "email_new_subscriber": "yes",
  "plan": "user_42",
  "notify_new_subscriber": "yes",
  "notify_liked_post": "yes",
  "notify_commented_post": "yes",
  "company": "Comedy central",
  "post_locked": "yes",
  "ip": "41.222.181.68",
  "dark_mode": "off",
  "gender": "male",
  "birthdate": "01/01/1970",
  "allow_download_files": "no",
  "language": "en",
  "free_subscription": "no",
  "wallet": "0.00",
  "tiktok": "",
  "snapchat": "",
  "paystack_plan": "",
  "paystack_authorization_code": "",
  "paystack_last4": 0,
  "paystack_exp": "",
  "paystack_card_brand": "",
  "notify_new_tip": "yes",
  "hide_profile": "no",
  "hide_last_seen": "no",
  "last_login": "",
  "hide_count_subscribers": "no",
  "hide_my_country": "no",
  "show_my_birthdate": "no",
  "notify_new_post": "yes",
  "notify_email_new_post": "yes",
  "custom_fee": 0,
  "hide_name": "no",
  "birthdate_changed": "yes",
  "email_new_tip": "yes",
  "email_new_ppv": "yes",
  "notify_new_ppv": "yes",
  "active_status_online": "yes",
  "payoneer_account": "",
  "zelle_account": "",
  "notify_liked_comment": "yes",
  "permissions": "",
  "blocked_countries": "",
  "two_factor_auth": "no",
  "notify_live_streaming": "yes",
  "notify_mentions": "yes",
  "stripe_connect_id": null,
  "completed_stripe_onboarding": 0,
  "device_token": null,
  "telegram": "",
  "vk": "",
  "twitch": "",
  "discord": "",
  "api_token": "n9itWOqt78c8lGcB9A9QYSpnLFxqaK83wcTNkNAw5ZU1rci3KVMHribXzbAG",
  "mobile": null,
  "is_mobile_verified": 0,
  "firebase_token": null,
  "cover_url": "https://fans2.s3.eu-west-1.wasabisys.com/uploads/cover/u42-421660806755oeskrc4spx.jpg",
  "avatar_url": "https://fans2.s3.eu-west-1.wasabisys.com/uploads/avatar/deodeo-421661520160vpoolj9s9m.jpg"
}
*/

  int? id;
  String? name;
  String? username;
  String? countriesId;
  String? email;
  String? date;
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
  String? featuredDate;
  String? about;
  String? story;
  String? profession;
  String? oauthUid;
  String? oauthProvider;
  String? categoriesId;
  String? website;
  String? stripeId;
  String? pmType;
  String? pmLastFour;
  String? trialEndsAt;
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
  String? lastSeen;
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
  String? stripeConnectId;
  int? completedStripeOnboarding;
  String? deviceToken;
  String? telegram;
  String? vk;
  String? twitch;
  String? discord;
  String? apiToken;
  String? mobile;
  int? isMobileVerified;
  String? firebaseToken;
  String? coverUrl;
  String? avatarUrl;

  CategorySearchModelDataUsersData({
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
    this.mobile,
    this.isMobileVerified,
    this.firebaseToken,
    this.coverUrl,
    this.avatarUrl,
  });
  CategorySearchModelDataUsersData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    name = json['name']?.toString();
    username = json['username']?.toString();
    countriesId = json['countries_id']?.toString();
    email = json['email']?.toString();
    date = json['date']?.toString();
    avatar = json['avatar']?.toString();
    cover = json['cover']?.toString();
    status = json['status']?.toString();
    role = json['role']?.toString();
    permission = json['permission']?.toString();
    confirmationCode = json['confirmation_code']?.toString();
    paypalAccount = json['paypal_account']?.toString();
    paymentGateway = json['payment_gateway']?.toString();
    bank = json['bank']?.toString();
    featured = json['featured']?.toString();
    featuredDate = json['featured_date']?.toString();
    about = json['about']?.toString();
    story = json['story']?.toString();
    profession = json['profession']?.toString();
    oauthUid = json['oauth_uid']?.toString();
    oauthProvider = json['oauth_provider']?.toString();
    categoriesId = json['categories_id']?.toString();
    website = json['website']?.toString();
    stripeId = json['stripe_id']?.toString();
    pmType = json['pm_type']?.toString();
    pmLastFour = json['pm_last_four']?.toString();
    trialEndsAt = json['trial_ends_at']?.toString();
    price = json['price']?.toString();
    balance = json['balance']?.toString();
    verifiedId = json['verified_id']?.toString();
    address = json['address']?.toString();
    city = json['city']?.toString();
    zip = json['zip']?.toString();
    facebook = json['facebook']?.toString();
    twitter = json['twitter']?.toString();
    instagram = json['instagram']?.toString();
    youtube = json['youtube']?.toString();
    pinterest = json['pinterest']?.toString();
    github = json['github']?.toString();
    lastSeen = json['last_seen']?.toString();
    emailNewSubscriber = json['email_new_subscriber']?.toString();
    plan = json['plan']?.toString();
    notifyNewSubscriber = json['notify_new_subscriber']?.toString();
    notifyLikedPost = json['notify_liked_post']?.toString();
    notifyCommentedPost = json['notify_commented_post']?.toString();
    company = json['company']?.toString();
    postLocked = json['post_locked']?.toString();
    ip = json['ip']?.toString();
    darkMode = json['dark_mode']?.toString();
    gender = json['gender']?.toString();
    birthdate = json['birthdate']?.toString();
    allowDownloadFiles = json['allow_download_files']?.toString();
    language = json['language']?.toString();
    freeSubscription = json['free_subscription']?.toString();
    wallet = json['wallet']?.toString();
    tiktok = json['tiktok']?.toString();
    snapchat = json['snapchat']?.toString();
    paystackPlan = json['paystack_plan']?.toString();
    paystackAuthorizationCode = json['paystack_authorization_code']?.toString();
    paystackLast4 = json['paystack_last4']?.toInt();
    paystackExp = json['paystack_exp']?.toString();
    paystackCardBrand = json['paystack_card_brand']?.toString();
    notifyNewTip = json['notify_new_tip']?.toString();
    hideProfile = json['hide_profile']?.toString();
    hideLastSeen = json['hide_last_seen']?.toString();
    lastLogin = json['last_login']?.toString();
    hideCountSubscribers = json['hide_count_subscribers']?.toString();
    hideMyCountry = json['hide_my_country']?.toString();
    showMyBirthdate = json['show_my_birthdate']?.toString();
    notifyNewPost = json['notify_new_post']?.toString();
    notifyEmailNewPost = json['notify_email_new_post']?.toString();
    customFee = json['custom_fee']?.toInt();
    hideName = json['hide_name']?.toString();
    birthdateChanged = json['birthdate_changed']?.toString();
    emailNewTip = json['email_new_tip']?.toString();
    emailNewPpv = json['email_new_ppv']?.toString();
    notifyNewPpv = json['notify_new_ppv']?.toString();
    activeStatusOnline = json['active_status_online']?.toString();
    payoneerAccount = json['payoneer_account']?.toString();
    zelleAccount = json['zelle_account']?.toString();
    notifyLikedComment = json['notify_liked_comment']?.toString();
    permissions = json['permissions']?.toString();
    blockedCountries = json['blocked_countries']?.toString();
    twoFactorAuth = json['two_factor_auth']?.toString();
    notifyLiveStreaming = json['notify_live_streaming']?.toString();
    notifyMentions = json['notify_mentions']?.toString();
    stripeConnectId = json['stripe_connect_id']?.toString();
    completedStripeOnboarding = json['completed_stripe_onboarding']?.toInt();
    deviceToken = json['device_token']?.toString();
    telegram = json['telegram']?.toString();
    vk = json['vk']?.toString();
    twitch = json['twitch']?.toString();
    discord = json['discord']?.toString();
    apiToken = json['api_token']?.toString();
    mobile = json['mobile']?.toString();
    isMobileVerified = json['is_mobile_verified']?.toInt();
    firebaseToken = json['firebase_token']?.toString();
    coverUrl = json['cover_url']?.toString();
    avatarUrl = json['avatar_url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['countries_id'] = countriesId;
    data['email'] = email;
    data['date'] = date;
    data['avatar'] = avatar;
    data['cover'] = cover;
    data['status'] = status;
    data['role'] = role;
    data['permission'] = permission;
    data['confirmation_code'] = confirmationCode;
    data['paypal_account'] = paypalAccount;
    data['payment_gateway'] = paymentGateway;
    data['bank'] = bank;
    data['featured'] = featured;
    data['featured_date'] = featuredDate;
    data['about'] = about;
    data['story'] = story;
    data['profession'] = profession;
    data['oauth_uid'] = oauthUid;
    data['oauth_provider'] = oauthProvider;
    data['categories_id'] = categoriesId;
    data['website'] = website;
    data['stripe_id'] = stripeId;
    data['pm_type'] = pmType;
    data['pm_last_four'] = pmLastFour;
    data['trial_ends_at'] = trialEndsAt;
    data['price'] = price;
    data['balance'] = balance;
    data['verified_id'] = verifiedId;
    data['address'] = address;
    data['city'] = city;
    data['zip'] = zip;
    data['facebook'] = facebook;
    data['twitter'] = twitter;
    data['instagram'] = instagram;
    data['youtube'] = youtube;
    data['pinterest'] = pinterest;
    data['github'] = github;
    data['last_seen'] = lastSeen;
    data['email_new_subscriber'] = emailNewSubscriber;
    data['plan'] = plan;
    data['notify_new_subscriber'] = notifyNewSubscriber;
    data['notify_liked_post'] = notifyLikedPost;
    data['notify_commented_post'] = notifyCommentedPost;
    data['company'] = company;
    data['post_locked'] = postLocked;
    data['ip'] = ip;
    data['dark_mode'] = darkMode;
    data['gender'] = gender;
    data['birthdate'] = birthdate;
    data['allow_download_files'] = allowDownloadFiles;
    data['language'] = language;
    data['free_subscription'] = freeSubscription;
    data['wallet'] = wallet;
    data['tiktok'] = tiktok;
    data['snapchat'] = snapchat;
    data['paystack_plan'] = paystackPlan;
    data['paystack_authorization_code'] = paystackAuthorizationCode;
    data['paystack_last4'] = paystackLast4;
    data['paystack_exp'] = paystackExp;
    data['paystack_card_brand'] = paystackCardBrand;
    data['notify_new_tip'] = notifyNewTip;
    data['hide_profile'] = hideProfile;
    data['hide_last_seen'] = hideLastSeen;
    data['last_login'] = lastLogin;
    data['hide_count_subscribers'] = hideCountSubscribers;
    data['hide_my_country'] = hideMyCountry;
    data['show_my_birthdate'] = showMyBirthdate;
    data['notify_new_post'] = notifyNewPost;
    data['notify_email_new_post'] = notifyEmailNewPost;
    data['custom_fee'] = customFee;
    data['hide_name'] = hideName;
    data['birthdate_changed'] = birthdateChanged;
    data['email_new_tip'] = emailNewTip;
    data['email_new_ppv'] = emailNewPpv;
    data['notify_new_ppv'] = notifyNewPpv;
    data['active_status_online'] = activeStatusOnline;
    data['payoneer_account'] = payoneerAccount;
    data['zelle_account'] = zelleAccount;
    data['notify_liked_comment'] = notifyLikedComment;
    data['permissions'] = permissions;
    data['blocked_countries'] = blockedCountries;
    data['two_factor_auth'] = twoFactorAuth;
    data['notify_live_streaming'] = notifyLiveStreaming;
    data['notify_mentions'] = notifyMentions;
    data['stripe_connect_id'] = stripeConnectId;
    data['completed_stripe_onboarding'] = completedStripeOnboarding;
    data['device_token'] = deviceToken;
    data['telegram'] = telegram;
    data['vk'] = vk;
    data['twitch'] = twitch;
    data['discord'] = discord;
    data['api_token'] = apiToken;
    data['mobile'] = mobile;
    data['is_mobile_verified'] = isMobileVerified;
    data['firebase_token'] = firebaseToken;
    data['cover_url'] = coverUrl;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}

class CategorySearchModelDataUsers {
/*
{
  "current_page": 1,
  "data": [
    {
      "id": 42,
      "name": "Deo Deo",
      "username": "deodeo",
      "countries_id": "212",
      "email": "deo@test.com",
      "date": "2022-08-17T06:51:25.000000Z",
      "avatar": "deodeo-421661520160vpoolj9s9m.jpg",
      "cover": "u42-421660806755oeskrc4spx.jpg",
      "status": "active",
      "role": "normal",
      "permission": "none",
      "confirmation_code": "",
      "paypal_account": "",
      "payment_gateway": "",
      "bank": "",
      "featured": "no",
      "featured_date": null,
      "about": "",
      "story": "Welcome to my page. If you like my content, please consider support. Thank you for your support!",
      "profession": "Comedian",
      "oauth_uid": "",
      "oauth_provider": "",
      "categories_id": "10",
      "website": "",
      "stripe_id": null,
      "pm_type": null,
      "pm_last_four": null,
      "trial_ends_at": null,
      "price": "0.00",
      "balance": "800.00",
      "verified_id": "yes",
      "address": "",
      "city": "Arusha",
      "zip": "255",
      "facebook": "",
      "twitter": "",
      "instagram": "",
      "youtube": "",
      "pinterest": "",
      "github": "",
      "last_seen": "2022-08-28 09:54:39",
      "email_new_subscriber": "yes",
      "plan": "user_42",
      "notify_new_subscriber": "yes",
      "notify_liked_post": "yes",
      "notify_commented_post": "yes",
      "company": "Comedy central",
      "post_locked": "yes",
      "ip": "41.222.181.68",
      "dark_mode": "off",
      "gender": "male",
      "birthdate": "01/01/1970",
      "allow_download_files": "no",
      "language": "en",
      "free_subscription": "no",
      "wallet": "0.00",
      "tiktok": "",
      "snapchat": "",
      "paystack_plan": "",
      "paystack_authorization_code": "",
      "paystack_last4": 0,
      "paystack_exp": "",
      "paystack_card_brand": "",
      "notify_new_tip": "yes",
      "hide_profile": "no",
      "hide_last_seen": "no",
      "last_login": "",
      "hide_count_subscribers": "no",
      "hide_my_country": "no",
      "show_my_birthdate": "no",
      "notify_new_post": "yes",
      "notify_email_new_post": "yes",
      "custom_fee": 0,
      "hide_name": "no",
      "birthdate_changed": "yes",
      "email_new_tip": "yes",
      "email_new_ppv": "yes",
      "notify_new_ppv": "yes",
      "active_status_online": "yes",
      "payoneer_account": "",
      "zelle_account": "",
      "notify_liked_comment": "yes",
      "permissions": "",
      "blocked_countries": "",
      "two_factor_auth": "no",
      "notify_live_streaming": "yes",
      "notify_mentions": "yes",
      "stripe_connect_id": null,
      "completed_stripe_onboarding": 0,
      "device_token": null,
      "telegram": "",
      "vk": "",
      "twitch": "",
      "discord": "",
      "api_token": "n9itWOqt78c8lGcB9A9QYSpnLFxqaK83wcTNkNAw5ZU1rci3KVMHribXzbAG",
      "mobile": null,
      "is_mobile_verified": 0,
      "firebase_token": null,
      "cover_url": "https://fans2.s3.eu-west-1.wasabisys.com/uploads/cover/u42-421660806755oeskrc4spx.jpg",
      "avatar_url": "https://fans2.s3.eu-west-1.wasabisys.com/uploads/avatar/deodeo-421661520160vpoolj9s9m.jpg"
    }
  ],
  "first_page_url": "https://alpha.fans2.co.tz/api/category/artist?page=1",
  "from": 1,
  "last_page": 1,
  "last_page_url": "https://alpha.fans2.co.tz/api/category/artist?page=1",
  "links": [
    {
      "url": null,
      "label": "pagination.previous",
      "active": false
    }
  ],
  "next_page_url": null,
  "path": "https://alpha.fans2.co.tz/api/category/artist",
  "per_page": 12,
  "prev_page_url": null,
  "to": 1,
  "total": 1
}
*/

  int? currentPage;
  List<CategorySearchModelDataUsersData?>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<CategorySearchModelDataUsersLinks?>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  String? prevPageUrl;
  int? to;
  int? total;

  CategorySearchModelDataUsers({
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
  CategorySearchModelDataUsers.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page']?.toInt();
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <CategorySearchModelDataUsersData>[];
      v.forEach((v) {
        arr0.add(CategorySearchModelDataUsersData.fromJson(v));
      });
      this.data = arr0;
    }
    firstPageUrl = json['first_page_url']?.toString();
    from = json['from']?.toInt();
    lastPage = json['last_page']?.toInt();
    lastPageUrl = json['last_page_url']?.toString();
    if (json['links'] != null) {
      final v = json['links'];
      final arr0 = <CategorySearchModelDataUsersLinks>[];
      v.forEach((v) {
        arr0.add(CategorySearchModelDataUsersLinks.fromJson(v));
      });
      links = arr0;
    }
    nextPageUrl = json['next_page_url']?.toString();
    path = json['path']?.toString();
    perPage = json['per_page']?.toInt();
    prevPageUrl = json['prev_page_url']?.toString();
    to = json['to']?.toInt();
    total = json['total']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      final v = links;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['links'] = arr0;
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class CategorySearchModelData {
/*
{
  "users": {
    "current_page": 1,
    "data": [
      {
        "id": 42,
        "name": "Deo Deo",
        "username": "deodeo",
        "countries_id": "212",
        "email": "deo@test.com",
        "date": "2022-08-17T06:51:25.000000Z",
        "avatar": "deodeo-421661520160vpoolj9s9m.jpg",
        "cover": "u42-421660806755oeskrc4spx.jpg",
        "status": "active",
        "role": "normal",
        "permission": "none",
        "confirmation_code": "",
        "paypal_account": "",
        "payment_gateway": "",
        "bank": "",
        "featured": "no",
        "featured_date": null,
        "about": "",
        "story": "Welcome to my page. If you like my content, please consider support. Thank you for your support!",
        "profession": "Comedian",
        "oauth_uid": "",
        "oauth_provider": "",
        "categories_id": "10",
        "website": "",
        "stripe_id": null,
        "pm_type": null,
        "pm_last_four": null,
        "trial_ends_at": null,
        "price": "0.00",
        "balance": "800.00",
        "verified_id": "yes",
        "address": "",
        "city": "Arusha",
        "zip": "255",
        "facebook": "",
        "twitter": "",
        "instagram": "",
        "youtube": "",
        "pinterest": "",
        "github": "",
        "last_seen": "2022-08-28 09:54:39",
        "email_new_subscriber": "yes",
        "plan": "user_42",
        "notify_new_subscriber": "yes",
        "notify_liked_post": "yes",
        "notify_commented_post": "yes",
        "company": "Comedy central",
        "post_locked": "yes",
        "ip": "41.222.181.68",
        "dark_mode": "off",
        "gender": "male",
        "birthdate": "01/01/1970",
        "allow_download_files": "no",
        "language": "en",
        "free_subscription": "no",
        "wallet": "0.00",
        "tiktok": "",
        "snapchat": "",
        "paystack_plan": "",
        "paystack_authorization_code": "",
        "paystack_last4": 0,
        "paystack_exp": "",
        "paystack_card_brand": "",
        "notify_new_tip": "yes",
        "hide_profile": "no",
        "hide_last_seen": "no",
        "last_login": "",
        "hide_count_subscribers": "no",
        "hide_my_country": "no",
        "show_my_birthdate": "no",
        "notify_new_post": "yes",
        "notify_email_new_post": "yes",
        "custom_fee": 0,
        "hide_name": "no",
        "birthdate_changed": "yes",
        "email_new_tip": "yes",
        "email_new_ppv": "yes",
        "notify_new_ppv": "yes",
        "active_status_online": "yes",
        "payoneer_account": "",
        "zelle_account": "",
        "notify_liked_comment": "yes",
        "permissions": "",
        "blocked_countries": "",
        "two_factor_auth": "no",
        "notify_live_streaming": "yes",
        "notify_mentions": "yes",
        "stripe_connect_id": null,
        "completed_stripe_onboarding": 0,
        "device_token": null,
        "telegram": "",
        "vk": "",
        "twitch": "",
        "discord": "",
        "api_token": "n9itWOqt78c8lGcB9A9QYSpnLFxqaK83wcTNkNAw5ZU1rci3KVMHribXzbAG",
        "mobile": null,
        "is_mobile_verified": 0,
        "firebase_token": null,
        "cover_url": "https://fans2.s3.eu-west-1.wasabisys.com/uploads/cover/u42-421660806755oeskrc4spx.jpg",
        "avatar_url": "https://fans2.s3.eu-west-1.wasabisys.com/uploads/avatar/deodeo-421661520160vpoolj9s9m.jpg"
      }
    ],
    "first_page_url": "https://alpha.fans2.co.tz/api/category/artist?page=1",
    "from": 1,
    "last_page": 1,
    "last_page_url": "https://alpha.fans2.co.tz/api/category/artist?page=1",
    "links": [
      {
        "url": null,
        "label": "pagination.previous",
        "active": false
      }
    ],
    "next_page_url": null,
    "path": "https://alpha.fans2.co.tz/api/category/artist",
    "per_page": 12,
    "prev_page_url": null,
    "to": 1,
    "total": 1
  },
  "title": "Artist",
  "slug": "artist",
  "image": "artist-By4bfBlXy75qPKK99RgC5MN9g8lUTWo8.jpg",
  "keywords": "",
  "description": ""
}
*/

  CategorySearchModelDataUsers? users;
  String? title;
  String? slug;
  String? image;
  String? keywords;
  String? description;

  CategorySearchModelData({
    this.users,
    this.title,
    this.slug,
    this.image,
    this.keywords,
    this.description,
  });
  CategorySearchModelData.fromJson(Map<String, dynamic> json) {
    users = (json['users'] != null) ? CategorySearchModelDataUsers.fromJson(json['users']) : null;
    title = json['title']?.toString();
    slug = json['slug']?.toString();
    image = json['image']?.toString();
    keywords = json['keywords']?.toString();
    description = json['description']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (users != null) {
      data['users'] = users!.toJson();
    }
    data['title'] = title;
    data['slug'] = slug;
    data['image'] = image;
    data['keywords'] = keywords;
    data['description'] = description;
    return data;
  }
}

class CategorySearchModel {
/*
{
  "data": {
    "users": {
      "current_page": 1,
      "data": [
        {
          "id": 42,
          "name": "Deo Deo",
          "username": "deodeo",
          "countries_id": "212",
          "email": "deo@test.com",
          "date": "2022-08-17T06:51:25.000000Z",
          "avatar": "deodeo-421661520160vpoolj9s9m.jpg",
          "cover": "u42-421660806755oeskrc4spx.jpg",
          "status": "active",
          "role": "normal",
          "permission": "none",
          "confirmation_code": "",
          "paypal_account": "",
          "payment_gateway": "",
          "bank": "",
          "featured": "no",
          "featured_date": null,
          "about": "",
          "story": "Welcome to my page. If you like my content, please consider support. Thank you for your support!",
          "profession": "Comedian",
          "oauth_uid": "",
          "oauth_provider": "",
          "categories_id": "10",
          "website": "",
          "stripe_id": null,
          "pm_type": null,
          "pm_last_four": null,
          "trial_ends_at": null,
          "price": "0.00",
          "balance": "800.00",
          "verified_id": "yes",
          "address": "",
          "city": "Arusha",
          "zip": "255",
          "facebook": "",
          "twitter": "",
          "instagram": "",
          "youtube": "",
          "pinterest": "",
          "github": "",
          "last_seen": "2022-08-28 09:54:39",
          "email_new_subscriber": "yes",
          "plan": "user_42",
          "notify_new_subscriber": "yes",
          "notify_liked_post": "yes",
          "notify_commented_post": "yes",
          "company": "Comedy central",
          "post_locked": "yes",
          "ip": "41.222.181.68",
          "dark_mode": "off",
          "gender": "male",
          "birthdate": "01/01/1970",
          "allow_download_files": "no",
          "language": "en",
          "free_subscription": "no",
          "wallet": "0.00",
          "tiktok": "",
          "snapchat": "",
          "paystack_plan": "",
          "paystack_authorization_code": "",
          "paystack_last4": 0,
          "paystack_exp": "",
          "paystack_card_brand": "",
          "notify_new_tip": "yes",
          "hide_profile": "no",
          "hide_last_seen": "no",
          "last_login": "",
          "hide_count_subscribers": "no",
          "hide_my_country": "no",
          "show_my_birthdate": "no",
          "notify_new_post": "yes",
          "notify_email_new_post": "yes",
          "custom_fee": 0,
          "hide_name": "no",
          "birthdate_changed": "yes",
          "email_new_tip": "yes",
          "email_new_ppv": "yes",
          "notify_new_ppv": "yes",
          "active_status_online": "yes",
          "payoneer_account": "",
          "zelle_account": "",
          "notify_liked_comment": "yes",
          "permissions": "",
          "blocked_countries": "",
          "two_factor_auth": "no",
          "notify_live_streaming": "yes",
          "notify_mentions": "yes",
          "stripe_connect_id": null,
          "completed_stripe_onboarding": 0,
          "device_token": null,
          "telegram": "",
          "vk": "",
          "twitch": "",
          "discord": "",
          "api_token": "n9itWOqt78c8lGcB9A9QYSpnLFxqaK83wcTNkNAw5ZU1rci3KVMHribXzbAG",
          "mobile": null,
          "is_mobile_verified": 0,
          "firebase_token": null,
          "cover_url": "https://fans2.s3.eu-west-1.wasabisys.com/uploads/cover/u42-421660806755oeskrc4spx.jpg",
          "avatar_url": "https://fans2.s3.eu-west-1.wasabisys.com/uploads/avatar/deodeo-421661520160vpoolj9s9m.jpg"
        }
      ],
      "first_page_url": "https://alpha.fans2.co.tz/api/category/artist?page=1",
      "from": 1,
      "last_page": 1,
      "last_page_url": "https://alpha.fans2.co.tz/api/category/artist?page=1",
      "links": [
        {
          "url": null,
          "label": "pagination.previous",
          "active": false
        }
      ],
      "next_page_url": null,
      "path": "https://alpha.fans2.co.tz/api/category/artist",
      "per_page": 12,
      "prev_page_url": null,
      "to": 1,
      "total": 1
    },
    "title": "Artist",
    "slug": "artist",
    "image": "artist-By4bfBlXy75qPKK99RgC5MN9g8lUTWo8.jpg",
    "keywords": "",
    "description": ""
  },
  "message": "Action successful.",
  "success": true,
  "status_code": 200
}
*/

  CategorySearchModelData? data;
  String? message;
  bool? success;
  int? statusCode;

  CategorySearchModel({
    this.data,
    this.message,
    this.success,
    this.statusCode,
  });
  CategorySearchModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null) ? CategorySearchModelData.fromJson(json['data']) : null;
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
