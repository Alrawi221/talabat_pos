import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:talabat_pos/models/user_model.dart';
import 'package:talabat_pos/utils/url.dart';

import '../models/login_model.dart';

class LoginService with ChangeNotifier {
  Dio dio = Dio();
  bool? _isLoading = false;

  get getIsloading => _isLoading;

  set setisLoading(value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> login(LoginPost login) async {
    bool res = false;
    final response = await dio
        .post(Urls.baseUrl + Urls.loginUrl, data: loginPostToJson(login))
        .then((value) {
      //Status code 200

      var user = UserModel.fromJson(value.data);

      if (user.success == true) {
        res = true;
        print(user.data!.name);
      } else {
        print(user.message);
      }
      notifyListeners();
    }).catchError((onError) {
      //Status code !=200
      print(onError);
    });

    return res;
  }
}
