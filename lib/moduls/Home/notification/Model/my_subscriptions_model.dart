// To parse this JSON data, do
//
//     final mySubscriptionsModel = mySubscriptionsModelFromJson(jsonString);

import 'dart:convert';

MySubscriptionsModel mySubscriptionsModelFromJson(String str) =>
    MySubscriptionsModel.fromJson(json.decode(str));

String mySubscriptionsModelToJson(MySubscriptionsModel data) =>
    json.encode(data.toJson());

class MySubscriptionsModel {
  MySubscriptionsModel({
    this.subscriptions,
  });

  List<Subscription>? subscriptions;

  factory MySubscriptionsModel.fromJson(Map<String, dynamic> json) =>
      MySubscriptionsModel(
        subscriptions: json["subscriptions"] == null
            ? null
            : List<Subscription>.from(
                json["subscriptions"].map((x) => Subscription.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subscriptions": subscriptions == null
            ? null
            : List<dynamic>.from(subscriptions?.map((x) => x.toJson()) ?? []),
      };
}

class Subscription {
  Subscription({
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

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
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
      };
}
