import 'package:bets_app/screens/Profile/screens/Stocks/Components/background_stocks.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundStocks(
        child: Column(
      children: const [
        SizedBox(
          height: 100,
        ),
        Text(
          "Пока нет доступных акций",
          style: TextStyle(
              color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
        )
      ],
    ));
  }
}
