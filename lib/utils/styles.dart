import 'package:flutter/material.dart';
import 'package:talabat_pos/utils/color.dart';

class StylesApp {
  static const TextStyle titleStyle =
      TextStyle(fontSize: 40, fontWeight: FontWeight.w500);
  static const TextStyle titleDescStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  static TextStyle itemNameStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.primaryColor);
  static const TextStyle normalStyle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle priceNormalStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColors.scondaryColor);

  static TextStyle categoryNormalStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.scondaryColor);
  static TextStyle categoryNormalStyleSelect = TextStyle(
      fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.white);
  static TextStyle minusStyleSelect = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w500, color: AppColors.white);
  static TextStyle calcStyle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.grey);
  static TextStyle totalStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.scondaryColor);
}
