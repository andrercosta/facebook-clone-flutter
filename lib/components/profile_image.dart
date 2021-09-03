import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/utils/color_palette.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String urlImage;
  final bool visualized;

  const ProfileImage({Key? key, required this.urlImage,  this.visualized = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: ColorPalette.azulFacebook,
      child:  CircleAvatar(
        radius: visualized ? 22 : 18,
        backgroundImage: CachedNetworkImageProvider(
          urlImage,
        ),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
