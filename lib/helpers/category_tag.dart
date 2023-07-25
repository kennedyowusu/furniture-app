// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:furniture_ui/views/widgets/category_widget.dart';

// Widget categoryWithoutTag() {
//   return SizedBox(
//     height: 90,
//     width: MediaQuery.of(context).size.width,
//     child: ListView.builder(
//       itemCount: categories.length,
//       padding: const EdgeInsets.only(left: 5),
//       scrollDirection: Axis.horizontal,
//       itemBuilder: (BuildContext context, int index) {
//         return SlideInUp(
//           key: Key(index.toString()),
//           delay: Duration(milliseconds: 200 + (100 * index)),
//           from: widget.catListOffset.dy - 80,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: InkWell(
//               onTap: () {
//                 setState(() {
//                   selectedCat = index;
//                 });
//               },
//               child: CategoryWidget(
//                 category: categories[index],
//                 isSelected: selectedCat == index,
//               ),
//             ),
//           ),
//         );
//       },
//     ),
//   );
// }
