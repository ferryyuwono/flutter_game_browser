import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain_game/domain_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_browser/game_browser.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatefulWidget {
  static const String screenKey = 'screen.home';
  static const String gameListKey = 'screen.home.list.game';

  const HomePage() : super(key: const Key(HomePage.screenKey));

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final PagingController<int, Game> _pagingController = PagingController(
    firstPageKey: 1
  );
  late final HomeBloc homeBloc = GetIt.instance.get<HomeBloc>();

  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      final endDate = DateTime.now();
      final startDate = DateTime(
        endDate.year - 1, endDate.month, endDate.day
      );
      homeBloc.add(
        HomeGetGameEvent(
          page: pageKey,
          startDate: startDate,
          endDate: endDate,
        )
      );
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>.value(
      value: homeBloc,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Playstation 5 Games Browser"),
        ),
        body: SafeArea(
          child: buildList(context),
        ),
      ),
    );
  }

  Widget buildList(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => previous.games.data != current.games.data && current.games.page > 0 && current.games.isSuccess,
      listener: (context, state) {
        if (state.games.isLastPage) {
          _pagingController.appendLastPage(state.games.data);
          return;
        }

        final nextPageKey = state.games.page + 1;
        _pagingController.appendPage(state.games.data, nextPageKey);
      },
      buildWhen: (previous, current) => previous.games.data != current.games.data ||
          previous.isShimmerLoading != current.isShimmerLoading,
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () {
            homeBloc.add(const HomeGameRefreshedEvent());
            return Future.sync(() => _pagingController.refresh());
          },
          child: state.isShimmerLoading && state.games.data.isEmpty
              ? const _LoadingGameListView()
              : PagedListView<int, Game>(
            key: const Key(HomePage.gameListKey),
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<Game>(
              itemBuilder: (context, item, index) => _GameItem(
                game: item,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _GameItem extends StatelessWidget {
  final Game game;
  final DateFormat dateFormat = DateFormat("dd-MM-yyyy");

  _GameItem({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: InkWell(
        onTap: () {
          context.router.push(GameDetailRoute(gameId: game.id));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 4,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              game.backgroundImage.isNotEmpty ?
                CachedNetworkImage(
                  imageUrl: game.backgroundImage,
                  width: 150,
                  height: 90,
                  placeholder: (context, url) => Container(
                    width: 150,
                    height: 90,
                    color: Colors.white,
                  ),
                ) :
                Container(
                  width: 150,
                  height: 90,
                  color: Colors.white,
                  child: const Center(child: Text("No Image")),
                ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        game.name,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text(
                        'Release Date: ${dateFormat.format(game.released)}',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: _getMetacriticColor(game.metacritic),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${game.metacritic}',
                    style: TextStyle(
                      color: _getMetacriticTextColor(game.metacritic),
                      fontWeight: FontWeight.w600,
                      fontSize: 18
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getMetacriticColor(int score) {
    if (score >= 75) {
      return Colors.green;
    }

    if (score >= 50) {
      return Colors.yellow;
    }

    return Colors.red;
  }

  Color _getMetacriticTextColor(int score) {
    if (score >= 75) {
      return Colors.white;
    }

    if (score >= 50) {
      return Colors.black;
    }

    return Colors.white;
  }
}

class _LoadingGameItem extends StatelessWidget {
  const _LoadingGameItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            height: 90,
            color: Colors.white,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 4),
                  Container(
                    width: 100,
                    height: 16,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const SizedBox()
          ),
        ],
      ),
    );
  }
}

class _LoadingGameListView extends StatelessWidget {
  const _LoadingGameListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => const _LoadingGameItem(),
        ),
    );
  }
}
