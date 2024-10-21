import 'package:dio/dio.dart';
import 'package:talabat_pos/models/user_model.dart';

import '../models/login_model.dart';

class LoginService {
  Dio dio = Dio();

  Future<bool> login(LoginPost login) async {
    bool res = false;
    final response = await dio
        .post(
            "https://mdev.yemensoft.net:473/Flutterexercise/api/v1/User/Login",
            data: loginPostToJson(login))
        .then((value) {
      //Status code 200

      var user = UserModel.fromJson(value.data);

      if (user.success == true) {
        res = true;
        print(user.data!.name);
      } else {
        print(user.message);
      }
    }).catchError((onError) {
      //Status code !=200
      print(onError);
    });

    return res;
  }
}
