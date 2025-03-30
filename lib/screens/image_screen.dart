import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(image: image),
    );
  }
}
