import 'package:adam_sandler/pages/movies.dart';
import 'package:adam_sandler/pages/person_main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "AppSandler",
        theme: ThemeData(
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            primarySwatch: Colors.red,
            buttonTheme: const ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            )),
        home: const MoviePage());
  }
}
