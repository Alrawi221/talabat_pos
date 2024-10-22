import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:talabat_pos/routes/route.dart';
import 'package:talabat_pos/screens/home.dart';
import 'package:talabat_pos/screens/login.dart';
import 'package:talabat_pos/services/category_service.dart';
import 'package:talabat_pos/services/item_service.dart';
import 'package:talabat_pos/services/login_service.dart';
import 'package:talabat_pos/services/order_service.dart';



Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemService()),
        ChangeNotifierProvider(create: (_) => CategoryService()),
        ChangeNotifierProvider(create: (_) => LoginService()),
        ChangeNotifierProvider(create: (_) => OrderService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        onGenerateRoute: OnGenerateRoute.generateRoute,
      ),
    );
  }
}
