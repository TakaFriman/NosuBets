import 'package:bets_app/models/my_bets_card_model.dart';
import 'package:bets_app/models/screen_utils.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  CardBetsModel? attraction;

  EventCard({Key? key, this.attraction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Utils.colorGrad1, Utils.colorGrad2]),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  offset: Offset.infinite,
                  color: Utils.kPrimaryLightColor.withOpacity(0.9))
            ]),
        child: SizedBox(
            height: 160,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        attraction!.name!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SizedBox(
                            child: Text(
                              attraction!.betView!,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SizedBox(
                            child: Text(
                              attraction!.dataBet!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          child: Text(
                            '№${attraction!.idBet!.toString()}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    attraction!.statusBet == false
                        ? Container(
                            margin: const EdgeInsets.all(7),
                            child: const Divider(
                              height: 15,
                              thickness: 5,
                              indent: 1,
                              endIndent: 0,
                              color: Colors.grey,
                            ),
                          )
                        : attraction!.winLose == true
                            ? Container(
                                margin: const EdgeInsets.all(7),
                                child: const Divider(
                                  height: 15,
                                  thickness: 5,
                                  indent: 1,
                                  endIndent: 0,
                                  color: Colors.green,
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.all(7),
                                child: const Divider(
                                  height: 15,
                                  thickness: 5,
                                  indent: 1,
                                  endIndent: 0,
                                  color: Colors.red,
                                ),
                              ),
                    SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Сумма:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                attraction!.betAmount!.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              const Text(
                                'Коэффициент:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                attraction!.ratio!.toString(),
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              attraction!.statusBet == false
                                  ? const Text(
                                      'Возможный выйгрыш:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  : attraction!.winLose == true
                                      ? const Text(
                                          'Выйгрыш:',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      : const Text(
                                          'Ставка не сыграла',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                              attraction!.winLose! == true
                                  ? Text(
                                      attraction!.winAmount!.toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  : const Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )));
  }
}
