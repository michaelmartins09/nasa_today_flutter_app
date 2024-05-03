import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_today/app/presentation/pages/home/home_controller.dart';
import 'package:nasa_today/app/presentation/pages/home/widgets/picture_card.dart';
import 'package:nasa_today/app/presentation/pages/home/widgets/picture_list_tile.dart';
import 'package:nasa_today/app/presentation/pages/home/widgets/picture_session_label.dart';
import 'package:swipe_refresh/swipe_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomeController>();
  final _swipeContorller = StreamController<SwipeRefreshState>.broadcast();

  Stream<SwipeRefreshState> get _stream => _swipeContorller.stream;

  Future<void> _refresh() async {
    _controller.fetchRandomAstronomyPictures().then((value) {
      _swipeContorller.sink.add(SwipeRefreshState.hidden);
    });
  }

  @override
  void initState() {
    _controller.fetchAstronomyPictureToday();
    _controller.fetchRandomAstronomyPictures();
    super.initState();
  }

  @override
  void dispose() {
    _swipeContorller.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("NASA Today"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTodayTitle(),
          _buildTodayCard(),
          _buildListTitle(),
          _buildListBody(),
        ],
      ),
    );
  }

  Widget _buildTodayTitle() {
    return Observer(
      builder: (context) {
        if (!_controller.loading && _controller.pictureToday == null) {
          return const SizedBox.shrink();
        }

        return PictureSessionLabel(
          label: "🚀 Picture of the day",
          isLoading: _controller.loading,
        );
      },
    );
  }

  Widget _buildTodayCard() {
    return Observer(builder: (context) {
      if (_controller.pictureToday == null) {
        return const SizedBox.shrink();
      }

      return PictureCard(
        picture: _controller.pictureToday!.url,
        title: _controller.pictureToday!.title,
      );
    });
  }

  Widget _buildListTitle() {
    return Observer(
      builder: (context) {
        if (!_controller.loadingList && _controller.picturesList.isEmpty) {
          return const SizedBox.shrink();
        }

        return PictureSessionLabel(
          label: "✨ Random pictures",
          isLoading: _controller.loadingList,
        );
      },
    );
  }

  Widget _buildListBody() {
    return Observer(builder: (context) {
      if (_controller.picturesList.isEmpty) {
        return const SizedBox.shrink();
      }
      return Expanded(
        child: SwipeRefresh.builder(
          stateStream: _stream,
          onRefresh: _refresh,
          itemCount: _controller.picturesList.length,
          itemBuilder: (context, index) {
            final picture = _controller.picturesList[index];

            return PictureListTile(
              picture: picture.url,
              date: picture.date,
              title: picture.title,
            );
          },
        ),
      );
    });
  }
}
