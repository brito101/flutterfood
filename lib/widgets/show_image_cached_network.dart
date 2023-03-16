// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_final_fields, must_be_immutable

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowImageCachedNetwork extends StatelessWidget {
  String _image;

  ShowImageCachedNetwork(this._image);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: _image,
        placeholder: (context, url) => SizedBox(
          width: 80,
          height: 80,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        errorWidget: (context, url, error) => Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
