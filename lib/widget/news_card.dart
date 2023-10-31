import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';

class NewsCard extends StatelessWidget {
  final double space;
  final String title;
  final String image;
  const NewsCard({
    Key? key,
    required this.space,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, detailNewsRoute),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 14),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 67,
                height: 67,
                child: Image.asset(
                  "assets/images/$image",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: medium(
                      sizeFont: 12,
                      colorFont: blackColor,
                    ),
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: space,
                  ),
                  Text(
                    "Jul 11  5.43 PM",
                    style: reguler(
                      sizeFont: 10,
                      colorFont: greyColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
