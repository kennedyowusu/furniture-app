import 'package:flutter/material.dart';
import 'package:furniture_ui/model/category.dart';
import 'package:furniture_ui/views/widgets/category_widget.dart';

Widget buildCategory(BuildContext context) {
  GlobalKey<State<StatefulWidget>> cateListKey = GlobalKey();

  return Material(
    color: Colors.transparent,
    child: SizedBox(
      key: cateListKey,
      height: 85,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: category.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CategoryWidget(
              category: category[index],
            ),
          );
        },
      ),
    ),
  );
}
