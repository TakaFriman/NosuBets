import 'package:bets_app/main.dart';
import 'package:bets_app/screens/BettingLine/line_page.dart';
import 'package:bets_app/screens/MyBets/my_bets_page.dart';
import 'package:bets_app/screens/Profile/profile_page.dart';
import 'package:bets_app/screens/Welcome/welcome_page.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LinePage.routeName: (context) => LinePage(),
  MyBetsPage.routeName: (context) => MyBetsPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
  MainPage.routeName: (context) => MainPage(),
  WelcomePage.routeName: (context) => WelcomePage(),
};
