// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

import 'package:talabat_pos/models/item_model.dart';

OrderModel orderModelFromJson(String str) =>
    OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  int? subTotal;
  int? discount;
  int? vat;
  int? total;
  List<ItemData>? items;

  OrderModel({
    this.subTotal,
    this.discount,
    this.vat,
    this.total,
    this.items,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        subTotal: json["subTotal"],
        discount: json["discount"],
        vat: json["vat"],
        total: json["total"],
        items: json["items"] == null
            ? []
            : List<ItemData>.from(
                json["items"]!.map((x) => ItemData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "subTotal": subTotal,
        "discount": discount,
        "vat": vat,
        "total": total,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
