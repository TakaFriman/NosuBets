import 'package:bets_app/models/enums.dart';
import 'package:bets_app/models/screen_utils.dart';
import 'package:bets_app/screens/BettingLine/line_page.dart';
import 'package:bets_app/screens/MyBets/my_bets_page.dart';
import 'package:bets_app/screens/Profile/profile_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

bool flag = true;

class CustomBotNavBar extends StatelessWidget {
  const CustomBotNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -45),
            blurRadius: 30,
            color: const Color(0xFFDADADA).withOpacity(0.35),
          )
        ],
      ),
      child: SafeArea(
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/line.svg",
                  width: 24,
                  height: 24,
                  color: MenuState.line == selectedMenu
                      ? Utils.kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.restorablePushReplacementNamed(
                    context, LinePage.routeName),
              ),
              Text(
                "Линия",
                style: TextStyle(
                  color: MenuState.line == selectedMenu
                      ? Utils.kPrimaryColor
                      : inActiveIconColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/myBets.svg",
                  width: 24,
                  height: 24,
                  color: MenuState.myBets == selectedMenu
                      ? Utils.kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.restorablePushReplacementNamed(
                    context, MyBetsPage.routeName),
              ),
              Text(
                "Мои ставки",
                style: TextStyle(
                  color: MenuState.myBets == selectedMenu
                      ? Utils.kPrimaryColor
                      : inActiveIconColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/profile.svg",
                  width: 24,
                  height: 24,
                  color: MenuState.profile == selectedMenu
                      ? Utils.kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () => Navigator.restorablePushReplacementNamed(
                    context, ProfilePage.routeName),
              ),
              Text(
                '500р.',
                style: TextStyle(
                  color: MenuState.profile == selectedMenu
                      ? Utils.kPrimaryColor
                      : inActiveIconColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
