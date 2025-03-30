import 'package:flutter/material.dart';
import 'package:flutter_game_shop/const.dart';
import 'package:flutter_game_shop/screens/signin_screen.dart';
import 'package:flutter_game_shop/screens/signup_screen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  primaryColor,
                  Colors.red.shade900,
                ],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
            child: mainBodyFun(context),
          ),
        ),
      ),
    );
  }

  Center mainBodyFun(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          topExpandedFun(),
          imageExpandedFun(),
          bottomExpandedFun(context),
        ],
      ),
    );
  }

  Expanded bottomExpandedFun(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              fixedSize: const Size(300, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SignupScreen(),
                ),
              );
            },
            child: const Text(
              'SIGN UP',
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Already memeber?',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SigninScreen(),
                ),
              );
            },
            child: const Text(
              'Sing In',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Expanded imageExpandedFun() {
    return Expanded(
      child: Image.asset(
        'assets/images/pic1.png',
        width: 250,
      ),
    );
  }

  Expanded topExpandedFun() {
    const String longText =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore';
    return const Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Game Pro Store',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              longText,
              style: TextStyle(color: Colors.white, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
