import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/news_card.dart';

import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 200,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 80,
              ),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  )),
            ),
            backgroundColor: purpleColor,
            title: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 80,
              ),
              child: Text(
                "News",
                style: semiBold(
                  sizeFont: 20,
                  colorFont: whiteColor,
                ),
              ),
            ),
            flexibleSpace: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 268,
                        height: 32,
                        child: TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: lightWhite,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: greyColor,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                width: 1,
                                color: greyColor,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            hintText: "Search",
                            hintStyle: medium(
                              sizeFont: 14,
                              colorFont: greyColor,
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 12),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: greyColor,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: whiteColor,
                              fixedSize: const Size(24, 24),
                              shape: const CircleBorder()),
                          child: const Icon(
                            Icons.tune_rounded,
                            color: purpleColor,
                          ))
                    ],
                  ),
                )),
          )
        ],
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return const NewsCard(
                space: 8,
              );
            },
          ),
        ),
      ),
    );
  }
}
