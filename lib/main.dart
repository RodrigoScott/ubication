import 'package:flutter/material.dart';
import 'UI/home_page.dart';


void main() =>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Validation',
      initialRoute: 'homepage',
      routes: {
        'homepage'        : (BuildContext context) => HomePage(),
      },
    );
  }
}