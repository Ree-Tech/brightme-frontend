import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/white_appbar.dart';
import 'package:flutter/material.dart';

class RateProduct extends StatelessWidget {
  const RateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: whiteAppBar(
          context,
          "Rate Product",
          true,
          true,
          () {},
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 36,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        "https://s4.bukalapak.com/img/42747563182/s-463-463/data.png.webp",
                        width: 90,
                        height: 110,
                      )),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Travel Pack - True Brotherrhod",
                        style: medium(
                          colorFont: blackColor,
                          sizeFont: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Product Quality:",
                        style: reguler(
                          colorFont: blackColor,
                          sizeFont: 12,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 9,
                        ),
                        child: Row(
                          children: [
                            for (int i = 0; i < 5; i++)
                              const Icon(
                                Icons.star_rate,
                                color: yellowColor,
                                size: 24,
                              )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                      border: Border.all(color: purpleColor, width: 1),
                      borderRadius: BorderRadius.circular(12)),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'What do you think about this product?',
                        hintStyle: reguler(colorFont: greyColor, sizeFont: 12),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.only(
                          left: 15,
                        )),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
