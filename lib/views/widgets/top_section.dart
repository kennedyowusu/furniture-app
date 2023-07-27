import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/providers/cart_notifier.dart';
import 'package:furniture_ui/views/cart/cart.dart';

Row topSection(BuildContext context, {Function()? onPressed}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ClipOval(
        child: Container(
          width: 40,
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.grey[300],
          ),
          child: IconButton(
            onPressed: onPressed ?? () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 15,
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 10,
      ),
      const Spacer(),
      Stack(
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const CartView();
                },
              ));
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
              child: Consumer(
                builder: (BuildContext context, WidgetRef ref, child) {
                  return Text(
                    ref.watch(cartStateNotifierProvider).length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
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
