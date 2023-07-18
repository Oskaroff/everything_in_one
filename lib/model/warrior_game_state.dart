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
        teamA.insert(
          0,
          Warrior(
            health: winnerHealth,
            name: winnerName,
            team: "Team A",
          ),
        );

        listOfWinner.clear();
        listOfWinner.add(Warrior(
          health: winnerHealth,
          name: winnerName,
          team: "Team A",
        ));

        listOfLoser.add(Warrior(
          health: loserHealth,
          name: loserName,
          team: "Team B",
        ));
      } else {
        var winnerHealth = teamB.first.health - teamA.first.health;
        var winnerName = teamB.first.name;

        final loserName = teamA.first.name;
        final loserHealth = teamA.first.health;

        teamA.removeAt(0);
        teamB.removeAt(0);
        teamB.insert(
            0, Warrior(health: winnerHealth, name: winnerName, team: "Team B"));

        listOfWinner.clear();
        listOfWinner.add(
            Warrior(health: winnerHealth, name: winnerName, team: "Team B"));

        listOfLoser
            .add(Warrior(health: loserHealth, name: loserName, team: "Team A"));
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

  Warrior({
    required this.health,
    required this.name,
    required this.team,
  });
}

List<Warrior> _generateTeam(String teamName) {
  List<Warrior> team = [];
  final randomTeam = Random().nextInt(5) + 7;

  for (var i = 0; i < randomTeam; i++) {
    final randomHealth = Random().nextInt(50) + 50;
    int countTeam = i + 1;
    var name = "Worrier $countTeam";
    team.add(
      Warrior(
        health: randomHealth,
        name: name,
        team: teamName,
      ),
    );
  }

  return team;
}
