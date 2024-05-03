import 'package:flutter/material.dart';
import 'package:nasa_today/app/data/models/models.dart';
import 'package:nasa_today/app/presentation/pages/home/widgets/picture_session_label.dart';
import 'package:nasa_today/shared/extensions/date_extension.dart';

class DetailsPage extends StatefulWidget {
  final AstronomyPictureDto picture;

  const DetailsPage({super.key, required this.picture});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.picture.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Hero(
              tag: widget.picture.url,
              child: Image.network(widget.picture.url),
            ),
            PictureSessionLabel(label: widget.picture.title),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(Icons.photo_camera_back_outlined, size: 14),
                  const SizedBox(width: 4),
                  Text(widget.picture.date.toFormatEn()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: Text(widget.picture.explanation),
            ),
          ],
        ),
      ),
    );
  }
}
