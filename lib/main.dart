import 'package:flutter/material.dart';
import 'package:talabat_pos/routes/route.dart';
import 'package:talabat_pos/screens/home.dart';
import 'package:talabat_pos/screens/login.dart';

abstract class Car {}

class Bmw extends Car {}

class FixCar {
  final Car car;

  FixCar({required this.car});
}

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      onGenerateRoute:OnGenerateRoute.generateRoute ,
   
    );
  }
}
