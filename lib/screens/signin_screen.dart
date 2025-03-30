import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_game_shop/const.dart';
import 'package:flutter_game_shop/first_screen.dart';
import 'package:flutter_game_shop/screens/bottom_nav.dart';
import 'package:flutter_game_shop/screens/home.dart';
import 'package:flutter_game_shop/screens/signup_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

bool isShow = false;
bool isChange = false;
final TextEditingController _userNameController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

dispose() {
  _userNameController.dispose();
  _passwordController.dispose();
}

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: Column(
            children: [
              appBarSection(),
              mainSection(),
              bottomSection(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Expanded bottomSection() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              fixedSize: Size(300, 45),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate() && isChange == true) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavWidget(),
                    ));
              } else {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text('Warning!'),
                      content: Text('Complete Inputs!'),
                      actions: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Return'),
                        ),
                      ],
                    );
                  },
                );
              }
            },
            child: Text(
              'Sign In',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Don\'t have an account?',
            style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
          ),
          TextButton(
            style: ElevatedButton.styleFrom(foregroundColor: primaryColor),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ));
            },
            child: Text(
              'Sign Up From Here',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Expanded mainSection() {
    return Expanded(
      flex: 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sign In Now',
            style: TextStyle(
                color: primaryColor, fontSize: 26, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _userNameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 17.5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          BorderSide(color: Colors.grey.shade900, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    suffixIcon: Icon(Icons.person),
                    suffixIconColor: Colors.grey.shade900,
                    hintText: 'User Name',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Username Can Not Be Empty!';
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isShow,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 17.5),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          BorderSide(color: Colors.grey.shade900, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    prefixIcon: Icon(Icons.lock_outline),
                    prefixIconColor: Colors.grey.shade900,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (isShow == false) {
                              isShow = true;
                            } else {
                              isShow = false;
                            }
                          });
                        },
                        icon: isShow
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    suffixIconColor: Colors.grey.shade900,
                    hintText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password Can Not Be Empty!';
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          activeColor: primaryColor,
                          value: isChange,
                          onChanged: (state) {
                            setState(() {
                              isChange = state!;
                            });
                          },
                        ),
                        Text('Remember me'),
                      ],
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: primaryColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        'Forget Password',
                        // style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Expanded appBarSection() {
    return Expanded(
      child: ClipPath(
        clipper: OvalBottomBorderClipper(),
        child: Container(
            height: 200,
            width: double.infinity,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  Center(
                    child: SvgPicture.asset(
                      'assets/images/logo.svg',
                      width: 110,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
