class FeaturePath {
  static const dashboard = '/dashboard';
  static const games = '/games';
  static const gameIdPath = "gameId";
  static const gameDetail = '/game/:$gameIdPath';
  static String createGamePath(int gameId) => '/game/$gameId';
}