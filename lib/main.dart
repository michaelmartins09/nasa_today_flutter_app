import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_today/core/core.dart';

void main() {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppRoot(),
    ),
  );
}
