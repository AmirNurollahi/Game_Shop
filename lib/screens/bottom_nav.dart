import 'package:flutter/material.dart';
import 'package:flutter_game_shop/const.dart';
import 'package:flutter_game_shop/first_screen.dart';
import 'package:flutter_game_shop/screens/home.dart';
import 'package:flutter_game_shop/screens/signin_screen.dart';
import 'package:flutter_game_shop/screens/signup_screen.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  _BottomNavWidgetState createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeScreen(),
    FirstScreen(),
    SigninScreen(),
    SignupScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: primaryColor,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fmd_good),
            label: 'Location',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}
