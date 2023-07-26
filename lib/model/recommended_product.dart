import 'package:flutter/material.dart';

class RecommendedProduct {
  final int index;
  final String image;
  final String name;
  final String description;
  final String price;
  final Color color;

  RecommendedProduct({
    required this.index,
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.color,
  });

  factory RecommendedProduct.fromJson(Map<String, dynamic> json) {
    return RecommendedProduct(
      index: json['index'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      color: json['color'],
    );
  }
}

final List<RecommendedProduct> recommendedProducts = [
  RecommendedProduct(
    index: 1,
    image: 'assets/images/wardrobe.png',
    name: 'Wardrobe',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e',
    price: '120',
    color: Color(0xFF594a40),
  ),
  RecommendedProduct(
    index: 2,
    image: 'assets/images/wardrobe-brown.png',
    name: 'Wardrobe',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e',
    price: '120',
    color: Color(0xFF5b3325),
  ),
  RecommendedProduct(
    index: 3,
    image: 'assets/images/light-brown.png',
    name: 'Wardrobe',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e',
    price: '120',
    color: Color(0xFFa8938e),
  ),
  RecommendedProduct(
    index: 4,
    image: 'assets/images/light-gray.png',
    name: 'Wardrobe',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e',
    price: '120',
    color: Color(0xFFc5c4d2),
  ),
  RecommendedProduct(
    index: 5,
    image: 'assets/images/coffee-table.png',
    name: 'Wardrobe',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e',
    price: '120',
    color: Color(0xFF4f2f28),
  ),
  RecommendedProduct(
    index: 6,
    image: 'assets/images/coffee-color.png',
    name: 'Wardrobe',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e',
    price: '120',
    color: Color(0xFF3f3d3c),
  ),
];
