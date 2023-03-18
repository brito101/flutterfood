// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, avoid_unnecessary_containers, prefer_final_fields, prefer_is_empty
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../models/Order.dart';
import '../../models/Food.dart';
import '../../widgets/food_card.dart';
import '../../models/Evaluation.dart';

class OrderDetailsScreen extends StatelessWidget {
  Order _order = Order(
      identify: '111',
      date: '08/03/2023',
      status: 'open',
      table: '25',
      total: (90).toDouble(),
      comment: 'Sem cebola',
      foods: [
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
      ],
      evaluations: [
        // Evaluation(nameUser: 'sdasd', comment: 'sdasd', stars: 3),
        // Evaluation(nameUser: 'sdasd', comment: 'sdasd', stars: 0),
        // Evaluation(nameUser: 'sdasd', comment: 'sdasd', stars: 5)
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Detalhes do Pedido',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: BackButton(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(child: _buildOrderDetails(context)),
        bottomNavigationBar: FlutterFoodBottomNavigator(1));
  }

  Widget _buildOrderDetails(context) {
    return Container(
      padding: EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _makeTextOrder('Número', _order.identify),
          _makeTextOrder('Data', _order.date),
          _makeTextOrder('Status', _order.status.toString()),
          _makeTextOrder('Total', _order.total.toString()),
          _makeTextOrder('Mesa', _order.table.toString()),
          _makeTextOrder('Comentário', _order.comment.toString()),
          Container(height: 30),
          Text(
            'Comidas',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          _buildFoodsOrder(),
          Container(height: 30),
          Text(
            'Avaliações',
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          _buildEvaluationsOrder(context)
        ],
      ),
    );
  }

  Widget _makeTextOrder(String textLabel, String textValue) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(children: <Widget>[
        Text(
          '$textLabel: ',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Text(
          textValue,
          style: TextStyle(
            color: Colors.black,
          ),
        )
      ]),
    );
  }

  Widget _buildFoodsOrder() {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: _order.foods?.length,
          itemBuilder: (context, index) {
            final Food food = _order.foods![index];
            return FoodCard(
              identify: food.identify,
              title: food.title,
              description: food.description,
              price: food.price,
              image: food.image,
              showCartIcon: false,
            );
          }),
    );
  }

  Widget _buildEvaluationsOrder(context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.orange,
      elevation: 2.2,
      minimumSize: Size(88, 50),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          side: BorderSide(color: Colors.orangeAccent)),
    );

    if (_order.evaluations!.length > 0) {
      return Container(
        padding: EdgeInsets.only(left: 10),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _order.evaluations?.length,
            itemBuilder: (context, index) {
              final Evaluation evaluation = _order.evaluations![index];
              return _buildEvaluationItem(evaluation, context);
            }),
      );
    } else {
      return Container(
        margin: EdgeInsets.only(bottom: 30, top: 10),
        height: 40,
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/evaluation-order');
            },
            style: raisedButtonStyle,
            child: Text('Avaliar o Pedido')),
      );
    }
  }

  Widget _buildEvaluationItem(Evaluation evaluation, context) {
    return Card(
      elevation: 2.5,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade100),
            borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Column(
          children: <Widget>[
            RatingBarIndicator(
              rating: evaluation.stars,
              itemBuilder: (context, index) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              itemCount: 5,
              itemSize: 12,
              direction: Axis.horizontal,
            ),
            Row(
              children: <Widget>[
                Text(
                  "${evaluation.nameUser} - ",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  evaluation.comment,
                  style: TextStyle(color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
