import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_ui/views/cart/cart.dart';
import 'package:furniture_ui/views/payment/payment_view.dart';
import 'package:furniture_ui/views/widgets/custom_input_field.dart';
import 'package:furniture_ui/views/widgets/top_section.dart';

class PaymentForm extends ConsumerWidget {
  PaymentForm({super.key, required this.totalCartAmount});

  final String totalCartAmount;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController refController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    debugPrint(totalCartAmount);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(
              15,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  topSection(
                    context,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartView(),
                        )),
                  ),
                  const Divider(
                    thickness: 1,
                    color: Colors.black38,
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Stack(
                      children: [
                        Container(
                          height: height * 0.3,
                          width: width,
                          color: Colors.grey[300],
                        ),
                        Positioned(
                          top: 5,
                          bottom: 2,
                          child: SvgPicture.asset(
                            'assets/svg/pay.svg',
                            fit: BoxFit.cover,
                            height: height * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    controller: emailController,
                    labelText: "Email Address",
                    hintText: "Enter Email Address",
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Email Address is required";
                      }
                      return '';
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    readOnly: true,
                    initialValue: "\$$totalCartAmount",
                    decoration: const InputDecoration(
                      labelText: "Total Amount",
                      hintText: "Enter Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Amount is required";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomInputField(
                    controller: refController,
                    labelText: "Reference",
                    hintText: "Enter Reference",
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Reference is required";
                      }
                      return '';
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentView(
                              amount: totalCartAmount,
                              email: emailController.text,
                              reference: refController.text,
                            ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(
                              "Please fill all fields",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Proceed to Payment",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
