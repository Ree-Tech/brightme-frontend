import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/product_card.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            toolbarHeight: 200,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            elevation: 0,
            backgroundColor: purpleColor,
            title: Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop",
                    style: semiBold(sizeFont: 20, colorFont: lightWhite),
                  ),
                  SizedBox(
                    width: 192,
                    child: Row(
                      children: [
                        iconAppBar(Icons.favorite_outline_outlined, () {
                          Navigator.pushNamed(context, likedProductRoute);
                        }),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, orderProductRoute);
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: whiteColor,
                                fixedSize: const Size(32, 32),
                                shape: const CircleBorder()),
                            child: Image.asset(
                              "assets/images/icon_clipboard.jpg",
                              width: 24,
                              height: 24,
                            )),
                        iconAppBar(Icons.shopping_cart_outlined, () {
                          Navigator.pushNamed(context, cartPageRoute);
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
            flexibleSpace: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 30, right: 30, bottom: 30, top: 50),
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  height: 40,
                  decoration: BoxDecoration(
                    color: lightWhite,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.search,
                        color: greyColor,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Search",
                        style: reguler(
                          sizeFont: 12,
                          colorFont: greyColor,
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Special Offer',
                  style: semiBold(
                    sizeFont: 16,
                    colorFont: blackColor,
                  ),
                ),
              ),
              Container(
                height: 130,
                decoration: BoxDecoration(
                    color: lightWhite,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: boxShadow),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)),
                      child: SizedBox(
                        height: 130,
                        width: 140,
                        child: Image.network(
                          'https://s4.bukalapak.com/img/42747563182/s-463-463/data.png.webp',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      width: 190,
                      height: 170,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(24),
                            bottomRight: Radius.circular(24)),
                        color: lightWhite,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 15, bottom: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Travel Pack - True Brotherrhod ",
                              style: medium(
                                colorFont: blackColor,
                                sizeFont: 12,
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              "Nourishing beard, energizin and brightening face, hair and body wash, Leaflet",
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        popularProductRoute,
                      ),
                      child: Text(
                        'View More',
                        style: medium(
                          sizeFont: 12,
                          colorFont: greyColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCard(),
                  ProductCard(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 23),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Arrivals',
                      style: semiBold(
                        sizeFont: 16,
                        colorFont: blackColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, newArrivalsRoute),
                      child: Text(
                        'View More',
                        style: medium(
                          sizeFont: 12,
                          colorFont: greyColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductCard(),
                  ProductCard(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  'Discover All Products',
                  style: semiBold(
                    sizeFont: 16,
                    colorFont: blackColor,
                  ),
                ),
              ),
              GridView.builder(
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  mainAxisExtent: 250,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemCount: 4,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const ProductCard();
                },
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconAppBar(
    IconData icon,
    void Function()? onpressFunc,
  ) {
    return ElevatedButton(
        onPressed: onpressFunc,
        style: ElevatedButton.styleFrom(
            backgroundColor: whiteColor,
            fixedSize: const Size(32, 32),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: const CircleBorder()),
        child: Icon(
          icon,
          color: purpleColor,
        ));
  }
}
