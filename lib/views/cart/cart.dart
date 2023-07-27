import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/helpers/bottom_sheet.dart';
import 'package:furniture_ui/model/product.dart';
import 'package:furniture_ui/providers/cart_notifier.dart';
import 'package:furniture_ui/views/cart/cart_items.dart';
import 'package:furniture_ui/views/payment/payment.dart';
import 'package:furniture_ui/views/widgets/top_section.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final List<Product> cartState = ref.watch(cartStateNotifierProvider);

    showBottomSheet(BuildContext context, String cartTotal) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            height: height * 0.32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'You are paying \$$cartTotal'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const Divider(
                  thickness: 2,
                  endIndent: 150,
                  indent: 150,
                  color: Colors.black,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget finibus vulputate, sem justo aliquam massa, vitae lacinia nisl nunc eu e',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentForm(
                          totalCartAmount: cartTotal,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Proceed to Pay',
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

    String calTotal() {
      double totalPrice = 0;

      cartState
          .map((product) => totalPrice += product.price * product.quantity)
          .toList();

      return totalPrice.toStringAsFixed(2);
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomSheet: buildBottomSheetContainer(
        context: context,
        height: height,
        width: width,
        text: "Total",
        amount: "\$${calTotal()}",
        buttonTitle: "Checkout",
        onPressed: () {
          showBottomSheet(context, calTotal());
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            topSection(context),
            const Divider(
              thickness: 1,
              color: Colors.black38,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: height * 0.9,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Column(
                children: const [
                  CartItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
