import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:domain_game/domain_game.dart';
import 'package:feature/feature.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feature_detail/feature_detail.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class GameDetailPage extends StatefulWidget {
  final int gameId;
  static const String screenKey = 'screen.game.detail';
  static const String headerNoImageKey = 'screen.game.detail.header.no_image';
  static const String bodyLoadingKey = 'screen.game.detail.body.loading';
  static const String bodyDescriptionKey = 'screen.game.detail.body.description';

  const GameDetailPage(
    @PathParam('gameId') this.gameId
  ) : super(
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
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: BlocBuilder<GameDetailBloc, GameDetailState>(
              buildWhen: (previous, current) => previous.gameDetail.data.backgroundImage != current.gameDetail.data.backgroundImage ||
                  previous.isShimmerLoading != current.isShimmerLoading,
              builder: (context, state) => SliverAppBar(
                backgroundColor: Colors.black,
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: !state.isShimmerLoading ?
                    Stack(
                      children: [
                        Text(
                          state.gameDetail.data.name,
                          style: TextStyle(
                            fontSize: 16,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 4
                              ..color = Colors.black,
                          ),
                        ),
                        Text(
                          state.gameDetail.data.name,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ) : null,
                  background: state.isShimmerLoading ?
                    const _LoadingBackgroundImage() :
                    _BackgroundImage(game: state.gameDetail.data)
                ),
              ),
            ),
            ),
          ],
          body: Builder(builder: (context) => CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverToBoxAdapter(
                child: BlocBuilder<GameDetailBloc, GameDetailState>(
                  buildWhen: (previous, current) => previous.gameDetail.data != current.gameDetail.data ||
                      previous.isShimmerLoading != current.isShimmerLoading,
                  builder: (context, state) => state.isShimmerLoading ?
                  const _LoadingBody() :
                  _GameDetailBody(game: state.gameDetail.data),
                ),
              ),
            ]
          ),
        ),
        ),
      ),
    );
  }
}

class _LoadingBackgroundImage extends StatelessWidget {
  const _LoadingBackgroundImage() : super();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 200,
        color: Colors.white,
      ),
    );
  }
}

class _LoadingBody extends StatelessWidget {
  const _LoadingBody() : super(key: const Key(GameDetailPage.bodyLoadingKey));

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  final GameDetail game;

  const _BackgroundImage({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => game.backgroundImage.isNotEmpty ?
    CachedNetworkImage(
      imageUrl: game.backgroundImage,
      height: 200,
      placeholder: (context, url) => Container(
        color: Colors.white,
      ),
    ) :
    Container(
      key: const Key(GameDetailPage.headerNoImageKey),
      height: 200,
      color: Colors.white,
      child: const Center(child: Text("No Image")),
    );
}

class _GameDetailBody extends StatelessWidget with MetacriticMixin {
  final GameDetail game;

  const _GameDetailBody({
    Key? key,
    required this.game,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: getMetacriticColor(game.metacritic),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '${game.metacritic}',
                    style: TextStyle(
                      color: getMetacriticTextColor(game.metacritic),
                      fontWeight: FontWeight.w800,
                      fontSize: 24
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Metascore',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18
                        ),
                      ),
                      const Text(
                        'Universal acclaim',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 14
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14
                          ),
                          children: [
                            const TextSpan(text: 'based on '),
                            TextSpan(
                              text: '${game.reviewsCount} Critic Reviews',
                              style: const TextStyle(
                                fontWeight: FontWeight.w800
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          RichText(
            key: const Key(GameDetailPage.bodyDescriptionKey),
            text: TextSpan(
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14
              ),
              children: [
                const TextSpan(
                  text: 'Summary: ',
                  style: TextStyle(
                      fontWeight: FontWeight.w800
                  )
                ),
                TextSpan(
                  text: game.description,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 14
              ),
              children: [
                const TextSpan(
                  text: 'Genre: ',
                  style: TextStyle(
                    fontWeight: FontWeight.w800
                  )
                ),
                TextSpan(
                  text: game.genres.map((e) => e.name).join(', '),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14
              ),
              children: [
                const TextSpan(
                    text: 'Developer: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w800
                    )
                ),
                TextSpan(
                  text: game.developers.map((e) => e.name).join(', '),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14
              ),
              children: [
                const TextSpan(
                    text: 'Publisher: ',
                    style: TextStyle(
                        fontWeight: FontWeight.w800
                    )
                ),
                TextSpan(
                  text: game.publishers.map((e) => e.name).join(', '),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
}
