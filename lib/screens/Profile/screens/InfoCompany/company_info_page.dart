import 'package:bets_app/screens/Profile/screens/InfoCompany/components/body.dart';
import 'package:flutter/material.dart';

class CompanyInfoPage extends StatelessWidget {
  const CompanyInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "О компании",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
    );
  }
}
