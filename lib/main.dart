import 'package:flutter/material.dart';
import 'home_page.dart';
import 'result_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'مبدل ارز',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/result': (context) => ResultPage(
          amount: 0.0,
          fromCurrency: '',
          toCurrency: '', convertedAmount: 0,
        ),
      },
    );
  }
}
