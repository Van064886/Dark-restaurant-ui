import 'package:dark_restaurant_ui/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomNavigationElement extends StatefulWidget {
  final int activeScreen;
  final int screen;
  final Function() onTap;
  final String label;
  final IconData icon;
  const BottomNavigationElement(
      {super.key,
      required this.activeScreen,
      required this.screen,
      required this.onTap,
      required this.label,
      required this.icon});

  @override
  State<BottomNavigationElement> createState() =>
      _BottomNavigationElementState();
}

class _BottomNavigationElementState extends State<BottomNavigationElement> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              widget.onTap();
            },
            child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: widget.activeScreen == widget.screen
                        ? appMainColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  widget.icon,
                  color: widget.activeScreen == widget.screen
                      ? Colors.white
                      : Colors.white,
                )),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(widget.label,
              style: TextStyle(
                  color: widget.activeScreen == widget.screen
                      ? appMainColor
                      : Colors.white,
                  fontSize: 13))
        ],
      ),
    );
  }
}
