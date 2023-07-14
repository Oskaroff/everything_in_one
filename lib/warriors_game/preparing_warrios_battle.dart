// import 'dart:async';
// import 'dart:math';
// import 'package:everything_in_one/model/warrior_game_state.dart';
// import 'package:everything_in_one/warriors_game/warrios_battle.dart';
// import 'package:everything_in_one/widget/team_warrior.dart';
// import 'package:flutter/material.dart';
//
// class PreparingWarriorsBattleWidget extends StatefulWidget {
//   const PreparingWarriorsBattleWidget({super.key});
//
//   @override
//   State<PreparingWarriorsBattleWidget> createState() =>
//       _PreparingWarriorsBattleWidgetState();
// }
//
// class _PreparingWarriorsBattleWidgetState
//     extends State<PreparingWarriorsBattleWidget> {
//   @override
//   initState() {
//     super.initState();
//     _navigateToWarriosBattleWidget();
//   }
//
//   void _navigateToWarriosBattleWidget() async {
//     await Future.delayed(const Duration(seconds: 2));
//     final navigator = Navigator.of(context);
//     navigator.push(
//       MaterialPageRoute(
//         builder: (BuildContext context) => WarriosBattleWidget(
//           teamListA: teamA,
//           teamListB: teamB,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var itemAWidgets = <Widget>[];
//     var itemBWidgets = <Widget>[];
//
//     teamA = generateTeam();
//     teamB = generateTeam();
//
//     for (var element in teamA) {
//       var ownWidget = TeamWarriorWidget(
//         warrior: element,
//         colorTeam: const Color.fromRGBO(217, 217, 217, 1),
//       );
//       itemAWidgets.add(ownWidget);
//     }
//
//     for (var element in teamB) {
//       var ownWidget = TeamWarriorWidget(
//         warrior: element,
//         colorTeam: const Color.fromRGBO(254, 214, 214, 1),
//       );
//       itemBWidgets.add(ownWidget);
//     }
//
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           padding: const EdgeInsets.only(top: 30),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Column(children: [const Text("Team A"), ...itemAWidgets]),
//                   Column(children: [const Text("Team B"), ...itemBWidgets]),
//                 ],
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               const Text("The battle in progress..."),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
