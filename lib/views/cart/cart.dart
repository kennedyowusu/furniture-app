import 'package:flutter/material.dart';
import 'package:furniture_ui/helpers/bottom_sheet.dart';
import 'package:furniture_ui/views/cart/cart_temp_data.dart';
import 'package:furniture_ui/views/home/home.dart';
import 'package:furniture_ui/views/widgets/top_section.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    showBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.all(16.0),
            height: height * 0.32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Payment Successful',
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
                        builder: (context) => const HomeView(),
                      ),
                    );
                  },
                  child: const Text(
                    'Go to Home',
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

    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomSheet: buildBottomSheetContainer(
        context: context,
        height: height,
        width: width,
        text: "Total",
        amount: "\$230",
        buttonTitle: "Checkout",
        onPressed: () {
          showBottomSheet(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: ListView(
          children: [
            topSection(context),
            const Divider(),
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
                  CartTempData(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
