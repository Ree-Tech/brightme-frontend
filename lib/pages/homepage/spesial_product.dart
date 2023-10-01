import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/product_card.dart';
import 'package:flutter/material.dart';

class SpesialProduct extends StatelessWidget {
  const SpesialProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  )),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 30, right: 30, top: 65),
              margin: const EdgeInsets.only(top: 50),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34)),
              ),
              child: Column(
                children: [
                  Text(
                    "Bright Me Official Store",
                    style: semiBold(
                      sizeFont: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 248,
                    child: Text(
                      "Hi! Look what we got here! There are plenty of products that are 20% off for you! Please take note that our stock is limited only to the luckiest!",
                      style: reguler(
                        sizeFont: 10,
                        colorFont: blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "August 25, 2023 - September 2, 2023",
                    style: reguler(
                      sizeFont: 10,
                      colorFont: blackColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GridView.builder(
                    physics: const ScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.5,
                      mainAxisExtent: 250,
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const ProductCard();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/images/logo.png",
                ),
                radius: 45,
                backgroundColor: lightWhite,
              ),
            ),
          ],
        ),
      ))),
    );
  }
}
