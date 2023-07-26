import 'package:flutter/material.dart';

Container buildBottomSheetContainer({
  required BuildContext context,
  required double height,
  required double width,
  required String text,
  required String amount,
  required String buttonTitle,
  required Function() onPressed,
}) {
  return Container(
    height: height * 0.1,
    width: width,
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0, -1),
          blurRadius: 10,
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 50,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Text(
                buttonTitle,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
