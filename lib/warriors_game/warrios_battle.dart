import 'dart:math';

import 'package:everything_in_one/warriors_game/preparing_warrios_battle.dart';
import 'package:flutter/material.dart';

import 'winner_loser_widget.dart';

class Worrior {
  final int health;

  final String name;

  Worrior(this.health, this.name);
}

List<Warrior> listOfWinner = [];
List<Warrior> listOfLoser = [];

class WarriosBattleWidget extends StatefulWidget {
  final List<Warrior> teamListA;
  final List<Warrior> teamListB;
  const WarriosBattleWidget(
      {super.key, required this.teamListA, required this.teamListB});

  @override
  State<WarriosBattleWidget> createState() => _WarriosBattleWidgetState();
}

class _WarriosBattleWidgetState extends State<WarriosBattleWidget> {
  int loserHealth = 0;
  String loserName = "";
  var winnerTeam = "";

  @override
  initState() {
    super.initState();

    _navigateToWidgets();
  }

  @override
  void dispose() {
    super.dispose();

    listOfLoser.clear();
    listOfWinner.clear();
  }

  void _navigateToWidgets() async {
    await Future.delayed(const Duration(seconds: 1));

    final navigator = Navigator.of(context);

    if (widget.teamListA.isEmpty || widget.teamListB.isEmpty) {
      navigator.pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => BattleWinnerWidget(
                listOfLoser: listOfLoser,
                listOfWinner: listOfWinner,
                winnerTeam: winnerTeam,
              )));
    } else {
      navigator.push(MaterialPageRoute(
        builder: (BuildContext context) => WarriosBattleWidget(
            teamListA: widget.teamListA, teamListB: widget.teamListB),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    var itemAWidgets = <Widget>[];
    var itemBWidgets = <Widget>[];

    if (widget.teamListA.isNotEmpty && widget.teamListB.isNotEmpty) {
      if (widget.teamListA.first.health > widget.teamListB.first.health) {
        var winnerHealth =
            widget.teamListA.first.health - widget.teamListB.first.health;
        var winnerName = widget.teamListA.first.name;

        loserName = widget.teamListB.first.name;
        loserHealth = widget.teamListB.first.health;

        widget.teamListB.removeAt(0);
        widget.teamListA.removeAt(0);
        widget.teamListA.insert(0, Warrior(winnerHealth, winnerName));

        listOfWinner.clear();
        listOfWinner.add(Warrior(winnerHealth, winnerName));
        winnerTeam = "Team A";
        listOfLoser.add(Warrior(loserHealth, loserName));
      } else {
        var winnerHealth =
            widget.teamListB.first.health - widget.teamListA.first.health;
        var winnerName = widget.teamListB.first.name;

        loserName = widget.teamListA.first.name;
        loserHealth = widget.teamListA.first.health;
        widget.teamListA.removeAt(0);
        widget.teamListB.removeAt(0);
        widget.teamListB.insert(0, Warrior(winnerHealth, winnerName));

        listOfWinner.clear();
        listOfWinner.add(Warrior(winnerHealth, winnerName));
        winnerTeam = "Team B";
        listOfLoser.add(Warrior(loserHealth, loserName));
      }
    }

    for (var element in widget.teamListA) {
      var ownWidget = TeamWidget(
        warrior: element,
        colorTeam: const Color.fromRGBO(254, 214, 214, 1),
      );
      itemAWidgets.add(ownWidget);
    }

    for (var element in widget.teamListB) {
      var ownWidget = TeamWidget(
        warrior: element,
        colorTeam: const Color.fromRGBO(254, 214, 214, 1),
      );
      itemBWidgets.add(ownWidget);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [const Text("Team A"), ...itemAWidgets]),
                  Column(children: [const Text("Team B"), ...itemBWidgets]),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text("The battle in progress..."),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Text("Dead warriors:"),
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
                        Text(loserHealth.toString()),
                        Text(loserName),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
