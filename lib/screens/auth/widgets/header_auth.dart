// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HeaderAuth extends StatelessWidget {
  const HeaderAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/IconeFlutterFood.png'),
              fit: BoxFit.fill)),
    );
  }
}
