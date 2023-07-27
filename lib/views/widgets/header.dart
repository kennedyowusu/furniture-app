import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/model/product.dart';
import 'package:furniture_ui/providers/cart_notifier.dart';
import 'package:furniture_ui/views/cart/cart.dart';

class Header extends ConsumerWidget {
  const Header({
    super.key,
  });

  String calTimeOfDay() {
    final DateTime now = DateTime.now();
    final int hour = now.hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 16) {
      return "Good Afternoon";
    } else {
      return "Good Evening";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Product> cartState = ref.watch(cartStateNotifierProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey[300],
            ),
            child: Image.asset(
              "assets/images/profile/Kennedy.jpg",
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              calTimeOfDay(),
              style: const TextStyle(
                fontSize: 18,
                height: 0.8,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              "Kennedy Owusu",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const Spacer(),
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CartView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            Positioned(
              right: 0,
              top: 6,
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  cartState.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const Icon(
          Icons.notifications_none_sharp,
          color: Colors.black54,
          size: 30,
        )
      ],
    );
  }
}
