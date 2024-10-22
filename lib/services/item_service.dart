
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talabat_pos/models/item_model.dart';
import 'package:talabat_pos/utils/url.dart';

class ItemService with ChangeNotifier {
  Dio dio = Dio();
  ItemModel? itemModel;

  Future<ItemModel> getItems(id) async {
    bool res = false;
    final response = await dio
        .get(
      Urls.baseUrl + Urls.itemUrl+"/"+"$id",
    )
        .then((value) {
      //Status code 200

      itemModel = itemModelFromJson(value.data);

      if (itemModel!.success == true) {
        res = true;
      } else {
        print(itemModel!.message);
      } notifyListeners();
    }).catchError((onError) {
      //Status code !=200
      print(onError);
    });

    return itemModel!;
  }
}
