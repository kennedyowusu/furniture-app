import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecommendedHeader extends StatelessWidget {
  const RecommendedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Recommend",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SvgPicture.asset(
            'assets/svg/right_arrow.svg',
            height: 18,
          )
        ],
      ),
    );
  }
}
