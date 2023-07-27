import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_ui/constants/colors.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.02),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/svg/empty-cart.svg",
            height: height * 0.4,
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            "You have no Product in Cart".toUpperCase(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
