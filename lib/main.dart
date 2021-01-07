import 'package:flutter/material.dart';
import 'package:tradarutest/home.dart';
import 'package:tradarutest/route.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: CustomRouter.generateRoute,
      initialRoute: HomePage.routeName,
    );
  }
}


