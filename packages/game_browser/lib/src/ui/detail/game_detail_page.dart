import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_browser/game_browser.dart';
import 'package:get_it/get_it.dart';

class GameDetailPage extends StatefulWidget {
  final int gameId;
  static const String screenKey = 'screen.game.detail';

  const GameDetailPage(this.gameId) : super(
    key: const Key(GameDetailPage.screenKey)
  );

  @override
  State<StatefulWidget> createState() {
    return _GameDetailPageState();
  }
}

class _GameDetailPageState extends State<GameDetailPage> {
  late final GameDetailBloc gameDetailBloc = GetIt.instance.get<GameDetailBloc>();

  @override
  void initState() {
    super.initState();
    gameDetailBloc.add(GameDetailInitializedEvent(
      id: widget.gameId,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameDetailBloc>.value(
      value: gameDetailBloc,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: const Text("Collapsing Toolbar",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: BlocBuilder<GameDetailBloc, GameDetailState>(
                  buildWhen: (previous, current) => previous.gameDetail.data != previous.gameDetail.data ||
                      previous.isShimmerLoading != current.isShimmerLoading,
                  builder: (context, state) =>
                    state.gameDetail.data.backgroundImage.isNotEmpty ?
                    CachedNetworkImage(
                      imageUrl: state.gameDetail.data.backgroundImage,
                      height: 200,
                      placeholder: (context, url) => Container(
                        color: Colors.white,
                      ),
                    ) :
                    Container(
                      height: 200,
                      color: Colors.white,
                      child: const Center(child: Text("No Image")),
                    ),
                )
              ),
            )
          ],
          body: const Center(
            child: Text("Sample Text"),
          ),
        )
      ),
    );
  }
}
