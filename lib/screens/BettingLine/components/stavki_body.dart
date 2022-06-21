import 'package:bets_app/components/background_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BodyStavki extends StatelessWidget {
  const BodyStavki({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
        child: Text(
      'Регистрация на контест еще не началась...',
      style: TextStyle(fontSize: 16),
    ));
  }
}
