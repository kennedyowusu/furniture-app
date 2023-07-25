import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_ui/constants/data.dart';
import 'package:furniture_ui/helpers/categories.dart';
import 'package:furniture_ui/views/widgets/advert.dart';
import 'package:furniture_ui/views/widgets/header.dart';
import 'package:furniture_ui/views/widgets/hero.dart';
import 'package:furniture_ui/views/widgets/product_card.dart';
import 'package:furniture_ui/views/widgets/rcommended_header.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Header(),
                SizedBox(
                  height: height * 0.18,
                  child: HeroWidget(width: width, height: height),
                ),
                const SizedBox(
                  height: 15,
                ),
                Hero(
                  tag: "categories",
                  child: buildCategory(
                    context,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AdvertWidget(width: width, height: height),
                const SizedBox(
                  height: 15,
                ),
                const RecommendedHeader(),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: height * 0.38,
                  child: ListView.builder(
                    itemCount: recommendedProducts.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(
                        product: recommendedProducts[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: BottomNavBar(),
    );
  }
}
