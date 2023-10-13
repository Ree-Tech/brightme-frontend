import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/card_product_cart.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: purpleColor,
        body: CustomScrollView(slivers: [
          CustomAppBar(
            titleAppBar: "My Cart",
            onPressedFunc: () => Navigator.pop(context),
          ),
          SliverToBoxAdapter(
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 30,
                ),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34)),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          CartProductCard(
                            image:
                                'https://s4.bukalapak.com/img/42747563182/s-463-463/data.png.webp',
                            name: "Travel Pack - True Brotherrhod ",
                            subName:
                                "Nourishing beard, energizin and brightening face, hair and body wash, Leaflet",
                            price: "Rp 59.850",
                          ),
                          CartProductCard(
                            image:
                                'https://s3-ap-southeast-1.amazonaws.com/img-sociolla/img/p/2/2/6/0/4/22604-large_default.jpg',
                            name: "Ms. Pimple Face Toner",
                            subName: "Emina 50 ml",
                            price: "Rp 23.000",
                          ),
                          CartProductCard(
                            image:
                                'https://s3-ap-southeast-1.amazonaws.com/img-sociolla/img/p/2/5/4/0/3/25403-large_default.jpg',
                            name: "Powerskin Water Charge Moisturizer",
                            subName: "Make Over 42 ml",
                            price: "Rp 109.000",
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Color(0xffF3F4F6),
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Sub Total",
                                style: reguler(sizeFont: 16),
                              ),
                              Text(
                                "Rp 119.700",
                                style: reguler(
                                  sizeFont: 16,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 27),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Discount",
                                  style: reguler(
                                    sizeFont: 16,
                                    colorFont: discountColor,
                                  ),
                                ),
                                Text(
                                  "-Rp 28.300",
                                  style: reguler(
                                    sizeFont: 16,
                                    colorFont: discountColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: bold(
                                    sizeFont: 16,
                                  ),
                                ),
                                Text(
                                  "Rp 91.400",
                                  style: bold(
                                    sizeFont: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(
                        color: Color(0xffF3F4F6),
                        thickness: 10,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: CustomButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, orderConfirmRoute),
                        buttonText: "Checkout",
                      ),
                    )
                  ],
                )),
          ),
        ]));
  }
}
