// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

class FoodCard extends StatelessWidget {
  String identify;
  String title;
  String description;
  String price;
  String image;

  FoodCard(
      {required this.identify,
      required this.title,
      required this.description,
      required this.price,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.5,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade100),
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Colors.white),
        child: Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: <Widget>[
              _buildImageFood(),
              _buildInfoFood(),
              _buildButtonCart(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageFood() {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 80,
      height: 80,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: image != ''
              ? image
              : 'https://www.rodrigobrito.dev.br/themes/web/assets/images/avatar.webp',
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
    );
  }

  Widget _buildInfoFood() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(title,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          Container(
            height: 5,
          ),
          Text(description,
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontWeight: FontWeight.normal)),
          Container(
            height: 7,
          ),
          Text("R\$ $price",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontWeight: FontWeight.w500))
        ],
      ),
    );
  }

  Widget _buildButtonCart(context) {
    return Container(
      child: IconTheme(
          data: IconThemeData(color: Theme.of(context).primaryColor),
          child: Icon(Icons.shopping_cart)),
    );
  }
}
