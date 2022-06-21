import 'package:bets_app/models/screen_utils.dart';
import 'package:bets_app/screens/Profile/components/background_profile.dart';
import 'package:bets_app/screens/Profile/components/profile_menu.dart';
import 'package:bets_app/screens/Profile/screens/InfoCompany/company_info_page.dart';
import 'package:bets_app/screens/Profile/screens/Support/support_page.dart';
import 'package:bets_app/screens/Profile/screens/Stocks/stocks_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../Welcome/welcome_page.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return BackgroundProfile(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10), //10
                height: 10 * 14, //140
                width: 10 * 14,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Utils.kPrimaryLightColor,
                    width: 10 * 0.4, //8
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/avatar.jpg'),
                  ),
                ),
              ),
              Text(
                'Tester',
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 5),
              Text(
                'test@test.ru',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black45,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 20),
              ProfileMenuUnRegistr(
                icon: "assets/icons/stocks.svg",
                text: "Акции и промокоды",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return StocksPage();
                      },
                    ),
                  );
                },
              ),
              ProfileMenuUnRegistr(
                icon: "assets/icons/support.svg",
                text: "Поддержка",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SupportPage();
                      },
                    ),
                  );
                },
              ),
              ProfileMenuUnRegistr(
                icon: "assets/icons/info.svg",
                text: "О компании",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CompanyInfoPage();
                      },
                    ),
                  );
                },
              ),
              ProfileMenuUnRegistr(
                icon: "assets/icons/exit.svg",
                text: "Выйти",
                press: () {
                  FirebaseAuth.instance.signOut();
                  FirebaseAuth.instance.idTokenChanges().listen((User? user) {
                    if (user == null) {
                      Navigator.pushReplacementNamed(
                          context, WelcomePage.routeName);
                    }
                  });
                },
              ),
              const SizedBox(height: 10),
              const Text(
                "Версия 0.0",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
