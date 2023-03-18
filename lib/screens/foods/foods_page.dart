// ignore_for_file: prefer_const_constructors, prefer_final_fields

import 'package:flutter/material.dart';

import '../../models/Category.dart';
import '../../models/Food.dart';
import '../../screens/foods/widgets/Categories.dart';
import '../../../widgets/food_card.dart';
import '../../widgets/flutter_bottom_navigator.dart';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  List<Category> _categories = [
    Category(identify: '1', name: 'Lanches', description: "blablabla"),
    Category(identify: '2', name: 'Salgados', description: "blablabla"),
    Category(identify: '3', name: 'Pizzas', description: "blablabla"),
    Category(identify: '4', name: 'Refrigerantes', description: "blablabla"),
  ];
// ignore: unused_field
  List<Food> _foods = [
    Food(
        identify: '1',
        title: 'X-Burger',
        description: 'Apenas um teste',
        price: '1.99',
        image:
            'https://www.rodrigobrito.dev.br/themes/web/assets/images/avatar.webp'),
    Food(
        identify: '2',
        title: 'X-Tudo',
        description: 'Apenas um teste',
        price: '1.99',
        image:
            'https://www.rodrigobrito.dev.br/themes/web/assets/images/avatar.webp'),
    Food(
        identify: '3',
        title: 'X-Egg',
        description: 'Apenas um teste',
        price: '1.99',
        image:
            'https://www.rodrigobrito.dev.br/themes/web/assets/images/avatar.webp')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Rodrigo Brito Restaurant',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: BackButton(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _buildScreen(),
        bottomNavigationBar: FlutterFoodBottomNavigator(0));
  }

  Widget _buildScreen() {
    return Column(
        children: <Widget>[Categories(_categories), _buildFood(context)]);
  }

  Widget _buildFood(context) {
    return SizedBox(
        height: (MediaQuery.of(context).size.height - 190),
        width: (MediaQuery.of(context).size.width),
        child: ListView.builder(
          itemCount: _foods.length,
          itemBuilder: (context, index) {
            final Food food = _foods[index];
            return FoodCard(
              identify: food.identify,
              title: food.title,
              description: food.description,
              price: food.price,
              image: food.image,
              showCartIcon: true,
            );
          },
        ));
  }
}
