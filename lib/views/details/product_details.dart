import 'package:flutter/material.dart';
import 'package:furniture_ui/helpers/bottom_sheet.dart';
import 'package:furniture_ui/views/cart/cart.dart';
import 'package:furniture_ui/views/widgets/top_section.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required Map<String, Object> product});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomSheet: buildBottomSheetContainer(
        context: context,
        height: height,
        width: width,
        text: "Price",
        amount: "\$120",
        buttonTitle: "Add to Cart",
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return const CartView();
              },
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topSection(context),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: height * 0.4,
                width: width,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF5b3325),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, -1),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/wardrobe-brown.png",
                  fit: BoxFit.contain,
                  height: height * 0.4,
                  width: width,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Wardrobe",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eget justo ut odio ultrices aliquet. Donec eget justo ut odio ultrices aliquet.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text(
                    "Color: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  for (int index = 0; index < colors.length; index++)
                    colorContainer(index),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget colorContainer(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: colors[index],
        shape: BoxShape.circle,
      ),
    );
  }
}

final List<Color> colors = [
  Colors.brown,
  Colors.blue,
  Colors.orange,
  Colors.teal,
  Colors.yellow,
];
