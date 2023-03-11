// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../widgets/flutter_bottom_navigator.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Carrinho',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _buildContentCart(),
        bottomNavigationBar: FlutterFoodBottomNavigator(2));
  }

  Widget _buildContentCart() {
    return Column(
      children: <Widget>[
        _buildHeader(),
        // _buildCartList(),
        // _buildFormComment(),
        // _buttonCheckout(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(top: 12, left: 12),
      child: Text(
        'Total (3) Itens',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
