import 'package:flutter/material.dart';
import '../warriors_game/preparing_warrios_battle.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  void onPressed() {
    final navigator = Navigator.of(context);
    navigator.push(MaterialPageRoute(
        builder: (BuildContext context) =>
            const PreparingWarriosBattleWidget()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
