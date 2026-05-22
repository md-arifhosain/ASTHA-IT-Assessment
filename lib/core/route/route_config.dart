import 'package:astha_it_assessment/core/route/route_name.dart';
import 'package:astha_it_assessment/presentation/book/book_details/view/book_details_screen.dart';
import 'package:flutter/material.dart';

import '../../data/models/book_list_model.dart';
import '../../presentation/book/book_list/view/book_list_screen.dart';


class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
     
      case RoutesName.bookListScreen:
        return MaterialPageRoute(builder: (_) => const BookListScreen());
      case RoutesName.bookDetailsScreen:
        final book = routeSettings.arguments as BookModel;
        return MaterialPageRoute(builder: (_) => BookDetailsScreen(book: book));

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
