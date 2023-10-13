import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/product_const.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/review_card.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class DetailProductPage extends StatefulWidget {
  const DetailProductPage({super.key});

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage>
    with SingleTickerProviderStateMixin {
  int _carrouselIndex = 0;
  bool isfavorite = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();

    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPuprle,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.3,
                  child: Stack(
                    children: [
                      SizedBox(
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            viewportFraction: 1,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _carrouselIndex = index;
                              });
                            },
                          ),
                          itemCount: 3,
                          itemBuilder: (
                            BuildContext context,
                            int itemIndex,
                            int pageViewIndex,
                          ) =>
                              Image.asset("assets/images/product_detail.png"),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: DotsIndicator(
                          dotsCount: 3,
                          position: _carrouselIndex,
                          decorator: DotsDecorator(
                            size: const Size.square(4),
                            color: greyColor,
                            activeColor: purpleColor,
                            activeSize: const Size(47, 4),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topRight,
                          child: ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              style: ElevatedButton.styleFrom(
                                  shadowColor:
                                      const Color.fromRGBO(0, 0, 0, 0.25),
                                  backgroundColor:
                                      const Color.fromRGBO(186, 160, 202, 0.50),
                                  fixedSize: const Size(24, 24),
                                  shape: const CircleBorder()),
                              child: const Icon(
                                Icons.close,
                                color: lightWhite,
                              )))
                    ],
                  ),
                ),
                Container(
                  color: lightWhite,
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Stok: 8",
                            style: reguler(
                              sizeFont: 14,
                              colorFont: purpleColor,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isfavorite = !isfavorite;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: whiteColor,
                                  fixedSize: const Size(32, 32),
                                  shape: const CircleBorder()),
                              child: isfavorite
                                  ? const Icon(
                                      Icons.favorite,
                                      color: purpleColor,
                                      size: 20,
                                    )
                                  : const Icon(
                                      Icons.favorite_outline,
                                      color: purpleColor,
                                      size: 20,
                                    )),
                        ],
                      ),
                      SizedBox(
                        height: 47,
                        width: 200,
                        child: Wrap(
                          children: [
                            Text(
                              "Natural Daily Aloe Hydramild Gel ",
                              style: medium(
                                sizeFont: 16,
                                colorFont: blackColor,
                              ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 55,
                            width: 200,
                            child: Wrap(
                              children: [
                                Text(
                                  "Nourishing beard, energizin and brightening face, hair and body wash, Leaflet",
                                  style: reguler(
                                    sizeFont: 12,
                                    colorFont: greyColor,
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
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
                        ],
                      ),
                      SizedBox(
                        height: 40,
                        child: TabBar(
                            controller: _tabController,
                            labelColor: whiteColor,
                            unselectedLabelColor: purpleColor,
                            indicator: BoxDecoration(
                              color: tabColorOrder,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            tabs: const [
                              Tab(
                                child: Text("Description"),
                              ),
                              Tab(
                                child: Text("Reviews"),
                              ),
                              Tab(
                                child: Text("Usage"),
                              ),
                            ]),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: 300,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            SizedBox(
                              child: Wrap(
                                children: [
                                  Text.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text:
                                            "A multi-functional gel containing natural Aloe vera that provides extra moisture with a soothing effect and cools dry and reddened skin from the sun. Its unique, light, and non-sticky formula works as an anti-irritant, anti-inflammatory, as a soothing agent for sunburned skin, and helps increase skin resistance (skin barrier).  80% ALCOHOL ANTIBACTERIAL FORMULA, HYDRAMILD ALOE VERA EXTRACT, GLYCERIN. Aqua, Propylene Glycol, Beta-Glucan, Glycerin...",
                                        style: medium(
                                          sizeFont: 12,
                                          colorFont: greyColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "  View more",
                                        style: medium(
                                          sizeFont: 12,
                                          colorFont: purpleColor,
                                        ),
                                      )
                                    ]),
                                  ),
                                ],
                              ),
                            ),
                            // saya ingin item ini dapat discroll dengan parent
                            ListView(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional.centerEnd,
                                    child: SizedBox(
                                      width: 130,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: yellowColor,
                                          ),
                                          Text(
                                            "4.9",
                                            style: medium(
                                              colorFont: yellowColor,
                                              sizeFont: 14,
                                            ),
                                          ),
                                          Text(
                                            "(99 Reviews)",
                                            style: medium(
                                              colorFont: greyColor,
                                              sizeFont: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: reviewProductData
                                        .take(3)
                                        .map((item) => CardReviewWidget(
                                            image: item['image']!,
                                            personName: item['name']!,
                                            date: item['date']!,
                                            content: item['content']!))
                                        .toList(),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 15,
                                      ),
                                      child: Text(
                                        "View more",
                                        style: medium(
                                          sizeFont: 16,
                                          colorFont: purpleColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                  )
                                ]),
                            ListView(
                              children: [
                                Column(
                                    children: usageData
                                        .map(
                                          (item) => Align(
                                            alignment:
                                                AlignmentDirectional.topStart,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                bottom: 10,
                                              ),
                                              child: Wrap(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        item['title']!,
                                                        style: medium(
                                                          sizeFont: 12,
                                                          colorFont: greyColor,
                                                        ),
                                                      ),
                                                      Text(
                                                        item['content']!,
                                                        style: reguler(
                                                          sizeFont: 12,
                                                          colorFont: greyColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList()),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.1,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: const EdgeInsets.all(24),
                color: lightWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(160, 48),
                          side: const BorderSide(
                            color: purpleColor,
                            width: 1,
                          ),
                          shape: const StadiumBorder()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart_outlined,
                            color: purpleColor,
                            size: 24,
                          ),
                          Text(
                            "Add to Cart",
                            style: semiBold(
                              colorFont: purpleColor,
                              sizeFont: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: CustomButton(
                        onPressed: () {},
                        buttonText: "Buy Now",
                      ),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }
}
