// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors, must_be_immutable, unused_field

import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';

class OrdersScreen extends StatelessWidget {
  // ignore: prefer_final_fields
  List<Order> _orders = [
    Order(identify: '1222', date: '30/02/2023'),
    Order(identify: '1222', date: '30/02/2023'),
    Order(identify: '1222', date: '30/02/2023'),
    Order(identify: '1222', date: '30/02/2023'),
    Order(identify: '1222', date: '30/02/2023'),
    Order(identify: '1222', date: '30/02/2023'),
    Order(identify: '1222', date: '30/02/2023'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Meus Pedidos',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _buildOrdersScreen(context),
        bottomNavigationBar: FlutterFoodBottomNavigator(1));
  }

  Widget _buildOrdersScreen(context) {
    return Column(
      children: <Widget>[_buildHeader(), _buildOrdersList(context)],
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      child: Text(
        'Meus Pedidos',
        style: TextStyle(fontSize: 16, color: Colors.black),
      ),
    );
  }

  Widget _buildOrdersList(context) {
    return Expanded(
      child: ListView.builder(
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final Order order = _orders[index];
          return _buildItemOrder(order, context);
        },
      ),
    );
  }

  Widget _buildItemOrder(Order order, context) {
    return ListTile(
      title: Text(
        "Pedido #${order.identify}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      subtitle: Text(
        "${order.date}",
        style: TextStyle(color: Theme.of(context).primaryColor),
      ),
      trailing: IconTheme(
        data: IconThemeData(color: Theme.of(context).primaryColor),
        child: Icon(Icons.navigate_next),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/order-details',
            arguments: order.identify);
      },
    );
  }
}
