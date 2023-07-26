class CartProduct {
  final String name;
  final String image;
  final double price;
  final int quantity;

  CartProduct({
    required this.name,
    required this.image,
    required this.price,
    required this.quantity,
  });

  CartProduct copyWith({
    String? name,
    String? image,
    double? price,
    int? quantity,
  }) {
    return CartProduct(
      name: name ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
}

final List<CartProduct> cartProducts = [
  CartProduct(
    name: "Sofa",
    image: "assets/images/sofa.png",
    price: 101,
    quantity: 1,
  ),
  CartProduct(
    name: "Sofa",
    image: "assets/images/sofa.png",
    price: 120,
    quantity: 1,
  ),
  CartProduct(
    name: "Sofa",
    image: "assets/images/sofa.png",
    price: 145,
    quantity: 1,
  ),
  CartProduct(
    name: "Sofa",
    image: "assets/images/sofa.png",
    price: 135,
    quantity: 1,
  ),
  CartProduct(
    name: "Sofa",
    image: "assets/images/sofa.png",
    price: 120,
    quantity: 1,
  ),
  CartProduct(
    name: "Sofa",
    image: "assets/images/sofa.png",
    price: 120,
    quantity: 1,
  ),
];
