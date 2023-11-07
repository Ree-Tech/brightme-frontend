import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/models/product.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  const ProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(
        context,
        productDetailRoute,
        arguments: widget.product,
      ),
      child: Container(
        height: 270,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          boxShadow: boxShadow,
          color: lightWhite,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Material(
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 130,
                      width: 155,
                      color: lightPuprle,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24)),
                        child: Image.network(
                          widget.product.productImages[0].img,
                          fit: BoxFit.none,
                        ),
                      ),
                    ),
                    Positioned(
                        right: 8,
                        top: 8,
                        child: Visibility(
                          visible: !widget.product.hasDiscount(),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: purpleColor,
                            ),
                            child: Text(
                              '${widget.product.discount}% OFF',
                              style: semiBold(
                                colorFont: whiteColor,
                                sizeFont: 10,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
                Expanded(
                  child: Container(
                    color: lightWhite,
                    padding: const EdgeInsets.only(left: 15, right: 3, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                          child: Text(
                            widget.product.name,
                            style: medium(
                              colorFont: blackColor,
                              sizeFont: 12,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.product.brand,
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
                            !widget.product.hasDiscount()
                                ? discountPriceWidget()
                                : normalPriceWidget(),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget normalPriceWidget() {
    return Text(
      "Rp ${widget.product.productVariations[0].price}",
      style: semiBold(
        colorFont: purpleColor,
        sizeFont: 12,
      ),
    );
  }

  Widget discountPriceWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Rp ${widget.product.discountPrice(0)}",
          style: semiBold(
            colorFont: purpleColor,
            sizeFont: 12,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text("Rp ${widget.product.productVariations[0].price}",
            style: const TextStyle(
              fontSize: 10,
              color: greyColor,
              decoration: TextDecoration.lineThrough,
              decorationColor: purpleColor,
            ))
      ],
    );
  }
}
