// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../../widgets/flutter_bottom_navigator.dart';
import '../../widgets/show_image_cached_network.dart';

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
        body: _buildContentCart(context),
        bottomNavigationBar: FlutterFoodBottomNavigator(2));
  }

  Widget _buildContentCart(context) {
    return ListView(
      children: <Widget>[
        _buildHeader(),
        _buildCartList(context),
        _buildTextTotalCart(),
        _buildFormComment(context),
        _buttonCheckout(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.all(16),
      child: Text(
        'Total (3) Itens',
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildCartList(context) {
    return ListView.builder(
        shrinkWrap: true,
        primary: false,
        itemCount: 6,
        itemBuilder: (context, index) => _buildCartItem(context));
  }

  Widget _buildCartItem(context) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          height: 100,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Container(
            padding: EdgeInsets.all(2),
            child: Row(
              children: <Widget>[
                ShowImageCachedNetwork(
                    "https://www.rodrigobrito.dev.br/themes/web/assets/images/avatar.webp"),
                _showDetailItemCart(context)
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 24,
            width: 24,
            margin: EdgeInsets.only(top: 2, right: 4),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(100))),
            child: Icon(
              Icons.close,
              size: 20,
              color: Colors.white,
            ),
          ),
        )
      ],
    );
  }

  Widget _showDetailItemCart(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 5, right: 4, left: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Pizza Cut!!',
              maxLines: 2,
              style: TextStyle(
                  fontSize: 14, color: Theme.of(context).primaryColor),
            ),
            Container(
              height: 6,
            ),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'R\$ 399,90',
                      style: TextStyle(color: Colors.green),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.remove,
                            size: 24,
                            color: Colors.grey.shade700,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                top: 4, bottom: 4, left: 12, right: 12),
                            color: Theme.of(context).primaryColor,
                            child: Text(
                              '2',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.add,
                            size: 24,
                            color: Colors.grey.shade700,
                          )
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextTotalCart() {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 26, bottom: 15),
      child: Text(
        'Preço Total: R\$ 499,00',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildFormComment(context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
          autocorrect: true,
          style: TextStyle(color: Theme.of(context).primaryColor),
          cursorColor: Theme.of(context).primaryColor,
          onSaved: (value) {
            print(value);
          },
          decoration: InputDecoration(
            labelText: 'Comentário (ex: sem cebola)',
            labelStyle: TextStyle(color: Theme.of(context).primaryColor),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          )),
    );
  }

  Widget _buttonCheckout() {
    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.orange.shade800,
      elevation: 0,
      minimumSize: Size(88, 50),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    );

    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 50, right: 10, left: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.grey, offset: Offset(0.0, 1.0), blurRadius: 6)
      ]),
      child: ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          print('checkout');
        },
        child: Text('Finalizar Pedido'),
      ),
    );
  }
}
