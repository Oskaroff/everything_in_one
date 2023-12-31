import 'package:everything_in_one/model/warrior_game_state.dart';
import 'package:everything_in_one/widget/team_warrior.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late WarriorGameState state;

  @override
  void initState() {
    super.initState();
    state = WarriorGameState();
  }

  void onPressed() async {
    setState(() {
      state.isGameStarted = true;
    });

    while (!state.isGameFinished) {
      await Future.delayed(const Duration(seconds: 1));
      state.nextRound();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: state.isGameStarted
          ? PreparingWarriorsBattleWidget(
              teamA: state.teamA,
              teamB: state.teamB,
              listOfLoser: state.listOfLoser,
              listOfWinner: state.listOfWinner,
              isGameFinished: state.isGameFinished,
              onPressed: () {
                state = WarriorGameState();
                onPressed();
              },
            )
          : _WarriorGameInitWidget(onPressed: onPressed),
    );
  }
}

class _WarriorGameInitWidget extends StatelessWidget {
  final VoidCallback? onPressed;

  const _WarriorGameInitWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Warrior’s battle",
            style: TextStyle(
              letterSpacing: 7,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(200, 20)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
              foregroundColor: MaterialStateProperty.all(Colors.black),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                      color: Colors.black,
                    )),
              ),
            ),
            onPressed: onPressed,
            child: const Text("Fight"),
          ),
        ],
      ),
    );
  }
}

class PreparingWarriorsBattleWidget extends StatelessWidget {
  final List<Warrior> teamA;
  final List<Warrior> teamB;
  final List<Warrior> listOfLoser;
  final List<Warrior> listOfWinner;
  final bool isGameFinished;
  final VoidCallback? onPressed;

  const PreparingWarriorsBattleWidget({
    super.key,
    required this.teamA,
    required this.teamB,
    required this.listOfLoser,
    required this.listOfWinner,
    required this.isGameFinished,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                if (isGameFinished)
                  WinnerWidget(
                    listOfWinner: listOfWinner,
                    onPressed: onPressed,
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          const Text("Team A"),
                          ...teamA.map(
                            (e) => TeamWarriorWidget(
                              warrior: e,
                              colorTeam: const Color.fromRGBO(217, 217, 217, 1),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Team B"),
                          ...teamB.map(
                            (e) => TeamWarriorWidget(
                              warrior: e,
                              colorTeam: const Color.fromRGBO(254, 214, 214, 1),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                if (!isGameFinished) const Text("The battle in progress..."),
                const SizedBox(
                  height: 10,
                ),
                if (listOfLoser.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Dead warriors:"),
                      ...listOfLoser.map(
                        (e) => TeamWarriorWidget(
                          warrior: e,
                          colorTeam: e.team == "Team A"
                              ? const Color.fromRGBO(217, 217, 217, 1)
                              : const Color.fromRGBO(254, 214, 214, 1),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WinnerWidget extends StatelessWidget {
  final List<Warrior> listOfWinner;
  final VoidCallback? onPressed;

  const WinnerWidget({
    super.key,
    required this.listOfWinner,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final firstWinner = listOfWinner[0];
    return Column(
      children: [
        Column(
          children: [
            Text(
              "The winner is ${firstWinner.name} from ${firstWinner.team}",
            ),
            TeamWarriorWidget(
              warrior: firstWinner,
              colorTeam: firstWinner.team == "Team A"
                  ? const Color.fromRGBO(217, 217, 217, 1)
                  : const Color.fromRGBO(254, 214, 214, 1),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(const Size(300, 20)),
            padding: MaterialStateProperty.all(const EdgeInsets.all(20.0)),
            foregroundColor: MaterialStateProperty.all(Colors.black),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
            ),
          ),
          onPressed: onPressed,
          child: const Text("Play again?"),
        ),
      ],
    );
  }
}
