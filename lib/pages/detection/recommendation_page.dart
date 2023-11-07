import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/models/product.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/product_card.dart';
import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            titleAppBar: "Recommendation",
            onPressedFunc: () => Navigator.pop(context),
          )
        ],
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34), topRight: Radius.circular(34)),
            ),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.5,
                mainAxisExtent: 250,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ProductCard(product: dummyProduct);
              },
            ),
          ),
        ),
      ),
    );
  }
}
