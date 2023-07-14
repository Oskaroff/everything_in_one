import 'package:everything_in_one/model/warrior_game_state.dart';
import 'package:flutter/material.dart';

class TeamWarriorWidget extends StatelessWidget {
  final Warrior warrior;
  final Color colorTeam;

  const TeamWarriorWidget({
    super.key,
    required this.warrior,
    required this.colorTeam,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 120,
      height: 57,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: colorTeam,
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
