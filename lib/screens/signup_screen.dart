import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_game_shop/const.dart';
import 'package:flutter_game_shop/first_screen.dart';
import 'package:flutter_game_shop/screens/bottom_nav.dart';
import 'package:flutter_game_shop/screens/home.dart';
import 'package:flutter_game_shop/screens/signin_screen.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isShow = true; // برای نمایش/مخفی کردن رمز عبور
  bool isChange = false; // برای چک باکس

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatpasswordController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _repeatpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                appBarSection(context),
                mainSection(),
                bottomSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ClipPath appBarSection(BuildContext context) {
    return ClipPath(
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
    );
  }

  Column mainSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Create Account',
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
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
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
                  suffixIcon: Icon(Icons.email_outlined),
                  suffixIconColor: Colors.grey.shade900,
                  hintText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email Can Not Be Empty!';
                  }
                  return null;
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
                          isShow = !isShow;
                        });
                      },
                      icon: isShow
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                  suffixIconColor: Colors.grey.shade900,
                  hintText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Password Can Not Be Empty!';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: _repeatpasswordController,
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
                          isShow = !isShow;
                        });
                      },
                      icon: isShow
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)),
                  suffixIconColor: Colors.grey.shade900,
                  hintText: 'Repeat Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Repeat Password Can Not Be Empty!';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match!';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    activeColor: primaryColor,
                    value: isChange,
                    onChanged: (state) {
                      setState(() {
                        isChange = !isChange;
                      });
                    },
                  ),
                  Text('I agree to the'),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: primaryColor,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Terms and Conditions',
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Column bottomSection(BuildContext context) {
    return Column(
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
            'Sign Up',
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Already have an account?',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
        ),
        TextButton(
          style: ElevatedButton.styleFrom(foregroundColor: primaryColor),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SigninScreen(),
                ));
          },
          child: Text(
            'Sign In from here',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
