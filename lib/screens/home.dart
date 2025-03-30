import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_game_shop/const.dart';
import 'package:flutter_game_shop/first_screen.dart';
import 'package:flutter_game_shop/models/game_model.dart';
import 'package:flutter_game_shop/screens/detail_screen.dart';
import 'package:flutter_game_shop/screens/signin_screen.dart';
import 'package:flutter_game_shop/screens/signup_screen.dart';

enum Category { action, racing, strategy, baby, others }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Enum enumStatus = Category.action;
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              topSectionFunction(),
              SizedBox(height: 10),
              searchbarFunction(),
              SizedBox(height: 15),
              categorySectionFunction(),
              SizedBox(height: 15),
              TrendingSection(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('New Games',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24)),
                    Text('See all',
                        style: TextStyle(fontSize: 18, color: Colors.grey)),
                  ],
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: GameModel.gameModelList.length,
                itemBuilder: (context, index) {
                  final helper = GameModel.gameModelList[index];
                  return NewGamesItemWidget(index, helper);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Container NewGamesItemWidget(int index, GameModel helper) {
    return Container(
      width: double.infinity,
      height: 160,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(15),
                child: Image.asset(
                  GameModel.gameModelList[index].coverImage,
                  width: 175,
                  height: 130,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      helper.title,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                    SizedBox(height: 5),
                    Text(
                      helper.category,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 7.5, vertical: 2.5),
                          decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(50)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                helper.score,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        customElevatedButton(),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column TrendingSection() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Trending',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              Text(
                'See all',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: GameModel.gameModelList.length,
            itemBuilder: (context, index) {
              return TrendingItemWidget(
                index: index,
              );
            },
          ),
        ),
      ],
    );
  }

  Container categorySectionFunction() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                categoryFunction(
                    title: 'Action',
                    icon: Icons.directions_walk,
                    primaryColor: enumStatus == Category.action
                        ? primaryColor
                        : Colors.grey.shade800,
                    function: () {
                      setState(() {
                        enumStatus = Category.action;
                      });
                    },
                    background: enumStatus == Category.action
                        ? Colors.red.shade100
                        : Colors.grey.shade200),
                categoryFunction(
                    title: 'Racing',
                    icon: Icons.car_crash,
                    primaryColor: enumStatus == Category.racing
                        ? primaryColor
                        : Colors.grey.shade800,
                    function: () {
                      setState(() {
                        enumStatus = Category.racing;
                      });
                    },
                    background: enumStatus == Category.racing
                        ? Colors.red.shade100
                        : Colors.grey.shade200),
                categoryFunction(
                    title: 'Startegy',
                    icon: Icons.castle,
                    primaryColor: enumStatus == Category.strategy
                        ? primaryColor
                        : Colors.grey.shade800,
                    function: () {
                      setState(() {
                        enumStatus = Category.strategy;
                      });
                    },
                    background: enumStatus == Category.strategy
                        ? Colors.red.shade100
                        : Colors.grey.shade200),
                categoryFunction(
                    title: 'Baby',
                    icon: Icons.child_care,
                    primaryColor: enumStatus == Category.baby
                        ? primaryColor
                        : Colors.grey.shade800,
                    function: () {
                      setState(() {
                        enumStatus = Category.baby;
                      });
                    },
                    background: enumStatus == Category.baby
                        ? Colors.red.shade100
                        : Colors.grey.shade200),
                categoryFunction(
                    title: 'others',
                    icon: Icons.more_horiz,
                    primaryColor: enumStatus == Category.others
                        ? primaryColor
                        : Colors.grey.shade800,
                    function: () {
                      setState(() {
                        enumStatus = Category.others;
                      });
                    },
                    background: enumStatus == Category.others
                        ? Colors.red.shade100
                        : Colors.grey.shade200),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell categoryFunction(
      {required String title,
      required IconData icon,
      required Function function,
      required Color primaryColor,
      required Color background}) {
    return InkWell(
      onTap: () => function(),
      child: Container(
        width: 120,
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: primaryColor,
              size: 26,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Container searchbarFunction() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: 'Search games',
          filled: true,
          fillColor: Colors.grey.shade200,
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.menu),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Row topSectionFunction() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(250),
              border: Border.all(
                color: Colors.black,
                width: 3,
              )),
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(250),
            color: Colors.orange,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.thumb_up,
                  color: Colors.orange,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Text('23456',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16))
            ],
          ),
        ),
      ],
    );
  }
}

class TrendingItemWidget extends StatelessWidget {
  const TrendingItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                gameModel: GameModel.gameModelList[index],
              ),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                GameModel.gameModelList[index].coverImage,
                width: 200,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 200,
                    height: 150,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          GameModel.gameModelList[index].title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          GameModel.gameModelList[index].category,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.orange,
                                  size: 28,
                                ),
                                Text(
                                  GameModel.gameModelList[index].score,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            ),
                            customElevatedButton(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class customElevatedButton extends StatelessWidget {
  const customElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      onPressed: () {},
      child: Text(
        'install',
        style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
      ),
    );
  }
}
