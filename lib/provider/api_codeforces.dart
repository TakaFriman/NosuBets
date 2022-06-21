import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/contest_item.dart';
import '../models/contest_players.dart';
import '../models/my_bets_card_model.dart';

class ApiProvider with ChangeNotifier {
  final List<ContestItem> _contests = [];

  List<ContestItem> get contests {
    return _contests;
  }

  final List<CardBetsModel> _resultBets = [];
  List<CardBetsModel> get betsContests {
    return _resultBets;
  }

  final List<ContestPlayer> _resultsContest = [];
  List<ContestPlayer> get result {
    return _resultsContest;
  }

  Future<String> getContests() async {
    try {
      final url = Uri.https('codeforces.com', 'api/contest.list');

      final response = await http.get(url);
      final jsonData = jsonDecode(response.body)['result'];
      for (int i = 0; i < 10; i++) {
        if (jsonData[i]['phase'].toString() != 'FINISHED') {
          _contests.add(ContestItem(
              idContest: jsonData[i]['id'].toString(),
              nameContest: jsonData[i]['name'],
              typeContest: jsonData[i]['type'],
              durationContest: jsonData[i]['durationSeconds'].toString(),
              startContest: jsonData[i]['startTimeSeconds'].toString(),
              registrDataContest:
                  jsonData[i]['relativeTimeSeconds'].toString()));
        }
      }
      notifyListeners();
    } catch (error) {
      print(error);
      return 'Failure';
    }
    return 'Success';
  }

  Future<String> getResultPlayers() async {
    try {
      for (int j = 1; j < 11; j++) {
        var url = Uri(
            scheme: 'https',
            host: 'codeforces.com',
            path: '/api/contest.standings',
            queryParameters: {
              'contestId': _contests[j].idContest,
              'from': '1',
              'count': '10'
            });
        print(url);
        final response = await http.get(url);
        final jsonData = jsonDecode(response.body)['result']['rows'];

        for (int i = 0; i < 10; i++) {
          print(jsonData[i]['rank'].toString());
          print(jsonData[i]['points'].toString());
          print(jsonData[i]['party']['members'][i]['handle']);
          _resultsContest.add(ContestPlayer(
            namePlayer: jsonData[i]['handle'].toString(),
            rankPlayer: jsonData[i]['rank'].toString(),
            pointsPlayer: jsonData[i]['points'].toString(),
          ));
        }
      }
    } catch (error) {
      print(error);
      return 'Failure';
    }
    return 'Success';
  }
}
