import 'package:bets_app/components/custom_bottom_nav_bar.dart';
import 'package:bets_app/models/enums.dart';
import 'package:bets_app/provider/api_codeforces.dart';
import 'package:bets_app/screens/BettingLine/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LinePage extends StatefulWidget {
  const LinePage({Key? key}) : super(key: key);
  static String routeName = "/line";

  @override
  State<LinePage> createState() => _LinePageState();
}

class _LinePageState extends State<LinePage> {
  @override
  void initState() {
    Provider.of<ApiProvider>(context, listen: false).getContests();
    Provider.of<ApiProvider>(context, listen: false).getResultPlayers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text(
            'Линия',
            style: TextStyle(color: Colors.black),
          ),
        ),
        bottomNavigationBar: const CustomBotNavBar(
          selectedMenu: MenuState.line,
        ),
        body: Body(),
      );
}
