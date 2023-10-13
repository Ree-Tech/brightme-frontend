import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/card_order.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
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
      backgroundColor: purpleColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            titleAppBar: "My Order",
            onPressedFunc: () => Navigator.pop(context),
          ),
        ],
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34),
                  ),
                ),
                child: Column(
                  children: [
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
                              child: Text("Active"),
                            ),
                            Tab(
                              child: Text("Done"),
                            ),
                            Tab(
                              child: Text("Canceled"),
                            ),
                          ]),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 300,
                      child: TabBarView(controller: _tabController, children: [
                        OrderCard(
                          onTapFunc: () {},
                          titleButton: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Track Order",
                                style: semiBold(
                                  colorFont: whiteColor,
                                  sizeFont: 10,
                                ),
                              ),
                              Image.asset(
                                "assets/images/icon_track.png",
                                width: 20,
                                height: 20,
                              )
                            ],
                          ),
                          statusWidget: Material(
                            color: const Color(0xff2FD274),
                            shape: const StadiumBorder(),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3,
                                bottom: 3,
                                left: 6,
                                right: 6,
                              ),
                              child: Text(
                                "Delivery",
                                style: semiBold(
                                  sizeFont: 10,
                                  colorFont: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        OrderCard(
                          onTapFunc: () =>
                              Navigator.pushNamed(context, rateProductName),
                          titleButton: Center(
                            child: Text(
                              "Rate",
                              style: semiBold(
                                colorFont: whiteColor,
                                sizeFont: 10,
                              ),
                            ),
                          ),
                          statusWidget: Material(
                            color: purpleColor,
                            shape: const StadiumBorder(),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 3,
                                bottom: 3,
                                left: 14,
                                right: 14,
                              ),
                              child: Text(
                                "Done",
                                style: semiBold(
                                  sizeFont: 10,
                                  colorFont: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 170,
                          padding: const EdgeInsets.only(
                            top: 17,
                            left: 16,
                            right: 20,
                          ),
                          decoration: BoxDecoration(
                              color: lightWhite,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 8,
                                  color: Color.fromRGBO(0, 0, 0, 0.10),
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order ID : 337420309834",
                                style: reguler(
                                  colorFont: blackColor,
                                  sizeFont: 10,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text:
                                              "Order date : 12 Jul 2022, 17.19",
                                          style: reguler(
                                            sizeFont: 10,
                                            colorFont: greyColor,
                                          ),
                                        ),
                                        TextSpan(
                                          text: " | ",
                                          style: reguler(
                                            colorFont: greyColor,
                                            sizeFont: 12,
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Status : ",
                                          style: reguler(
                                            sizeFont: 10,
                                            colorFont: greyColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Material(
                                        color: cancelOrder,
                                        shape: const StadiumBorder(),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            top: 3,
                                            bottom: 3,
                                            left: 14,
                                            right: 14,
                                          ),
                                          child: Text(
                                            "Cancelled",
                                            style: semiBold(
                                              sizeFont: 10,
                                              colorFont: whiteColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Overdue to pay",
                                        style: reguler(sizeFont: 8),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 14),
                                child: Divider(
                                  color: greyColor,
                                  thickness: 1,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        width: 70,
                                        child: Image.network(
                                          "https://image.femaledaily.com/dyn/210/images/prod-pics/product_1611205581_Powerskin__800x800.jpg",
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 112,
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  "Powerskin Water Charge Moisturizer",
                                                  style: medium(
                                                    colorFont: blackColor,
                                                    sizeFont: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "Qty : 2",
                                            style: reguler(
                                              colorFont: greyColor,
                                              sizeFont: 10,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  Text(
                                    "Rp 218.000",
                                    style: semiBold(
                                      colorFont: purpleColor,
                                      sizeFont: 12,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
