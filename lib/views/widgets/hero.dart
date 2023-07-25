import 'package:flutter/material.dart';
import 'package:furniture_ui/constants/data.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Hero(
          tag: 'hero',
          child: Material(
            child: Container(
              width: width,
              height: height * 0.15,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                color: primaryColor,
              ),
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.065, left: 10.0),
                child: const Text(
                  "Find the best furniture for your home",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 10,
          child: Image.asset(
            "assets/images/ladder.png",
            height: 140,
          ),
        )
      ],
    );
  }
}
