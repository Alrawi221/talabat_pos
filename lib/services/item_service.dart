import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talabat_pos/models/item_model.dart';
import 'package:talabat_pos/utils/url.dart';

class ItemService with ChangeNotifier {
  Dio dio = Dio();
  ItemModel? itemModel;



  Future<ItemModel> getItems(id) async {
    bool res = false;
    print("###########################");
    print(Urls.baseUrl + Urls.itemUrl);
    print("###########################");
    final response = await dio.get(Urls.baseUrl + Urls.itemUrl,
        queryParameters: {"categoryId": id}).then((value) {
      //Status code 200

      itemModel = ItemModel.fromJson(value.data);

      if (itemModel!.success == true) {
        res = true;
        return itemModel!;
      } else {
        print(itemModel!.message);
      }
      notifyListeners();
    }).catchError((onError) {
      print(onError);
      return onError;
      //Status code !=200
    });
    notifyListeners();
    return itemModel!;
  }
}
