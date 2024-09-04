// To parse this JSON data, do
//
//     final packagesModel = packagesModelFromJson(jsonString);

import 'dart:convert';

List<PackagesModel> packagesModelFromJson(String str) => List<PackagesModel>.from(json.decode(str).map((x) => PackagesModel.fromJson(x)));

String packagesModelToJson(List<PackagesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PackagesModel {
  String? title;
  String? price;
  String? desc;

  PackagesModel({
    this.title,
    this.price,
    this.desc,
  });

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
    title: json["title"],
    price: json["price"],
    desc: json["desc"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "price": price,
    "desc": desc,
  };
}
