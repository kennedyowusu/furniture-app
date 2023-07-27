import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/constants/colors.dart';
import 'package:furniture_ui/model/product.dart';
import 'package:furniture_ui/providers/cart_notifier.dart';
import 'package:furniture_ui/views/cart/delete_product_sheet.dart';
import 'package:furniture_ui/views/cart/increase_decrease_quantity_btn.dart';
import 'package:furniture_ui/views/widgets/empty_item.dart';

class CartItem extends ConsumerWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    final List<Product> cartState = ref.watch(cartStateNotifierProvider);

    return cartState.isEmpty
        ? Center(
            child: EmptyCart(height: height),
          )
        : Column(
            children: [
              for (int index = 0; index < cartState.length; index++)
                Container(
                  height: height * 0.15,
                  width: width,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  margin: const EdgeInsets.only(
                    bottom: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          cartState[index].image,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cartState[index].name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    actionButton(Icons.remove, () {
                                      ref
                                          .read(
                                            cartStateNotifierProvider.notifier,
                                          )
                                          .decreaseQuantity(
                                            cartState[index],
                                          );
                                    }),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      cartState[index].quantity.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: primaryColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15.0,
                                    ),
                                    actionButton(
                                      Icons.add,
                                      () {
                                        ref
                                            .read(cartStateNotifierProvider
                                                .notifier)
                                            .increaseQuantity(
                                              cartState[index],
                                            );
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    cartState[index].price.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.3,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      deleteProductBottomSheet(context, height,
                                          ref, cartState, index);
                                    },
                                    child: const Icon(
                                      Icons.delete_rounded,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          );
  }
}
