class CardBetsModel {
  final String? idBet;
  final String? dataBet;
  final String? name;
  final String? betView;
  final double? betAmount;
  final double? ratio;
  final bool? winLose;
  final double? winAmount;
  final bool? statusBet;

  CardBetsModel({
    this.statusBet,
    this.idBet,
    this.dataBet,
    this.name,
    this.betView,
    this.betAmount,
    this.ratio,
    this.winLose,
    this.winAmount,
  });
}

final List<CardBetsModel> cardList = [
  CardBetsModel(
    idBet: '1700',
    dataBet: "19.06.2022 12:05",
    name: 'Codeforces Round #802 (Div. 2)',
    betView: "Одинар",
    betAmount: 100,
    ratio: 2.5,
    winLose: true,
    winAmount: 100 * 2.5,
    statusBet: true,
  ),
  CardBetsModel(
    idBet: '1698',
    dataBet: "21.06.2022 12:45",
    name: 'Codeforces Round #802 (Div. 3)',
    betView: "Одинар",
    betAmount: 500,
    ratio: 2.5,
    winLose: true,
    winAmount: 500 * 2.5,
    statusBet: true,
  ),
  CardBetsModel(
    idBet: '1700',
    dataBet: "16.06.2022 17:00",
    name: 'Codeforces Round #800 (Div. 2)',
    betView: "Одинар",
    betAmount: 300,
    ratio: 2.5,
    winLose: true,
    winAmount: 300 * 2.5,
    statusBet: false,
  ),
  CardBetsModel(
    idBet: '1689',
    dataBet: "14.06.2022 17:00",
    name: 'Codeforces Round #798 (Div. 3)',
    betView: "Одинар",
    betAmount: 1000,
    ratio: 5.0,
    winLose: false,
    winAmount: 1000 * 2.5,
    statusBet: true,
  ),
];
