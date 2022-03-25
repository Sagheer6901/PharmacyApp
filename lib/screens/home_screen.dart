import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/app_constants.dart';
import 'package:fluttertest/widgets/category_card.dart';
import 'package:fluttertest/widgets/shop_card.dart';
import 'package:fluttertest/widgets/user_order_cards.dart';
import 'package:fluttertest/widgets/product_card.dart';
import 'package:fluttertest/widgets/product_live_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceOrientation = MediaQuery.of(context).orientation;
    return deviceOrientation == Orientation.portrait
        ? const HomeScreenPortrait()
        : const HomeScreenLandscape();
  }
}

class HomeScreenPortrait extends StatefulWidget {
  const HomeScreenPortrait({Key? key}) : super(key: key);

  @override
  State<HomeScreenPortrait> createState() => _HomeScreenPortraitState();
}

class _HomeScreenPortraitState extends State<HomeScreenPortrait> {
  final List<String> imageList = [
    "https://dailytimes.com.pk/assets/uploads/2021/04/09/serv.jpg",
    "https://dailytimes.com.pk/assets/uploads/2021/04/09/serv.jpg",
    "https://dailytimes.com.pk/assets/uploads/2021/04/09/serv.jpg"
  ];
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    final systemBarColors = SystemUiOverlayStyle(
      statusBarColor: Constants.primaryColor,
    );
    SystemChrome.setSystemUIOverlayStyle(systemBarColors);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Constants.shadePrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.5), // Set this height
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 140,
                color: Constants.shadePrimaryColor,
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 10),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  Constants.appName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: height * 0.03,
                                    width: width * 0.035,
                                    child: Image.asset(
                                      "assets/images/first_add.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Pakistan's No. 1 Pharmacy",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.notifications,
                        color: Constants.secondaryColor,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: width * 0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Constants.secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        size: 30,
                        color: Constants.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: width * 0.6,
                        child: TextField(
                          textAlign: TextAlign.left,
                          // controller: controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Constants.primaryColor),
                            hintText: "Search Products Here..",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                color: Constants.shadePrimaryColor,
                child: productSlider()),
            Container(
                margin: const EdgeInsets.all(5),
                color: Constants.shadePrimaryColor,
                child: const UserOrderCards()),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Baby Care",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              color: Constants.shadePrimaryColor,
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ProductCard("Detol 150ml Hand Sanitizer..", 240,
                      198.18, 7.4, 199, "assets/images/liquid_Soap.jpg");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Shop by Health Concerns",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              color: Constants.shadePrimaryColor,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ShopCard("Cardiac Care", "assets/images/heart.png",
                      Colors.pink.shade200),
                  ShopCard("Cardiac Care", "assets/images/heart.png",
                      Colors.purple.shade300),
                  ShopCard("Cardiac Care", "assets/images/heart.png",
                      Colors.pink.shade200),
                  ShopCard("Cardiac Care", "assets/images/heart.png",
                      Colors.purple.shade300),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Immunity Boosters",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              color: Constants.shadePrimaryColor,
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ProductCard("Detol 150ml Hand Sanitizer..", 240,
                      198.18, 7.4, 199, "assets/images/liquid_Soap.jpg");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              color: Constants.shadePrimaryColor,
              height: height * 0.25,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard("Medicine", "assets/images/medicines.png"),
                  CategoryCard("Surgical", "assets/images/surgical.png"),
                  CategoryCard("Medicine", "assets/images/medicines.png"),
                  CategoryCard("Surgical", "assets/images/surgical.png"),
                  CategoryCard("Medicine", "assets/images/medicines.png"),
                  CategoryCard("Surgical", "assets/images/surgical.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "COVID-19 Essentials",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              color: Constants.shadePrimaryColor,
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ProductCard("Detol 150ml Hand Sanitizer..", 240,
                      198.18, 7.4, 199, "assets/images/liquid_Soap.jpg");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeScreenLandscape extends StatefulWidget {
  const HomeScreenLandscape({Key? key}) : super(key: key);

  @override
  State<HomeScreenLandscape> createState() => _HomeScreenLandscapeState();
}

class _HomeScreenLandscapeState extends State<HomeScreenLandscape> {
  final List<String> imageList = [
    "https://dailytimes.com.pk/assets/uploads/2021/04/09/serv.jpg",
    "https://dailytimes.com.pk/assets/uploads/2021/04/09/serv.jpg",
    "https://dailytimes.com.pk/assets/uploads/2021/04/09/serv.jpg"
  ];
  var size, height, width;

  @override
  Widget build(BuildContext context) {
    final systemBarColors = SystemUiOverlayStyle(
      statusBarColor: Constants.primaryColor,
    );
    SystemChrome.setSystemUIOverlayStyle(systemBarColors);
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Constants.shadePrimaryColor,
      appBar: PreferredSize(
        preferredSize: Size(width, height * 0.35), // Set this height
        child: SafeArea(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 140,
                color: Constants.shadePrimaryColor,
                child: Container(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 10),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                      color: Constants.primaryColor,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  Constants.appName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 24,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: height * 0.03,
                                    width: width * 0.035,
                                    child: Image.asset(
                                      "assets/images/first_add.png",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "Pakistan's No. 1 Pharmacy",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontStyle: FontStyle.italic,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      Icon(
                        Icons.notifications,
                        color: Constants.secondaryColor,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: width * 0.8,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Constants.secondaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0, 5),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        size: 30,
                        color: Constants.primaryColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: width * 0.6,
                        child: TextField(
                          textAlign: TextAlign.left,
                          // controller: controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintStyle: TextStyle(color: Constants.primaryColor),
                            hintText: "Search Products Here..",
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: const EdgeInsets.all(5),
                color: Constants.shadePrimaryColor,
                child: productSlider()),
            SafeArea(
              child: Container(
                  margin: const EdgeInsets.all(5),
                  color: Constants.shadePrimaryColor,
                  child: const UserOrderCards()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Baby Care",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              color: Constants.shadePrimaryColor,
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ProductCard("Detol 150ml Hand Sanitizer..", 240,
                      198.18, 7.4, 199, "assets/images/liquid_Soap.jpg");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Shop by Health Concerns",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              color: Constants.shadePrimaryColor,
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ShopCard("Cardiac Care", "assets/images/heart.png",
                      Colors.pink.shade200),
                  ShopCard("Cardiac Care", "assets/images/heart.png",
                      Colors.purple.shade300),
                  ShopCard("Cardiac Care", "assets/images/heart.png",
                      Colors.pink.shade200),
                  ShopCard("Cardiac Care", "assets/images/heart.png",
                      Colors.purple.shade300),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Immunity Boosters",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(5),
              color: Constants.shadePrimaryColor,
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ProductCard("Detol 150ml Hand Sanitizer..", 240,
                      198.18, 7.4, 199, "assets/images/liquid_Soap.jpg");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              color: Constants.shadePrimaryColor,
              height: height * 0.4,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryCard("Medicine", "assets/images/medicines.png"),
                  CategoryCard("Surgical", "assets/images/surgical.png"),
                  CategoryCard("Medicine", "assets/images/medicines.png"),
                  CategoryCard("Surgical", "assets/images/surgical.png"),
                  CategoryCard("Medicine", "assets/images/medicines.png"),
                  CategoryCard("Surgical", "assets/images/surgical.png"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "COVID-19 Essentials",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Constants.f3,
                    color: Constants.primaryColor),
              ),
            ),
            Container(
              color: Constants.shadePrimaryColor,
              height: 380,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return const ProductCard("Detol 150ml Hand Sanitizer..", 240,
                      198.18, 7.4, 199, "assets/images/liquid_Soap.jpg");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
