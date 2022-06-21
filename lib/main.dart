import 'package:bets_app/components/background_screens.dart';
import 'package:bets_app/models/routes.dart';
import 'package:bets_app/models/theme.dart';
import 'package:bets_app/provider/api_codeforces.dart';
import 'package:bets_app/screens/BettingLine/line_page.dart';
import 'package:bets_app/screens/Welcome/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/screen_utils.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ApiProvider()),
    ],
    child: MaterialApp(
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (
            ctx,
            userSnapshot,
          ) {
            if (userSnapshot.hasData) {
              return LinePage();
            }
            return WelcomePage();
          }),
      routes: routes,
      debugShowCheckedModeBanner: false,
      theme: theme(),
    ),
  ));
}

class MainPage extends StatefulWidget {
  static String routeName = "/main";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Utils.welcomeColor,
        body: Background(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.width * 0.7,
                  width: size.width * 0.7,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child:
                        Image.asset(Utils.logoImage, width: 150, height: 150),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
