import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tradarutest/detail.dart';
import 'package:tradarutest/home.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.routeName:
        return MaterialPageRoute(builder: (_) => HomePage());
      case DetailPage.routeName:
        var cart = settings.arguments;
        return MaterialPageRoute(builder: (_) => DetailPage(cart: cart));
      default :
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}