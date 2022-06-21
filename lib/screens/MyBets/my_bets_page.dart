import 'package:bets_app/components/custom_bottom_nav_bar.dart';
import 'package:bets_app/models/enums.dart';
import 'package:bets_app/screens/MyBets/components/body.dart';
import 'package:flutter/material.dart';

class MyBetsPage extends StatelessWidget {
  const MyBetsPage({Key? key}) : super(key: key);
  static String routeName = "/myBets";
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Мои ставки',
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: const CustomBotNavBar(
          selectedMenu: MenuState.myBets,
        ),
        body: Body(),
      );
}
