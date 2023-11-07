import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

class RowProductCard extends StatefulWidget {
  final String name;
  final String image;
  const RowProductCard({
    required this.name,
    required this.image,
    super.key,
  });

  @override
  State<RowProductCard> createState() => _RowProductCardState();
}

class _RowProductCardState extends State<RowProductCard> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 170,
      child: Row(
        children: [
          Container(
            width: 90,
            height: 170,
            decoration: BoxDecoration(
              color: lightPuprle,
              boxShadow: boxShadow,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24)),
            ),
            child: Image.asset(
              widget.image,
              fit: BoxFit.contain,
            ),
          ),
          Container(
            width: 150,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
              color: lightWhite,
              boxShadow: boxShadow,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: 70,
                          child: CustomButton(
                              buttonText: "Detail",
                              heightButton: 20,
                              sizeFont: 12,
                              onPressed: () {})),
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isfavorite = !isfavorite;
                            });
                          },
                          style: IconButton.styleFrom(
                              backgroundColor: whiteColor,
                              fixedSize: const Size(16, 16),
                              shape: const CircleBorder()),
                          child: isfavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: purpleColor,
                                  size: 16,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: purpleColor,
                                  size: 16,
                                ))
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
