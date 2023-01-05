// To parse this JSON data, do
//
//     final favModel = favModelFromJson(jsonString);

import 'dart:convert';

FavModel favModelFromJson(String str) => FavModel.fromJson(json.decode(str));

String favModelToJson(FavModel data) => json.encode(data.toJson());

class FavModel {
  FavModel({
    required this.favId,
    required this.tripId,
    required this.userId,
    required this.tripImg,
    required this.tripName,
    required this.tripdescription,
    required this.price,
    required this.triplocation,
    required this.sDate,
    required this.eDate,
  });

  String favId; //
  String tripId; //
  String userId;
  String tripImg; //
  String tripName; //
  String tripdescription;
  String price;
  String triplocation;
  String sDate;
  String eDate;

  factory FavModel.fromJson(Map<String, dynamic> json) => FavModel(
        favId: json["favId"],
        tripId: json["tripId"],
        userId: json["userId"],
        tripImg: json["tripImg"],
        tripName: json["tripName"],
        tripdescription: json["tripdescription"],
        price: json["price"],
        triplocation: json["triplocation"],
        sDate: json["sDate"],
        eDate: json["eDate"],
      );

  Map<String, dynamic> toJson() => {
        "favId": favId,
        "tripId": tripId,
        "userId": userId,
        "tripImg": tripImg,
        "tripName": tripName,
        "tripdescription": tripdescription,
        "price": price,
        "triplocation": triplocation,
        "sDate": sDate,
        "eDate": eDate,
      };
}
