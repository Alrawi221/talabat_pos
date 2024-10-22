// To parse this JSON data, do
//
//     final itemModel = itemModelFromJson(jsonString);

import 'dart:convert';

ItemModel itemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String itemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
    final bool? success;
    final String? message;
    final List<Datum>? data;
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
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "error": error,
    };
}

class Datum {
    final int? id;
    final int? categoryId;
    final String? name;
    final int? price;
    final String? imagePath;

    Datum({
        this.id,
        this.categoryId,
        this.name,
        this.price,
        this.imagePath,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
