import 'dart:async';
import 'dart:math';
import 'package:everything_in_one/warriors_game/warrios_battle.dart';
import 'package:flutter/material.dart';

class Warrior {
  final int health;
  final String name;

  Warrior(this.health, this.name);
}

List<Warrior> generateTeam() {
  List<Warrior> team = [];
  final randomTeam = Random().nextInt(2) + 3;

  for (var i = 0; i < randomTeam; i++) {
    final randomHealth = Random().nextInt(50) + 50;
    int countTeam = i + 1;
    var worrier = "Worrier $countTeam";
    team.add(Warrior(randomHealth, worrier));
  }

  return team;
}

List<Warrior> teamA = [];
List<Warrior> teamB = [];

class PreparingWarriosBattleWidget extends StatefulWidget {
  const PreparingWarriosBattleWidget({super.key});

  @override
  State<PreparingWarriosBattleWidget> createState() =>
      _PreparingWarriosBattleWidgetState();
}

class _PreparingWarriosBattleWidgetState
    extends State<PreparingWarriosBattleWidget> {
  @override
  initState() {
    super.initState();
    _navigateToWarriosBattleWidget();
  }

  void _navigateToWarriosBattleWidget() async {
    await Future.delayed(const Duration(seconds: 2));
    final navigator = Navigator.of(context);
    navigator.push(
      MaterialPageRoute(
        builder: (BuildContext context) => WarriosBattleWidget(
          teamListA: teamA,
          teamListB: teamB,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var itemAWidgets = <Widget>[];
    var itemBWidgets = <Widget>[];

    teamA = generateTeam();
    teamB = generateTeam();

    for (var element in teamA) {
      var ownWidget = TeamWidget(
        warrior: element,
        colorTeam: const Color.fromRGBO(217, 217, 217, 1),
      );
      itemAWidgets.add(ownWidget);
    }

    for (var element in teamB) {
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
      ),
    );
  }
}
