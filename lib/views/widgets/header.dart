import 'package:flutter/material.dart';
import 'package:furniture_ui/views/cart/cart.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          children: const [
            Text(
              "Good Morning",
              style: TextStyle(
                fontSize: 18,
                height: 0.8,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
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
}
