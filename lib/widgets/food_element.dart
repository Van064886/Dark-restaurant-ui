import 'package:dark_restaurant_ui/models/food.dart';
import 'package:dark_restaurant_ui/utils/constants.dart';
import 'package:flutter/material.dart';

class FoodElement extends StatefulWidget {
  Food food;
  FoodElement({super.key, required this.food});

  @override
  State<FoodElement> createState() => _FoodElementState();
}

class _FoodElementState extends State<FoodElement> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * .4,
      height: height * .28,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              width: width * .4,
              height: height * .19,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: appSecondBackgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    widget.food.name!,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                  const Text(
                    "American love",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.food.price} \$",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            color: appMainColor),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isFav = !isFav;
                            });
                          },
                          icon: Icon(
                            !isFav
                                ? Icons.favorite_outline
                                : Icons.favorite_rounded,
                            color: isFav ? Colors.red : Colors.white,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: height * .11,
              left: ((width * .4) - (width * .35)) / 2,
              child: Image.asset(
                widget.food.picture!,
                width: width * .35,
                height: width * .35,
              ))
        ],
      ),
    );
  }
}
