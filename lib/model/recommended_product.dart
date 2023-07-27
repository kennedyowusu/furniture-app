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
    name: 'Concealed Wardrobe',
    description:
        'This concealed wardrobe is a super space saver as it is built into the wall and remains hidden as a part of the TV showcase when its doors are closed. The colour of the wardrobe also blends well with the light grey walls of the room, resulting in a soft look and feel for the bedroom.',
    price: "120",
    color: Color(0xFF594a40),
  ),
  RecommendedProduct(
    index: 2,
    image: 'assets/images/wardrobe-brown.png',
    name: 'Freestanding Wardrobe',
    description:
        'This freestanding wardrobe set features two separate glass door wardrobes to differentiate between his and hers. Alternatively, you can also use one wardrobe to organise clothes, jewellery, shoes and accessories and the other wardrobe to store bed sheets, pillows, quilts.',
    price: "140",
    color: Color(0xFF5b3325),
  ),
  RecommendedProduct(
    index: 3,
    image: 'assets/images/light-brown.png',
    name: 'Divani Casa Harvest',
    description:
        'When you think of comfortable arm chairs, you probably think of something that has oversized cushions. This modern chair, which is available in either white L-grade leather, is a chair that fits that bill. With its oversized seat and back cushions, and its two-arm cushions, this chair will provide endless style and comfort.',
    price: "115",
    color: Color(0xFFa8938e),
  ),
  RecommendedProduct(
    index: 4,
    image: 'assets/images/light-gray.png',
    name: 'Modern Industrial Slant',
    description:
        'The woven fabric chair supports up to 300 pounds and is a high-quality, elegant accent to any living room, bedroom, sunroom, or office space. Built with high density foam in the slanted back and seat to deliver optimal comfort.',
    price: "104",
    color: Color(0xFFc5c4d2),
  ),
  RecommendedProduct(
    index: 5,
    image: 'assets/images/coffee-table.png',
    name: 'Modern End Table Round',
    description:
        'The round side table is made of MDF and solid wood with smooth and eco-friendly coating, which is easy to clean and waterproof. The durable structure, smooth surface, and elegant design comprise this modern side table.',
    price: "135",
    color: Color(0xFF4f2f28),
  ),
  RecommendedProduct(
    index: 6,
    image: 'assets/images/coffee-color.png',
    name: 'Wooden Structure',
    description:
        'This side table with strong metal structure for longevity,solid metal with a matte paint on the surface,make this end table hold up over time;3 solid legs,easy to assemble,putting it together in about 30 seconds,all you need to do is screw on the legs',
    price: "139",
    color: Color(0xFF3f3d3c),
  ),
];
