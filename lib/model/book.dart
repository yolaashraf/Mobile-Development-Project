// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

import 'dart:convert';

Book bookFromJson(String str) => Book.fromJson(json.decode(str));

String bookToJson(Book data) => json.encode(data.toJson());

class Book {
  Book({
    required this.tripName,
    required this.location,
    required this.peopleCount,
    required this.description,
    required this.price,
    required this.tripId,
    required this.userId,
    required this.bookId,
    required this.startDate,
    required this.endDate,
  });
  String bookId;
  String description;
  String endDate;
  String location;
  String peopleCount;
  String price;
  String startDate;
  String tripId;
  String tripName;
  String userId;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        bookId: json["bookId"],
        description: json["description"],
        endDate: json["endDate"],
        location: json["location"],
        peopleCount: json["peopleCount"],
        price: json["price"],
        startDate: json["startDate"],
        tripId: json["tripId"],
        tripName: json["tripName"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "tripName": tripName,
        "location": location,
        "peopleCount": peopleCount,
        "description": description,
        "price": price,
        "tripId": tripId,
        "userId": userId,
        "bookId": bookId,
        "startDate": startDate,
        "endDate": endDate,
      };
}
