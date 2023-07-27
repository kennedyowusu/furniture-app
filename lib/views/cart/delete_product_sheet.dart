import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/model/product.dart';
import 'package:furniture_ui/providers/cart_notifier.dart';

Future<dynamic> deleteProductBottomSheet(BuildContext context, double height,
    WidgetRef ref, List<Product> cartState, int index) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        height: height * 0.32,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Delete Product',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Divider(
              thickness: 2,
              endIndent: 150,
              indent: 150,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            const Text(
              'You are about to delete this item from your cart. Are you sure?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                ref.read(cartStateNotifierProvider.notifier).removeFromCart(
                      cartState[index],
                    );
                Navigator.pop(context);
              },
              child: const Text(
                'Delete Product',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
