import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain_game/domain_game.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feature_home/feature_home.dart';
import 'package:get_it/get_it.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class GameList extends StatefulWidget {
  static const String screenKey = 'widget.games';
  static const String bodyLoadingKey = 'widget.games.body.loading';
  static const String bodyListGameKey = 'widget.games.body.list.game';

  const GameList() : super(key: const Key(GameList.screenKey));

  @override
  State<StatefulWidget> createState() {
    return _GameListState();
  }
}

class _GameListState extends State<GameList> {
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
      child: BlocConsumer<HomeBloc, HomeState>(
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
              key: const Key(GameList.bodyListGameKey),
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Game>(
                itemBuilder: (context, item, index) => _GameItem(
                  key: Key('${GameList.bodyListGameKey}.$index'),
                  game: item,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _GameItem extends StatelessWidget with MetacriticMixin {
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
          context.router.pushNamed(FeaturePath.createGamePath(game.id));
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
                  color: getMetacriticColor(game.metacritic),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${game.metacritic}',
                    style: TextStyle(
                        color: getMetacriticTextColor(game.metacritic),
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
}

class _LoadingGameItem extends StatelessWidget {
  const _LoadingGameItem() : super();

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
          ),
        ],
      ),
    );
  }
}

class _LoadingGameListView extends StatelessWidget {
  const _LoadingGameListView() : super(key: const Key(GameList.bodyLoadingKey));

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
