import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_today/app/presentation/pages/home/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = Modular.get<HomeController>();

  @override
  void initState() {
    _controller.fetch();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Observer(builder: (context) {
          if (_controller.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_controller.pictureToday == null) {
            return const Text("Image not recovered");
          }

          return Column(
            children: [
              Text("Title: ${_controller.pictureToday!.title}"),
              Text("Description: ${_controller.pictureToday!.explanation}"),
              if (_controller.pictureToday?.copyright != null)
                Text("Author: ${_controller.pictureToday!.copyright}"),
              Image.network(_controller.pictureToday!.url),
              Text("Date: ${_controller.pictureToday!.date.toString()}"),
            ],
          );
        }),
      ),
    );
  }
}
