import 'package:flutter/material.dart';

class MyImage extends StatelessWidget {
  final String image;
  const MyImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.asset(image,
        width: MediaQuery.of(context).size.width * 0.95);
  }
}
