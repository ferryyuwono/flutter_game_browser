import 'package:flutter/material.dart';
import 'package:game_browser/game_browser.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //late final _pagingController = CommonPagingController<User>()
  //  ..disposeBy(disposeBag);
  late final HomeBloc homeBloc = GetIt.instance.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
    homeBloc.add(const HomePageInitiated());
    /*_pagingController.listen(
      onLoadMore: () => bloc.add(const GameLoadMore()),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Home Page"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Name : Test",style: TextStyle(fontSize: 22),),
            ],
          ),
        ),
      ),
    );
  }
}
