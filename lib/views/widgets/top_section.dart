import 'package:flutter/material.dart';
import 'package:furniture_ui/views/cart/cart.dart';

Row topSection(BuildContext context) {
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
            onPressed: () {
              Navigator.pop(context);
            },
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
      Badge(
        child: IconButton(
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
      ),
      const Icon(
        Icons.notifications_none_sharp,
        color: Colors.black54,
        size: 30,
      )
    ],
  );
}
