import 'package:astha_it_assessment/core/route/route_name.dart';
import 'package:flutter/material.dart';


import '../../presentation/book/book_list/view/book_list_screen.dart';
import '../../presentation/splash/view/splash_screen.dart';



class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutesName.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
         case RoutesName.bookListScreen:
        return MaterialPageRoute(builder: (_) => const BookListScreen());
   

      default:
        return unDefineRoute();
    }
  }

  static Route<dynamic> unDefineRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: Text("No Route Found")),
        body: Center(child: Text("No Route Found")),
      ),
    );
  }
}
