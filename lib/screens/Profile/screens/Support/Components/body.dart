import 'package:bets_app/screens/Profile/screens/Support/Components/background_support.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundSupport(
      child: Column(
        children: const [
          SizedBox(
            height: 120,
          ),
          Text(
            "Техническая поддержка",
            style: TextStyle(
              fontSize: 24,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            "Звонок по телефону: 89280658712",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
