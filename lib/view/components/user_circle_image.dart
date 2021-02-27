import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CirclePhoto extends StatelessWidget {
  final String photoUrl;
  final double radius;
  final bool isImageFromFile;

  CirclePhoto(this.photoUrl, this.radius, this.isImageFromFile);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: isImageFromFile
      //fileから画像を持ってくる際は、FileImageを使う。
          ? FileImage(File(photoUrl))
          : CachedNetworkImageProvider(photoUrl),
    );
  }
}
