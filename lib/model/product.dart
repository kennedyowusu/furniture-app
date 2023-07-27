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
