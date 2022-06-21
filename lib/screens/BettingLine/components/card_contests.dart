import 'package:bets_app/models/my_bets_card_model.dart';
import 'package:bets_app/models/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../models/contest_item.dart';
import 'package:intl/date_symbol_data_local.dart';

class ContestCard extends StatefulWidget {
  ContestItem? attraction;
  ContestCard({Key? key, this.attraction}) : super(key: key);

  @override
  State<ContestCard> createState() => _ContestCardState();
}

class _ContestCardState extends State<ContestCard> {
  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
  }

  Widget build(BuildContext context) {
    final cont = '${int.parse(widget.attraction!.startContest!) - 259200}';
    return Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [Utils.colorGrad1, Utils.colorGrad2]),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                  blurRadius: 40,
                  offset: Offset.infinite,
                  color: Utils.kPrimaryLightColor.withOpacity(0.9))
            ]),
        child: SizedBox(
            height: 155,
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.attraction!.nameContest!,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    child: Text(
                                      'Начало: ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    child: Text(
                                      DateFormat.MEd('ru')
                                          .add_Hm()
                                          .format(DateTime
                                              .fromMillisecondsSinceEpoch(
                                                  int.parse(widget.attraction!
                                                          .startContest!) *
                                                      1000))
                                          .toString(),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Column(
                              children: [
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    child: Text(
                                      'Длительность:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: SizedBox(
                                    child: Text(
                                      '${int.parse(widget.attraction!.durationContest!) ~/ 3600} часа',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Text(
                          'Дата регистрации: ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          DateFormat.MEd('ru')
                              .add_Hm()
                              .format(DateTime.fromMillisecondsSinceEpoch(
                                  int.parse(cont) * 1000))
                              .toString(),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ],
            )));
  }
}
