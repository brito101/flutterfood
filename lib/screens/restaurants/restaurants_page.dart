// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../models/Restaurant.dart';
import './widgets/RestaurantCard.dart';
import '../../widgets/flutter_bottom_navigator.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  // ignore: prefer_final_fields
  List<Restaurant> _restaurants = [
    Restaurant(
        uuid: '132232',
        name: 'Rodrigo Brito',
        image: '',
        contact: 'contato@rodrigobrito.dev.br'),
    Restaurant(
        uuid: '132232',
        name: 'Rodrigo Brito',
        image: '',
        contact: 'contato@rodrigobrito.dev.br'),
    Restaurant(
        uuid: '132232',
        name: 'Rodrigo Brito',
        image: '',
        contact: 'contato@rodrigobrito.dev.br'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            'Restaurantes',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: _buildRestaurants(context),
        bottomNavigationBar: FlutterFoodBottomNavigator(0));
  }

  Widget _buildRestaurants(context) {
    return ListView.builder(
      itemCount: _restaurants.length,
      itemBuilder: (context, index) {
        final Restaurant restaurant = _restaurants[index];
        return RestaurantCard(
            uuid: restaurant.uuid,
            name: restaurant.name,
            image: restaurant.image,
            contact: restaurant.contact);
      },
    );
  }
}
