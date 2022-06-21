import 'package:bets_app/components/custom_bottom_nav_bar.dart';
import 'package:bets_app/models/enums.dart';
import 'package:bets_app/screens/Profile/components/body.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Профиль",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Body(),
      bottomNavigationBar: const CustomBotNavBar(
        selectedMenu: MenuState.profile,
      ),
    );
  }
}
