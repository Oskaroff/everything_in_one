import 'dart:math';

class WarriorGameState {
  bool isGameStarted = false;
  bool isGameFinished = false;
  List<Warrior> teamA = [];
  List<Warrior> teamB = [];
  // List<Warrior> listOfWinner = [];
  List<Warrior> listOfLoser = [];

  WarriorGameState() {
    teamA = _generateTeam();
    teamB = _generateTeam();
  }

  void nextRound() {
    if (teamA.isNotEmpty && teamB.isNotEmpty) {
      if (teamA.first.health >= teamB.first.health) {
        var winnerHealth = teamA.first.health - teamB.first.health;
        var winnerName = teamA.first.name;

        teamB.removeAt(0);
        teamA.removeAt(0);
        teamA.insert(0, Warrior(winnerHealth, winnerName));

        // listOfWinner.clear();
        // listOfWinner.add(Warrior(winnerHealth, winnerName));
        final loserName = teamB.first.name;
        final loserHealth = teamB.first.health;
        listOfLoser.add(Warrior(loserHealth, loserName));
      } else {
        var winnerHealth = teamB.first.health - teamA.first.health;
        var winnerName = teamB.first.name;

        teamA.removeAt(0);
        teamB.removeAt(0);
        teamB.insert(0, Warrior(winnerHealth, winnerName));

        // listOfWinner.clear();
        // listOfWinner.add(Warrior(winnerHealth, winnerName));
        final loserName = teamA.first.name;
        final loserHealth = teamA.first.health;
        listOfLoser.add(Warrior(loserHealth, loserName));
      }
    } else {
      isGameFinished = true;
    }
  }
}

class Warrior {
  final int health;
  final String name;

  Warrior(this.health, this.name);
}

List<Warrior> _generateTeam() {
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
