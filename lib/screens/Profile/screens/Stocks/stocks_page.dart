import 'package:bets_app/screens/Profile/screens/Stocks/Components/body.dart';
import 'package:flutter/material.dart';

class StocksPage extends StatelessWidget {
  const StocksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Акции и промокоды",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Body(),
    );
  }
}
