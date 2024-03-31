// ignore_for_file: must_be_immutable

import 'package:dark_restaurant_ui/models/food.dart';
import 'package:dark_restaurant_ui/utils/constants.dart';
import 'package:flutter/material.dart';

class DetailsFood extends StatefulWidget {
  Food food;
  DetailsFood({super.key, required this.food});

  @override
  State<DetailsFood> createState() => _DetailsFoodState();
}

class _DetailsFoodState extends State<DetailsFood> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBackgroundColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 25,
            )),
        actions: [
          IconButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                setState(() {
                  isFav = !isFav;
                });
              },
              icon: Icon(
                !isFav ? Icons.favorite_outline : Icons.favorite_rounded,
                color: isFav ? Colors.red : appBackgroundColor,
                size: 25,
              )),
              const SizedBox(width: 8,),
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              Center(
                child: Hero(
                  tag: widget.food.id!,
                  child: Image.asset(
                    widget.food.picture!,
                    width: width * .9,
                    height: width * .9,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.food.name!,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w800),
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Text(
                        "4.8",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "A succulent, flame-grilled beef patty, nestled between two soft, toasted brioche buns. As you lift the burger, the melted cheddar cheese oozes over the sides, tempting you with its creamy richness. Crunch into crisp, fresh lettuce, juicy tomato slices, and tangy pickles, perfectly complementing the savory meat. ",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: appSecondBackgroundColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery time",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Icon(Icons.timer),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              '25 Mins',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w500),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    width: width * .25,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: appMainColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Price",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          '\$ ${widget.food.price}',
                          style: const TextStyle(
                              fontSize: 19, fontWeight: FontWeight.w800),
                        )
                      ],
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(60, 0),
                    child: Transform.rotate(
                      angle: 17.27,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Row(
                          children: [
                            Text(
                              'Buy now',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.payment,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
