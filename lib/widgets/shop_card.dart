import 'package:flutter/material.dart';

class ShopCard extends StatelessWidget {
  final text, imageDirectory, color;
  const ShopCard(this.text, this.imageDirectory, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: color, borderRadius: const BorderRadius.all(Radius.circular(15.0))),
      height: 150,
      width: 250,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          SizedBox(
              height: 120, width: 100, child: Image.asset(imageDirectory)),
        ],
      ),
    );
  }
}
