import 'dart:math';

class WarriorGameState {
  bool isGameStarted = false;
  bool isGameFinished = false;
  List<Warrior> teamA = [];
  List<Warrior> teamB = [];
  List<Warrior> listOfWinner = [];
  List<Warrior> listOfLoser = [];

  WarriorGameState() {
    teamA = _generateTeam("Team A");
    teamB = _generateTeam("Team B");
  }

  void nextRound() {
    if (teamA.isNotEmpty && teamB.isNotEmpty) {
      if (teamA.first.health >= teamB.first.health) {
        var winnerHealth = teamA.first.health - teamB.first.health;
        var winnerName = teamA.first.name;

        final loserName = teamB.first.name;
        final loserHealth = teamB.first.health;

        teamB.removeAt(0);
        teamA.removeAt(0);
        teamA.insert(0, Warrior(winnerHealth, winnerName, "Team A"));

        listOfWinner.clear();
        listOfWinner.add(Warrior(winnerHealth, winnerName, "Team A"));

        listOfLoser.add(Warrior(loserHealth, loserName, "Team B"));
      } else {
        var winnerHealth = teamB.first.health - teamA.first.health;
        var winnerName = teamB.first.name;

        final loserName = teamA.first.name;
        final loserHealth = teamA.first.health;

        teamA.removeAt(0);
        teamB.removeAt(0);
        teamB.insert(0, Warrior(winnerHealth, winnerName, "Team B"));

        listOfWinner.clear();
        listOfWinner.add(Warrior(winnerHealth, winnerName, "Team B"));

        listOfLoser.add(Warrior(loserHealth, loserName, "Team A"));
      }
    } else {
      isGameFinished = true;
    }
  }
}

class Warrior {
  final int health;
  final String name;
  final String team;

  Warrior(this.health, this.name, this.team);
}

List<Warrior> _generateTeam(String teamName) {
  List<Warrior> team = [];
  final randomTeam = Random().nextInt(2) + 3;

  for (var i = 0; i < randomTeam; i++) {
    final randomHealth = Random().nextInt(50) + 50;
    int countTeam = i + 1;
    var worrier = "Worrier $countTeam";
    team.add(Warrior(randomHealth, worrier, teamName));
  }

  return team;
}
