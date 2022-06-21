import 'package:bets_app/components/background_screens.dart';
import 'package:bets_app/models/my_bets_card_model.dart';
import 'package:bets_app/screens/MyBets/components/card_bets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/api_codeforces.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contests = Provider.of<ApiProvider>(context).betsContests;
    return Background(
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            child: Container(
                decoration: const BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: cardList.length,
                              itemBuilder: (context, index) {
                                CardBetsModel attr = cardList[index];
                                return GestureDetector(
                                    onTap: null,
                                    child: EventCard(attraction: attr));
                              }))
                    ]))));
  }
}
