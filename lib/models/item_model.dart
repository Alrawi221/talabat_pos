// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  final bool? success;
  final String? message;
  final List<ItemData>? data;
  final dynamic error;

  ItemModel({
    this.success,
    this.message,
    this.data,
    this.error,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ItemData>.from(
                json["data"]!.map((x) => ItemData.fromJson(x))),
        error: json["error"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "error": error,
      };
}

class ItemData {
  final int? id;
  final int? categoryId;
  final String? name;
  final int? price;
  final String? imagePath;

  ItemData({
    this.id,
    this.categoryId,
    this.name,
    this.price,
    this.imagePath,
  });

  factory ItemData.fromJson(Map<String, dynamic> json) => ItemData(
        id: json["id"],
        categoryId: json["categoryId"],
        name: json["name"],
        price: json["price"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": categoryId,
        "name": name,
        "price": price,
        "imagePath": imagePath,
      };
}
