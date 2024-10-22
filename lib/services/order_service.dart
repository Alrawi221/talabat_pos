import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talabat_pos/models/item_model.dart';
import 'package:talabat_pos/models/order_model.dart';
import 'package:talabat_pos/utils/url.dart';

import '../models/result_model.dart';

class OrderService with ChangeNotifier {
  Dio dio = Dio();
  OrderModel _order = OrderModel();

  OrderModel get getOrder => _order;

  set setOrder(value) {
    _order = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  set setIsLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  set setItemOrder(value) {
    if (_order.items == null) {
      _order.items = [];
    }
    _order.items!.add(value);
    notifyListeners();
  }

  bool _checkoutDone = false;
  get getCheckoutDone => _checkoutDone;
  set setCheckoutDone(value) {
    _checkoutDone = value;
    notifyListeners();
  }

  calc() {
    _order.subTotal = 0;
    _order.total = 0;

    for (var item in _order.items!) {
      _order.subTotal = _order.subTotal! + item.price!;
    }
    _order.total = _order.subTotal;
    _order.discount = 0;
    _order.vat = 0;

    notifyListeners();
  }

  deleteItem(index) {
    _order.items!.removeAt(index);
    calc();
    notifyListeners();
  }

  Future<bool> checkout() async {
    setIsLoading = true;

    final response = await dio
        .post(Urls.baseUrl + Urls.checkoutUrl, data: orderModelToJson(_order))
        .then((value) {
      //Status code 200

      var result = ResultModel.fromJson(value.data);
      print(value.data.toString());

      if (result.success == true) {
        setCheckoutDone = true;
        print(result.message);
      } else {
        print(result.message);
      }
      notifyListeners();
    }).catchError((onError) {
      //Status code !=200
      print(onError);
    });
    setIsLoading = false;
    return getCheckoutDone;
  }

  //clear Order

  clearOrder() {
    setCheckoutDone = false;
    _order.subTotal = 0;
    _order.total = 0;
    _order.items!.clear();
    notifyListeners();
  }
}
