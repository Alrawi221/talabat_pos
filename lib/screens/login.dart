import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:talabat_pos/utils/color.dart';
import 'package:talabat_pos/utils/images.dart';
import 'package:talabat_pos/utils/spaces.dart';
import 'package:talabat_pos/utils/styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
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
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Login",
                    style: StylesApp.titleStyle,
                  ),
                  Text(
                    "hi, user Please Login to continue",
                    style: StylesApp.titleDescStyle,
                  ),
                  Container(
                    color: Colors.amber,
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

                        TextFormField(
                          
                        )
                      ],
                    ),
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
