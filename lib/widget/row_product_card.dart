import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

class RowProductCard extends StatefulWidget {
  const RowProductCard({super.key});

  @override
  State<RowProductCard> createState() => _RowProductCardState();
}

class _RowProductCardState extends State<RowProductCard> {
  bool isfavorite = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24), bottomLeft: Radius.circular(24)),
          child: SizedBox(
            width: 90,
            height: 170,
            child: Image.network(
              "https://images.unsplash.com/photo-1519669011783-4eaa95fa1b7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1579&q=80",
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 150,
          height: 170,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24)),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
            color: lightWhite,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15, bottom: 15),
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
    );
  }
}
