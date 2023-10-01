import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: boxShadow,
        color: lightWhite,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 130,
                width: 150,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24)),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1519669011783-4eaa95fa1b7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1579&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: purpleColor,
                    ),
                    child: Text(
                      '20% OFF',
                      style: semiBold(
                        colorFont: whiteColor,
                        sizeFont: 10,
                      ),
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 3, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Natural Daily Aloe Hydramild Gel ",
                  style: medium(
                    colorFont: blackColor,
                    sizeFont: 12,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Wardah",
                  style: reguler(
                    sizeFont: 10,
                    colorFont: greyColor,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_sharp,
                      color: yellowColor,
                      size: 12,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      "5.0",
                      style: medium(
                        colorFont: yellowColor,
                        sizeFont: 10,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Rp35.100",
                          style: semiBold(
                            colorFont: purpleColor,
                            sizeFont: 12,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text("Rp74.000",
                            style: TextStyle(
                              fontSize: 10,
                              color: greyColor,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: purpleColor,
                            ))
                      ],
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isfavorite = !isfavorite;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: whiteColor,
                            fixedSize: const Size(13, 13),
                            shape: const CircleBorder()),
                        child: isfavorite
                            ? const Icon(
                                Icons.favorite,
                                color: purpleColor,
                                size: 13,
                              )
                            : const Icon(
                                Icons.favorite_outline,
                                color: purpleColor,
                                size: 13,
                              ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
