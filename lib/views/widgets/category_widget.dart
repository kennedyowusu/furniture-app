import 'package:flutter/material.dart';
import 'package:furniture_ui/model/category.dart';

class CategoryWidget extends StatelessWidget {
  final CategoryList category;

  const CategoryWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.fromBorderSide(
              BorderSide(
                color: Colors.transparent,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(
              category.image,
              height: 40,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          category.name,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}
