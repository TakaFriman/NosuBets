import 'package:bets_app/screens/Profile/screens/Support/Components/body.dart';
import 'package:flutter/material.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Поддержка",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Body(),
    );
  }
}
