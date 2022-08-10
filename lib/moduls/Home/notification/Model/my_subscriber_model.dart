// To parse this JSON data, do
//
//     final mySubscriberModel = mySubscriberModelFromJson(jsonString);

import 'dart:convert';

MySubscriberModel mySubscriberModelFromJson(String str) =>
    MySubscriberModel.fromJson(json.decode(str));

String mySubscriberModelToJson(MySubscriberModel data) =>
    json.encode(data.toJson());

class MySubscriberModel {
  MySubscriberModel({
    this.subscribers,
  });

  List<Subscriber>? subscribers;

  factory MySubscriberModel.fromJson(Map<String, dynamic> json) =>
      MySubscriberModel(
        subscribers: json["subscribers"] == null
            ? null
            : List<Subscriber>.from(
                json["subscribers"].map((x) => Subscriber.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subscribers": subscribers == null
            ? null
            : List<dynamic>.from(subscribers?.map((x) => x.toJson()) ?? []),
      };
}

class Subscriber {
  Subscriber({
    this.id,
    this.userId,
    this.name,
    this.stripeId,
    this.stripeStatus,
    this.stripePrice,
    this.quantity,
    this.trialEndsAt,
    this.endsAt,
    this.createdAt,
    this.updatedAt,
    this.lastPayment,
    this.free,
    this.subscriptionId,
    this.cancelled,
    this.rebillWallet,
    this.interval,
    this.taxes,
    this.laravelThroughKey,
  });

  int? id;
  int? userId;
  String? name;
  String? stripeId;
  String? stripeStatus;
  String? stripePrice;
  dynamic quantity;
  dynamic trialEndsAt;
  dynamic endsAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic lastPayment;
  String? free;
  String? subscriptionId;
  String? cancelled;
  String? rebillWallet;
  String? interval;
  dynamic taxes;
  int? laravelThroughKey;

  factory Subscriber.fromJson(Map<String, dynamic> json) => Subscriber(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        name: json["name"] == null ? null : json["name"],
        stripeId: json["stripe_id"] == null ? null : json["stripe_id"],
        stripeStatus:
            json["stripe_status"] == null ? null : json["stripe_status"],
        stripePrice: json["stripe_price"] == null ? null : json["stripe_price"],
        quantity: json["quantity"],
        trialEndsAt: json["trial_ends_at"],
        endsAt: json["ends_at"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        lastPayment: json["last_payment"],
        free: json["free"] == null ? null : json["free"],
        subscriptionId:
            json["subscription_id"] == null ? null : json["subscription_id"],
        cancelled: json["cancelled"] == null ? null : json["cancelled"],
        rebillWallet:
            json["rebill_wallet"] == null ? null : json["rebill_wallet"],
        interval: json["interval"] == null ? null : json["interval"],
        taxes: json["taxes"],
        laravelThroughKey: json["laravel_through_key"] == null
            ? null
            : json["laravel_through_key"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "name": name == null ? null : name,
        "stripe_id": stripeId == null ? null : stripeId,
        "stripe_status": stripeStatus == null ? null : stripeStatus,
        "stripe_price": stripePrice == null ? null : stripePrice,
        "quantity": quantity,
        "trial_ends_at": trialEndsAt,
        "ends_at": endsAt,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "last_payment": lastPayment,
        "free": free == null ? null : free,
        "subscription_id": subscriptionId == null ? null : subscriptionId,
        "cancelled": cancelled == null ? null : cancelled,
        "rebill_wallet": rebillWallet == null ? null : rebillWallet,
        "interval": interval == null ? null : interval,
        "taxes": taxes,
        "laravel_through_key":
            laravelThroughKey == null ? null : laravelThroughKey,
      };
}
