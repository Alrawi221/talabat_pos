import 'package:flutter/material.dart';
import 'package:talabat_pos/routes/route_list.dart';
import 'package:talabat_pos/screens/home.dart';
import 'package:talabat_pos/screens/login.dart';

import '../widgets/error_screen.dart';

class OnGenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    final parm = routeSettings.arguments;
    switch (routeSettings.name) {
      case RouteList.home:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => const HomeScreen());
      case RouteList.login:
        return MaterialPageRoute(
            settings: routeSettings, builder: (_) => const LoginScreen());
      default:
        return errorPage(routeSettings);
    }
  }

  static Route<dynamic> errorPage(RouteSettings routeSttings) {
    return MaterialPageRoute(builder: (_) => ErrorScreen());
  }
}
