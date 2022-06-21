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
            'Мне нечего вам рассказать об этой компании...',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
