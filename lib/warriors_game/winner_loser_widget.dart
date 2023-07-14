import 'package:everything_in_one/warriors_game/preparing_warrios_battle.dart';
import 'package:flutter/material.dart';

class BattleWinnerWidget extends StatelessWidget {
  List<Warrior> listOfWinner;
  List<Warrior> listOfLoser;
  String winnerTeam;
  BattleWinnerWidget({
    super.key,
    required this.listOfLoser,
    required this.listOfWinner,
    required this.winnerTeam,
  });

  @override
  Widget build(BuildContext context) {
    var listWidgets = <Widget>[];
    var name = listOfWinner[0].name;
    var health = listOfWinner[0].health;

    void navigateToPreparingBattle() {
      final navigator = Navigator.of(context);
      navigator.push(MaterialPageRoute(
          builder: (BuildContext context) =>
              const PreparingWarriosBattleWidget()));
    }

    for (var element in listOfLoser) {
      var ownWidget = TeamWidget(
        warrior: element,
        colorTeam: const Color.fromRGBO(254, 214, 214, 1),
      );
      listWidgets.add(ownWidget);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("The winner is $name  from $winnerTeam"),
                Container(
                  margin: const EdgeInsets.all(10),
                  // color: myColor,
                  width: 120,
                  height: 57,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color: Color.fromRGBO(254, 214, 214, 1),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name),
                      Text(health.toString()),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(300, 20)),
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(20.0)),
                    foregroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(
                            color: Colors.black,
                          )),
                    ),
                  ),
                  onPressed: navigateToPreparingBattle,
                  child: const Text("Play again?"),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Dead warriors:"),
                Column(children: listWidgets),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamWidget extends StatelessWidget {
  final Warrior warrior;
  final Color colorTeam;

  const TeamWidget({required this.warrior, required this.colorTeam});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        // color: myColor,
        width: 120,
        height: 57,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color.fromRGBO(254, 214, 214, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(warrior.name),
            Text(warrior.health.toString()),
          ],
        ));
  }
}
