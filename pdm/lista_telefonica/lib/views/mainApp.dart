import 'package:flutter/material.dart';
import 'package:lista_telefonica/page/homePage.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lista Telefónica',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: HomePage());
  }
}
