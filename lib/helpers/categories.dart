import 'package:flutter/material.dart';
import 'package:furniture_ui/constants/data.dart';
import 'package:furniture_ui/views/details/details_view.dart';
import 'package:furniture_ui/views/widgets/category_widget.dart';

Widget buildCategory(BuildContext context) {
  GlobalKey<State<StatefulWidget>> catListKey = GlobalKey();

  return Material(
    color: Colors.transparent,
    child: SizedBox(
      key: catListKey,
      height: 85,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              final offset =
                  (catListKey.currentContext!.findRenderObject() as RenderBox)
                      .localToGlobal(Offset.zero);
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation1, animation) => DetailsView(
                    selectedCategory: index,
                    catListOffset: offset,
                  ),
                  transitionDuration: const Duration(milliseconds: 500),
                  transitionsBuilder:
                      (_, Animation<double> animation, __, Widget widget) =>
                          FadeTransition(opacity: animation, child: widget),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CategoryWidget(
                category: categories[index],
              ),
            ),
          );
        },
      ),
    ),
  );
}
