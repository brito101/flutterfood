// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import '../../widgets/flutter_bottom_navigator.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Meu Perfil',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(child: _buildProfileScreen(context)),
        bottomNavigationBar: FlutterFoodBottomNavigator(3));
  }

  Widget _buildProfileScreen(context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Rodrigo Brito',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            Container(
              height: 10,
            ),
            Text(
              'rodrigobrito101@gmail.com',
              style: TextStyle(color: Colors.black),
            ),
            Container(
              height: 10,
            ),
            Container(
                child: MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/restaurants');
              },
              color: Colors.red,
              elevation: 2.2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                  side: BorderSide(color: Colors.redAccent)),
              child: Text('Sair'),
            ))
          ]),
    );
  }
}
