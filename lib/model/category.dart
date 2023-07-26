class CategoryList {
  final int index;
  final String name;
  final String image;

  CategoryList({required this.index, required this.name, required this.image});

  factory CategoryList.fromJson(Map<String, dynamic> json) {
    return CategoryList(
      index: json['index'],
      name: json['name'],
      image: json['image'],
    );
  }
}

final List<CategoryList> category = [
  CategoryList(
    index: 1,
    name: "Kitchen",
    image: "assets/images/category/kitchen.png",
  ),
  CategoryList(
    index: 2,
    name: "Bathroom",
    image: "assets/images/category/bathroom.png",
  ),
  CategoryList(
    index: 3,
    name: "Sofa",
    image: "assets/images/category/sofa.png",
  ),
  CategoryList(
    index: 4,
    name: "Icebox",
    image: "assets/images/category/icebox.png",
  ),
];
