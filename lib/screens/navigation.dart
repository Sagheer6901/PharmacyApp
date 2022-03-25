import 'package:flutter/material.dart';
import 'package:fluttertest/app_constants.dart';
import 'package:fluttertest/screens/cart_screen.dart';
import 'package:fluttertest/screens/categories_screen.dart';
import 'package:fluttertest/screens/home_screen.dart';
import 'package:fluttertest/screens/more_screen.dart';
import 'package:fluttertest/screens/search_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    SearchScreen(),
    CartScreen(),
    CategoriesScreen(),
    MoreScreen()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Constants.shadePrimaryColor,
        body: _children[_currentIndex], // new
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed, // Fixed
            // backgroundColor: Colors.black, // <-- This works for fixed
            selectedItemColor: Constants.primaryColor,
            unselectedItemColor: Colors.grey.shade500,
            backgroundColor: Colors.grey.shade100,
            onTap: onTabTapped, // new
            currentIndex: _currentIndex, // new
            items: [
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  // color: Colors.grey.shade700,
                  size: 40,
                ),
                label: "Home",
              ),
              new BottomNavigationBarItem(
                icon: Icon(
                  Icons.search_rounded,
                  size: 40,
                ),
                label: 'Search',
              ),
              new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 40,
                  ),
                  label: 'Cart'),
              new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.dashboard,
                    size: 40,
                  ),
                  label: "Categories"),
              new BottomNavigationBarItem(
                  icon: Icon(
                    Icons.read_more,
                    size: 40,
                  ),
                  label: 'More'),
            ]
        )
    );
  }
}
