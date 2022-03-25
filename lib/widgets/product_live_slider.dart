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
          image: DecorationImage(
            image: NetworkImage(imageDirectory),
            fit: BoxFit.cover,
          ),
        ),
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
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIG3O-IngohK6nvicXD5BbO56FYvkMWcc3Tg&usqp=CAU"),
      SliderImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzHeTpKw8nl9VyiRJIrLeNAHQRLEInlFKFDA&usqp=CAU"),
      SliderImage(
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRz7h568VBpN0Df09afk16bbyIE_6s5DdJ8fA&usqp=CAU"),
    ],
  );
}
