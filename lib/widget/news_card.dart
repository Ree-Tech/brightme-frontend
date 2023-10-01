import 'package:bright_me/config/route_name.dart';
import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';

class NewsCard extends StatelessWidget {
  final double space;
  const NewsCard({
    Key? key,
    required this.space,
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
                child: Image.network(
                  "https://images.unsplash.com/photo-1519669011783-4eaa95fa1b7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1579&q=80",
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
                    "Hebat! Ini Brand Kecantikan Lokal yang Sudah Go International",
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
