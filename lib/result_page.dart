import 'package:flutter/material.dart';
import 'package:country_icons/country_icons.dart'; // Import the package

class ResultPage extends StatelessWidget {
  final double amount;
  final String fromCurrency;
  final String toCurrency;
  final double convertedAmount;

  ResultPage({
    required this.amount,
    required this.fromCurrency,
    required this.toCurrency,
    required this.convertedAmount,
  });

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
        title: Text('نتیجه تبدیل ارز'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryIcons.getSvgFlag(_currencyToCountry[fromCurrency]!), // From currency flag
                SizedBox(width: 10),
                Text(
                  '$amount $fromCurrency',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 20),
            Icon(Icons.arrow_downward, size: 30),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CountryIcons.getSvgFlag(_currencyToCountry[toCurrency]!), // To currency flag
                SizedBox(width: 10),
                Text(
                  '$convertedAmount $toCurrency',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}