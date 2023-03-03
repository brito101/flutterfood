// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class RestaurantCard extends StatelessWidget {
  final String uuid;
  final String name;
  final String image;
  final String contact;

  RestaurantCard(
      {required this.uuid,
      required this.name,
      required this.image,
      required this.contact});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 4, right: 1, left: 1),
      child: Card(
        elevation: 2.5,
        child: Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.all(Radius.circular(4)),
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: ClipOval(
                      // child: Image.asset('assets/images/IconeFlutterFood.png')
                      child: CachedNetworkImage(
                        imageUrl: image != ''
                            ? image
                            : 'https://www.rodrigobrito.dev.br/themes/web/assets/images/logo.svg',
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
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.black54,
                  ),
                  Expanded(
                      child: Text(
                    name,
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ))
                ],
              ),
            )),
      ),
    );
  }
}
