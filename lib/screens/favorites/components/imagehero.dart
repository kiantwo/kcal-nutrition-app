import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({Key? key, required this.img}) : super(key: key);

  final ImageProvider img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Image(
              image: img,
            ),
          ),
        ),
      ),
    );
  }
}
