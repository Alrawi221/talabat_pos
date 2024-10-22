import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talabat_pos/models/category_model.dart';
import 'package:talabat_pos/utils/url.dart';

class CategoryService with ChangeNotifier {
  Dio dio = Dio();
  CategoryModel? categoryModel;
  int? _indexCategory = 1;

  get getIndexCategory => _indexCategory;

  set setIndexCategory(value) {
    _indexCategory = value;
    notifyListeners();
  }

  Future<CategoryModel> getCategories() async {
    bool res = false;
    final response = await dio
        .get(
      Urls.baseUrl + Urls.categoryUrl,
    )
        .then((value) {
      //Status code 200
      print(value);
      categoryModel = CategoryModel.fromJson(value.data);

      if (categoryModel!.success == true) {
        res = true;
      } else {
        //print(categoryModel!.message);
      }
      notifyListeners();
    }).catchError((onError) {
      //Status code !=200
      print("#######################");
      print(onError);
      print("#######################");
    });
    notifyListeners();
    return categoryModel!;
  }
}
