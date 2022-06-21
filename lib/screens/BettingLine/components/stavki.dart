import 'package:bets_app/screens/BettingLine/components/stavki_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Stavki extends StatelessWidget {
  const Stavki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          '...',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BodyStavki(),
    );
  }
}
