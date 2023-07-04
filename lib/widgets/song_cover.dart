import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SongCover extends StatelessWidget {
  final String? url;
  final double? size;
  final double radius;

  const SongCover({
    super.key,
    this.url,
    this.size,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    final placeCover = ColoredBox(
      color: const Color(0xff1f1f1f),
      child: Image.asset(
        'images/default_cover.png',
        width: size,
        height: size,
      ),
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        imageUrl: url ?? 'https://y.qq.com/mediastyle/global/img/album_300.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
        alignment: Alignment.topCenter,
        errorWidget: (context, _, stackTrace) => placeCover,
        placeholder: (context, _) => placeCover,
      ),
    );
  }
}
