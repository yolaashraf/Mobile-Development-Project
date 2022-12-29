// To parse this JSON data, do
//
//     final trip = tripFromJson(jsonString);

import 'dart:convert';

Trip tripFromJson(String str) => Trip.fromJson(json.decode(str));

String tripToJson(Trip data) => json.encode(data.toJson());

class Trip {
  Trip({
    required this.tripName,
    required this.location,
    required this.description,
    required this.price,
    required this.tripid,
    required this.startDate,
    required this.endDate,
    required this.img,
  });

  String tripName;
  String location;
  String description;
  String price;
  String tripid;
  String startDate;
  String endDate;
  String img;

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
        tripName: json["tripName"],
        location: json["location"],
        description: json["description"],
        price: json["price"],
        tripid: json["tripid"],
        startDate: json["startDate"],
        endDate: json["endDate"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "tripName": tripName,
        "location": location,
        "description": description,
        "price": price,
        "tripid": tripid,
        "startDate": startDate,
        "endDate": endDate,
        "img": img,
      };
}
