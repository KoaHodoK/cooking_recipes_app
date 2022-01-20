import 'package:flutter/material.dart';
import 'package:happy_cooking_app/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Food Recipe',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.white,
            primarySwatch: Colors.amber,
            textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.white),
            )),
        home: HomePage());
  }
}
