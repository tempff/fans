// To parse this JSON data, do
//
//     final messegesModel = messegesModelFromJson(jsonString);

import 'dart:convert';

MessegesModel messegesModelFromJson(String str) => MessegesModel.fromJson(json.decode(str));

String messegesModelToJson(MessegesModel data) => json.encode(data.toJson());

class MessegesModel {
  MessegesModel({
    this.messagesInbox,
  });

  List<dynamic>? messagesInbox;

  factory MessegesModel.fromJson(Map<String, dynamic> json) => MessegesModel(
    messagesInbox: json["messagesInbox"] == null ? null : List<dynamic>.from(json["messagesInbox"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "messagesInbox": messagesInbox == null ? null : List<dynamic>.from(messagesInbox?.map((x) => x)??[]),
  };
}
