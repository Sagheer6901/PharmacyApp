import 'package:flutter/material.dart';
import 'package:fluttertest/app_constants.dart';

class CategoryCard extends StatelessWidget {
  final text, imageDirectory;
  const CategoryCard(this.text, this.imageDirectory);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Constants.secondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(30.0))),
        height: 120,
        width: 150,
        child: Column(
          children: [
            Expanded(
                flex: 3,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  child: Image.asset(
                    imageDirectory,
                    height: 250,
                    width: 220,
                    fit: BoxFit.cover,
                  ),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
