// ignore_for_file: deprecated_member_use

import 'package:bets_app/models/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenuUnRegistr extends StatelessWidget {
  const ProfileMenuUnRegistr({
    Key? key,
    required this.text,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      child: FlatButton(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Utils.kPrimaryLightColor,
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 24,
                color: Utils.kPrimaryColor,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_sharp),
            ],
          )),
    );
  }
}
