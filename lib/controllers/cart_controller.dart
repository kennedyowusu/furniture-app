import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/model/product.dart';

class CartStateNotifier extends StateNotifier<List<Product>> {
  CartStateNotifier() : super([]);

  void addToCart(Product product) {
    // state = [...state, product];

    if (state.isEmpty) {
      state = [product];
    } else {
      final List<Product> temp = [];
      bool isPresent = false;
      for (int index = 0; index < state.length; index++) {
        if (state[index].index == product.index) {
          isPresent = true;
          temp.add(
            Product(
              index: state[index].index,
              name: state[index].name,
              description: state[index].description,
              price: state[index].price,
              image: state[index].image,
              color: state[index].color,
              quantity: state[index].quantity + 1,
            ),
          );
        } else {
          temp.add(state[index]);
        }
      }
      if (!isPresent) {
        temp.add(product);
      }
      state = temp;
    }
  }

  void removeFromCart(Product product) {
    state = state.where((element) => element.index != product.index).toList();
  }

  void clearCart() {
    state = [];
  }

  void increaseQuantity(Product product) {
    state = state.map((element) {
      if ((element.index == product.index) && (element.quantity < 5)) {
        return Product(
          index: element.index,
          name: element.name,
          description: element.description,
          price: element.price,
          image: element.image,
          color: element.color,
          quantity: element.quantity + 1,
        );
      } else {
        return element;
      }
    }).toList();
  }

  void decreaseQuantity(Product product) {
    state = state.map((element) {
      if ((element.index == product.index) && (element.quantity > 1)) {
        return Product(
          index: element.index,
          name: element.name,
          description: element.description,
          price: element.price,
          image: element.image,
          color: element.color,
          quantity: element.quantity - 1,
        );
      } else {
        return element;
      }
    }).toList();
  }

  void changeQuantity(Product product, int quantity) {
    state = state.map((element) {
      if (quantity != -1 && quantity >= 1) {
        return Product(
          index: element.index,
          name: element.name,
          description: element.description,
          price: element.price,
          image: element.image,
          color: element.color,
          quantity: quantity,
        );
      } else {
        return element;
      }
    }).toList();
  }
}
