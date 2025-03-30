import 'package:flutter/material.dart';
import 'package:flutter_game_shop/first_Screen.dart';
import 'package:flutter_game_shop/screens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'roboto'),
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
