import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResultPage extends StatefulWidget {
  final double amount;
  final String fromCurrency;
  final String toCurrency;

  ResultPage({
    required this.amount,
    required this.fromCurrency,
    required this.toCurrency,
  });

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double _convertedAmount = 0.0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _convertCurrency();
  }

  Future<void> _convertCurrency() async {
    setState(() {
      _isLoading = true;
    });

    final String apiKey = 'YOUR_API_KEY'; // کلید API خود را اینجا وارد کنید
    final String apiUrl = 'https://api.exchangerate-api.com/v4/latest/${widget.fromCurrency}';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final double rate = data['rates'][widget.toCurrency];
      setState(() {
        _convertedAmount = widget.amount * rate;
        _isLoading = false;
      });
    } else {
      throw Exception('خطا در دریافت نرخ ارز');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('نتیجه تبدیل ارز'),
      ),
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : Text(
          '${widget.amount} ${widget.fromCurrency} = $_convertedAmount ${widget.toCurrency}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}