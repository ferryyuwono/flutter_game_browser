import 'package:feature_home/src/widget/game_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String screenKey = 'screen.home';

  const HomePage() : super(key: const Key(HomePage.screenKey));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Playstation 5 Games Browser"),
      ),
      body: const SafeArea(
        child: GameList(),
      ),
    );
  }
}
