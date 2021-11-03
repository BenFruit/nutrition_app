import 'package:beatuful_bmi_calculator/page_of_result.dart';
import 'package:flutter/material.dart';
import 'package:beatuful_bmi_calculator/input_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xFF0A0D22),
          scaffoldBackgroundColor: Color(0xFF090C20)),
      /*routes: {
        '/': (context) => InputPage(),
        'results': (context) => ResultPage(),
      },*/
      home: InputPage(),
    );
  }
}
