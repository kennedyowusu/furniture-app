import 'package:flutter/material.dart';

Container actionButton(IconData icon, Function() onPressed) {
  return Container(
    height: 30,
    width: 30,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ]),
    child: IconButton(
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      onPressed: onPressed,
    ),
  );
}
