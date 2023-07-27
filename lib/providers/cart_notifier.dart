import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/controllers/cart_controller.dart';
import 'package:furniture_ui/model/product.dart';

final StateNotifierProvider<CartStateNotifier, List<Product>>
    cartStateNotifierProvider =
    StateNotifierProvider<CartStateNotifier, List<Product>>(
  (ref) => CartStateNotifier(),
);
