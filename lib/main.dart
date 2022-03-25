import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertest/screens/navigation.dart';

import 'app_constants.dart';

void main() {
  SystemUiOverlayStyle(
    statusBarColor: Constants.primaryColor,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Navigation()
    );
  }
}
