import 'package:bright_me/bloc/product/product_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/home_fitur_data.dart';
import 'package:bright_me/constants/news_const.dart';
import 'package:bright_me/models/product.dart';
import 'package:bright_me/models/user.dart';
import 'package:bright_me/widget/loading_wigdet.dart';
import 'package:bright_me/widget/news_card.dart';
import 'package:bright_me/widget/product_card.dart';
import 'package:bright_me/widget/snackbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.3,
            decoration: const BoxDecoration(
              color: purpleColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(34),
                bottomRight: Radius.circular(34),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 30,
                right: 30,
                left: 30,
                bottom: 11,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundImage: AssetImage(
                              "assets/images/user.jpg",
                            ),
                            radius: 24,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hello,",
                                style: medium(
                                  sizeFont: 12,
                                  colorFont: whiteColor,
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                currUser.name ?? "",
                                style: semiBold(
                                  sizeFont: 14,
                                  colorFont: whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, cartPageRoute),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: whiteColor,
                              fixedSize: const Size(32, 32),
                              shape: const CircleBorder()),
                          child: const Icon(
                            Icons.shopping_cart_outlined,
                            color: purpleColor,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Let's Grow ",
                            style: reguler(
                              colorFont: whiteColor,
                              sizeFont: 18,
                            )),
                        TextSpan(
                          text: "Together",
                          style: bold(
                            colorFont: whiteColor,
                            sizeFont: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: "Support ",
                            style: reguler(
                              colorFont: whiteColor,
                              sizeFont: 18,
                            )),
                        TextSpan(
                          text: "Local ",
                          style: bold(
                            colorFont: whiteColor,
                            sizeFont: 18,
                          ),
                        ),
                        TextSpan(
                            text: "Products! ",
                            style: reguler(
                              colorFont: whiteColor,
                              sizeFont: 18,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
            child: Column(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: homeFiturData
                        .map(
                          (item) => GestureDetector(
                            onTap: () =>
                                Navigator.pushNamed(context, item['route']!),
                            child: Column(
                              children: [
                                Image.asset(
                                  item['image']!,
                                  height: 42,
                                  width: 42,
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  item['title']!,
                                  style: medium(
                                      sizeFont: 10, colorFont: blackColor),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Special for you',
                        style: semiBold(
                          sizeFont: 16,
                          colorFont: blackColor,
                        ),
                      ),
                      Text(
                        'View More',
                        style: medium(
                          sizeFont: 12,
                          colorFont: greyColor,
                        ),
                      )
                    ],
                  ),
                ),
                const CarouselWidget(),
                BlocConsumer<ProductBloc, ProductState>(
                  listener: (context, state) {
                    if (state is AllProductEror) {
                      showSnackBar(context, "Fail get product");
                    }
                  },
                  builder: (context, state) {
                    if (state is AllProductLoading) {
                      return const LoadingWidget();
                    } else if (state is AllProductSucces) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 23),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Popular products',
                                  style: semiBold(
                                    sizeFont: 16,
                                    colorFont: blackColor,
                                  ),
                                ),
                                Text(
                                  'View More',
                                  style: medium(
                                    sizeFont: 12,
                                    colorFont: greyColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ProductCard(product: populerProduct[0]),
                              ProductCard(product: populerProduct[1]),
                            ],
                          ),
                        ],
                      );
                    }
                    return Container();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About local & halal products',
                      style: semiBold(
                        sizeFont: 16,
                        colorFont: blackColor,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 206,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: const [
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
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 28,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 13, bottom: 10),
                            child: GestureDetector(
                              onTap: () =>
                                  Navigator.pushNamed(context, newsRoute),
                              child: Text(
                                'View More',
                                style: medium(
                                  sizeFont: 12,
                                  colorFont: purpleColor,
                                ),
                              ),
                            )),
                        NewsCard(
                          title: newsConst[0]["title"]!,
                          image: newsConst[0]["image"]!,
                          space: 3,
                        ),
                        NewsCard(
                          title: newsConst[1]["title"]!,
                          image: newsConst[1]["image"]!,
                          space: 3,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _carrouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _carrouselIndex = index;
                  });
                },
              ),
              itemCount: 3,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      GestureDetector(
                          onTap: () =>
                              Navigator.pushNamed(context, spesialProductRoute),
                          child: Image.asset("assets/images/slider.jpg"))),
        ),
        DotsIndicator(
          dotsCount: 3,
          position: _carrouselIndex,
          decorator: DotsDecorator(
            size: const Size.square(4),
            color: greyColor,
            activeColor: purpleColor,
            activeSize: const Size(47, 4),
            activeShape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
        ),
      ],
    );
  }
}
