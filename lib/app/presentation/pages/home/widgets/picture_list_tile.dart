import 'package:flutter/material.dart';
import 'package:nasa_today/app/presentation/components/components.dart';
import 'package:nasa_today/shared/extensions/date_extension.dart';

class PictureListTile extends StatelessWidget {
  final String picture;
  final String title;
  final DateTime date;
  final Function()? onTap;

  const PictureListTile({
    super.key,
    this.onTap,
    required this.picture,
    required this.date,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () => _onShowImage(context: context, picture: picture),
      leading: Hero(
        tag: picture,
        child: SizedBox(
          width: 50,
          height: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: NasaCachedImage(url: picture),
          ),
        ),
      ),
      title: Hero(
        tag: title,
        child: Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(Icons.photo_camera_back_outlined, size: 14),
          const SizedBox(width: 4),
          Text(date.toFormatEnUs()),
        ],
      ),
      onTap: onTap,
    );
  }

  void _onShowImage({required BuildContext context, required String picture}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          content: Image.network(picture),
        );
      },
    );
  }
}
