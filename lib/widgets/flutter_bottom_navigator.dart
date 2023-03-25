// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class FlutterFoodBottomNavigator extends StatelessWidget {
  int _active_item = 0;

  FlutterFoodBottomNavigator(this._active_item);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: Theme.of(context).primaryColor,
      backgroundColor: Theme.of(context).colorScheme.background,
      height: 45,
      index: _active_item,
      items: <Widget>[
        Icon(Icons.home),
        Icon(Icons.list),
        Icon(Icons.shopping_cart),
        Icon(Icons.supervised_user_circle),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, '/restaurants');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/my-orders');
            break;
          case 2:
            Navigator.pushReplacementNamed(context, '/cart');
            break;
          case 3:
            Navigator.pushReplacementNamed(context, '/profile');
            break;
          default:
            Navigator.pushReplacementNamed(context, '/restaurants');
        }
      },
    );
  }
}
