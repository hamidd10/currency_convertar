import 'package:currency_convertar/result_page.dart';
import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart'; // Import the package

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _amount = 1.0;
  String _fromCurrency = 'USD';
  String _toCurrency = 'EUR';

  // Map currency codes to country codes for flags
  final Map<String, String> _currencyToCountry = {
    'USD': 'US', // United States
    'EUR': 'EU', // European Union
    'GBP': 'GB', // United Kingdom
    'JPY': 'JP', // Japan
    'AFN': 'AF', // Afghanistan
    'IRR': 'IR', // Iran
    'PKR': 'PK', // Pakistan
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('مبدل ارز - صفحه اصلی'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'مبلغ'),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  _amount = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _fromCurrency,
              items: ['USD', 'EUR', 'GBP', 'JPY', 'AFN', 'IRR', 'PKR'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      CountryIcons.getSvgFlag(_currencyToCountry[value]!), // Flag icon
                      SizedBox(width: 10),
                      Text(value), // Currency code
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _fromCurrency = value!;
                });
              },
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _toCurrency,
              items: ['USD', 'EUR', 'GBP', 'JPY', 'AFN', 'IRR', 'PKR'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      CountryIcons.getSvgFlag(_currencyToCountry[value]!), // Flag icon
                      SizedBox(width: 10),
                      Text(value), // Currency code
                    ],
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _toCurrency = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      amount: _amount,
                      fromCurrency: _fromCurrency,
                      toCurrency: _toCurrency, convertedAmount: 0,
                    ),
                  ),
                );
              },
              child: Text('تبدیل و نمایش نتیجه'),
            ),
          ],
        ),
      ),
    );
  }
}