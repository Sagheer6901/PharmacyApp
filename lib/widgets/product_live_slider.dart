import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderImage extends StatelessWidget {
  final imageDirectory;
  const SliderImage(this.imageDirectory);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.all(6.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Image.asset(imageDirectory),
      ),
      onTap: () {},
    );
  }
}

Widget productSlider() {
  return CarouselSlider(
    options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: false,
        disableCenter: true,
        enableInfiniteScroll: false),
    items: const [
      SliderImage(
          "assets/images/medicines.png"),
      SliderImage(
          "assets/images/surgical.png"),
      SliderImage(
          "assets/images/medicines.png"),
      SliderImage(
          "assets/images/surgical.png"),
    ],
  );
}
