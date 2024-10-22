import 'package:clay_containers/clay_containers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabat_pos/screens/home.dart';

import 'package:talabat_pos/services/login_service.dart';
import 'package:talabat_pos/utils/color.dart';
import 'package:talabat_pos/utils/images.dart';
import 'package:talabat_pos/utils/spaces.dart';
import 'package:talabat_pos/utils/styles.dart';

import '../models/login_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var loginService = Provider.of<LoginService>(
      context,
    );
    return Scaffold(
      body: Row(
        children: [
          //left
          Expanded(
            flex: 4,
            child: Container(
              color: Color(0xffEAFAFF),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpacesApp.spaceH_50,
                  SpacesApp.spaceH_50,
                  Image.asset(
                    ImageApp.logo,
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  SpacesApp.spaceH_50,
                  SpacesApp.spaceH_20,
                  ClayContainer(
                    spread: 1,
                    borderRadius: 10,
                    parentColor: AppColors.primaryColor,
                    //surfaceColor: AppColors.primaryColor,
                    /*   decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.primaryColor)), */
                    child: Image.asset(
                      ImageApp.posLogo,
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //right
          Expanded(
            flex: 7,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Login",
                    style: StylesApp.titleStyle,
                  ),
                  Text(
                    "hi, user Please Login to continue",
                    style: StylesApp.titleDescStyle,
                  ),

                  /////////////////////////////////////
                  Container(
                    // color: Colors.amber,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      /*    mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start, */
                      children: [
                        Text(
                          "User Name",
                          style: StylesApp.normalStyle,
                        ),
                        SpacesApp.spaceH_10,
                        TextFormField(
                          controller: username,
                          decoration: InputDecoration(
                            hintText: "UserName",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                )),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        SpacesApp.spaceH_10,
                        Text(
                          "Password",
                          style: StylesApp.normalStyle,
                        ),
                        SpacesApp.spaceH_10,
                        TextFormField(
                          controller: password,
                          decoration: InputDecoration(
                            hintText: "Password",
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(
                                  color: AppColors.primaryColor,
                                )),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //SpacesApp.spaceH_20,
///////////////////////////////////////////
                  loginService.getIsloading
                      ? CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        )
                      : FilledButton(
                          onPressed: () async {
                            loginService.setisLoading = true;

                            var res = await loginService.login(LoginPost(
                                userName: username.text,
                                password: password.text));
                            if (res == true) {
                              Navigator.of(context)
                                  .pushReplacementNamed('/Home');
                            } else {
                              loginService.setisLoading = false;

                              print("wrong");
                            }
                          },
                          child: const Text("Login"),
                          style: FilledButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.1),
                            backgroundColor: AppColors.primaryColor,
                          ),
                        ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.desktop_mac_rounded,
                          color: AppColors.theirdColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.tablet_android,
                          color: AppColors.theirdColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.language,
                          color: AppColors.theirdColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.sync,
                          color: AppColors.theirdColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              // width: MediaQuery.of(context).size.width * 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
