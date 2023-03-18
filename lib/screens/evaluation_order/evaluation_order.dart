// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/flutter_bottom_navigator.dart';

class EvaluationScreen extends StatelessWidget {
  const EvaluationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Avaliar o Pedido',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: BackButton(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _buildScreenEvaluationOrder(context),
        bottomNavigationBar: FlutterFoodBottomNavigator(1));
  }

  Widget _buildScreenEvaluationOrder(context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          _buildHeader(),
          Container(
            height: 22,
          ),
          _buildFormEvaluation(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      child: Text(
        "Avaliar o Pedido: 1321",
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }

  Widget _buildFormEvaluation(context) {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 2.2,
      minimumSize: Size(88, 50),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(18))),
    );

    return Container(
      child: Column(
        children: <Widget>[
          RatingBar.builder(
            initialRating: 1,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
          Container(
            height: 14,
          ),
          TextFormField(
              autocorrect: true,
              style: TextStyle(color: Theme.of(context).primaryColor),
              cursorColor: Theme.of(context).primaryColor,
              onSaved: (value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'Comentário (ex: Muito Bom)',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        BorderSide(color: Theme.of(context).primaryColor)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              )),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: ElevatedButton(
                onPressed: () {
                  print('Avaliar o Produto');
                },
                style: raisedButtonStyle,
                child: Text(
                  'Avaliar o Pedido',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}
