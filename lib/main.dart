import 'package:dark_restaurant_ui/screens/home.dart';
import 'package:dark_restaurant_ui/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: appBackgroundColor,
        theme: ThemeData(
            fontFamily: "Poppins",
            colorScheme: ColorScheme.fromSwatch(
                backgroundColor: appBackgroundColor,
                brightness: Brightness.dark)),
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
