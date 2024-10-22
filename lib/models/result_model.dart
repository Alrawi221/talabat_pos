// To parse this JSON data, do
//
//     final resultModel = resultModelFromJson(jsonString);

import 'dart:convert';

ResultModel resultModelFromJson(String str) => ResultModel.fromJson(json.decode(str));

String resultModelToJson(ResultModel data) => json.encode(data.toJson());

class ResultModel {
    final bool? success;
    final String? message;
    final dynamic error;

    ResultModel({
        this.success,
        this.message,
        this.error,
    });

    factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        success: json["success"],
        message: json["message"],
        error: json["error"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "error": error,
    };
}
