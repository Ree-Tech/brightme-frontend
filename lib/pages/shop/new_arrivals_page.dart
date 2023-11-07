import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/models/product.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/product_card.dart';
import 'package:flutter/material.dart';

class NewArrivalsPage extends StatelessWidget {
  const NewArrivalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            titleAppBar: "New Arrivals",
            onPressedFunc: () => Navigator.pop(context),
          ),
        ],
        body: SingleChildScrollView(
          child: Material(
            color: purpleColor,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34)),
              ),
              child: GridView.builder(
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  mainAxisExtent: 270,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: arrivalProduct.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ProductCard(product: arrivalProduct[index]);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
