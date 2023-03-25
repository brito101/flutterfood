// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    _checkAuth().then((value) {
      Navigator.pushReplacementNamed(context, "/login");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              child: Image.asset('assets/images/IconeFlutterFood.png'),
            ),
            Container(
              height: 30,
            ),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
            ),
            Container(
              height: 10,
            ),
            Text(
              'Carregando...',
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }

  Future<String> _checkAuth() async {
    await Future.delayed(Duration(seconds: 10));

    return '';
  }
}
