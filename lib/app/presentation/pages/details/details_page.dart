import 'package:flutter/material.dart';
import 'package:nasa_today/app/data/models/models.dart';

class DetailsPage extends StatefulWidget {
  final AstronomyPictureDto picture;

  const DetailsPage({super.key, required this.picture});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
