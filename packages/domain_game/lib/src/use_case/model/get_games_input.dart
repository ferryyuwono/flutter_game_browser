abstract class GetGamesInput {
  GetGamesInput();
}

class GetGamesInitialized extends GetGamesInput {
  final DateTime startDate;
  final DateTime endDate;

  GetGamesInitialized({
    required this.startDate,
    required this.endDate,
  });
}

class GetGamesLoadMore extends GetGamesInput {
  GetGamesLoadMore();
}
