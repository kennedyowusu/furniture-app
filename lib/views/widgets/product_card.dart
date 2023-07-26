import 'package:flutter/material.dart';
import 'package:furniture_ui/model/recommended_product.dart';

class RecommendedProductCard extends StatelessWidget {
  final RecommendedProduct recommendedProducts;

  const RecommendedProductCard({super.key, required this.recommendedProducts});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 180,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
          color: recommendedProducts.color,
        ),
        child: Center(
          child: Image.asset(
            recommendedProducts.image,
          ),
        ),
      ),
    );
  }
}
