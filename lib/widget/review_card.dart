import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';

class CardReviewWidget extends StatelessWidget {
  final String image;
  final String personName;
  final String date;
  final String content;
  const CardReviewWidget({
    Key? key,
    required this.image,
    required this.personName,
    required this.date,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      margin: const EdgeInsets.only(
        top: 16,
      ),
      padding: const EdgeInsets.only(
        top: 18,
        bottom: 14,
        left: 24,
        right: 4,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: boxShadow,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(
                  image,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    personName,
                    style: semiBold(
                      colorFont: blackColor,
                      sizeFont: 14,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Text(
                        date,
                        style: semiBold(
                          sizeFont: 12,
                          colorFont: greyColor,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Icon(Icons.fiber_manual_record,
                            color: greyColor, size: 9),
                      ),
                      SizedBox(
                        width: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 5; i++)
                              const Icon(
                                Icons.star_rate,
                                color: yellowColor,
                                size: 9,
                              )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          "(5.0)",
                          style: semiBold(
                            sizeFont: 12,
                            colorFont: purpleColor,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Wrap(
              children: [
                Text(
                  content,
                  style: reguler(
                    sizeFont: 12,
                    colorFont: blackColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
