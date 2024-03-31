import 'dart:math';
import 'package:dark_restaurant_ui/models/food.dart';
import 'package:dark_restaurant_ui/utils/constants.dart';
import 'package:dark_restaurant_ui/widgets/bottom_navigation_element.dart';
import 'package:dark_restaurant_ui/widgets/food_element.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeScreen = 1;

  List<IconData> sectionIcons = [
    Icons.cake,
    Icons.food_bank,
    Icons.local_drink,
    Icons.breakfast_dining
  ];

  List<Food> foods = List.generate(11, (index) {
    return Food(
        id: index + 1,
        name: [
          "Chicken Burger",
          "Salad Burger",
          "Beef Burger",
          "CheeseBurger"
        ][Random().nextInt(4)],
        picture: 'assets/images/c${index + 1}.png',
        price: Random().nextInt(480));
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      bottomNavigationBar: Container(
        height: height * .09,
        color: appSecondBackgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationElement(
              activeScreen: activeScreen,
              screen: 1,
              onTap: () {
                setState(() {
                  activeScreen = 1;
                });
              },
              label: "Home",
              icon: Icons.home,
            ),
            BottomNavigationElement(
              activeScreen: activeScreen,
              screen: 2,
              onTap: () {
                setState(() {
                  activeScreen = 2;
                });
              },
              label: "Explore",
              icon: Icons.shop,
            ),
            BottomNavigationElement(
              activeScreen: activeScreen,
              screen: 3,
              onTap: () {
                setState(() {
                  activeScreen = 3;
                });
              },
              label: "Wishlist",
              icon: Icons.favorite,
            ),
            BottomNavigationElement(
              activeScreen: activeScreen,
              screen: 4,
              onTap: () {
                setState(() {
                  activeScreen = 4;
                });
              },
              label: "Profile",
              icon: Icons.person,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * .7,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "From Texas with",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w800),
                          ),
                          Text(
                            "American love",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    IconButton.filled(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(appMainColor)),
                        onPressed: () {},
                        icon: const Icon(Icons.notifications))
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: sectionIcons.map((icon) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        color: sectionIcons[0] == icon
                            ? Colors.white
                            : appSecondBackgroundColor,
                        child: Icon(
                          icon,
                          size: 28,
                          color: sectionIcons[0] == icon
                              ? appBackgroundColor
                              : Colors.white,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(
                  height: 34,
                ),
                Wrap(
                    spacing: width * .04,
                    runSpacing: 40,
                    children: foods.map((food) {
                      return FoodElement(food: food);
                    }).toList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
