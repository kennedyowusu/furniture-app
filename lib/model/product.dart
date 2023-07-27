import 'package:flutter/material.dart';

class Product {
  final int index;
  final String name;
  final String image;
  final double price;
  final Color color;
  final String description;
  final int quantity;

  Product({
    required this.index,
    required this.name,
    required this.image,
    required this.price,
    required this.color,
    required this.description,
    this.quantity = 1,
  });

  Product copyWith({
    int? index,
    String? name,
    String? image,
    double? price,
    Color? color,
    String? description,
    int? quantity,
  }) {
    return Product(
      index: index ?? this.index,
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      color: color ?? this.color,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
    );
  }
}

final List<Product> allProducts = [
  Product(
    index: 1,
    name: "Sofa",
    image: "assets/images/wardrobe.png",
    price: 120.0,
    color: Color(0xFF6C9DFD),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e",
  ),
  Product(
    index: 2,
    name: "Sofa",
    image: "assets/images/wardrobe-brown.png",
    price: 120.0,
    color: Color(0xFF6C9DFD),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e",
  ),
  Product(
    index: 3,
    name: "Sofa",
    image: "assets/images/light-brown.png",
    price: 120.0,
    color: Color(0xFF6C9DFD),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e",
  ),
  Product(
    index: 4,
    name: "Sofa",
    image: "assets/images/light-gray.png",
    price: 120.0,
    color: Color(0xFF6C9DFD),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e",
  ),
  Product(
    index: 5,
    name: "Sofa",
    image: "assets/images/coffee-table.png",
    price: 120.0,
    color: Color(0xFF6C9DFD),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e",
  ),
  Product(
    index: 6,
    name: "Sofa",
    image: "assets/images/coffee-color.png",
    price: 120.0,
    color: Color(0xFF6C9DFD),
    description:
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e",
  ),
];
