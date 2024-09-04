// To parse this JSON data, do
//
//     final currentBookingModel = currentBookingModelFromJson(jsonString);

import 'dart:convert';

List<CurrentBookingModel> currentBookingModelFromJson(String str) => List<CurrentBookingModel>.from(json.decode(str).map((x) => CurrentBookingModel.fromJson(x)));

String currentBookingModelToJson(List<CurrentBookingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CurrentBookingModel {
  String? title;
  String? fromDate;
  String? fromTime;
  String? toDate;
  String? toTime;

  CurrentBookingModel({
    this.title,
    this.fromDate,
    this.fromTime,
    this.toDate,
    this.toTime,
  });

  factory CurrentBookingModel.fromJson(Map<String, dynamic> json) => CurrentBookingModel(
    title: json["title"],
    fromDate: json["from_date"],
    fromTime: json["from_time"],
    toDate: json["to_date"],
    toTime: json["to_time"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "from_date": fromDate,
    "from_time": fromTime,
    "to_date": toDate,
    "to_time": toTime,
  };
}
