import 'package:flutter/material.dart';
import 'package:flutter_game_shop/const.dart';
import 'package:flutter_game_shop/models/game_model.dart';
import 'package:flutter_game_shop/screens/image_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.gameModel});

  final GameModel gameModel;

  @override
  Widget build(BuildContext context) {
    String description =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua';
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              Image.asset(
                gameModel.coverImage,
                height: 375,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white30,
                          borderRadius: BorderRadius.circular(50)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                left: 175,
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.play_circle,
                      size: 50,
                      color: Colors.white,
                    )),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 550,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 75,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadiusDirectional.circular(50),
                        ),
                      ),
                      infoSection(),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'About Games',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        description,
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Game Pictures',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            'See all',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomImage(context, gameModel.image1),
                          CustomImage(context, gameModel.image2),
                          CustomImage(context, gameModel.image3),
                        ],
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(230, 45),
                            backgroundColor: primaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onPressed: () {},
                        child: Text(
                          'Install Game',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector CustomImage(BuildContext context, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ImageScreen(imagePath: imagePath),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Hero(
          tag: imagePath,
          child: Image.asset(
            imagePath,
            width: 85,
            height: 85,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Container infoSection() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.5),
      margin: EdgeInsets.symmetric(horizontal: 12.5, vertical: 10),
      decoration: BoxDecoration(
          color: Colors.grey.shade300, borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          customRow(Icons.download, '1M'),
          customRow(Icons.star, '5K'),
          customRow(Icons.mobile_friendly, '1.5M'),
        ],
      ),
    );
  }

  Row customRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(
          icon,
          size: 28,
          color: primaryColor,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
