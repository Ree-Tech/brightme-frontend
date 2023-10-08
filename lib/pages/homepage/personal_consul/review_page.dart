import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/review_data.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/review_card.dart';
import 'package:flutter/material.dart';

class ReviewDoctorPage extends StatefulWidget {
  const ReviewDoctorPage({Key? key}) : super(key: key);

  @override
  State<ReviewDoctorPage> createState() => _ReviewDoctorPageState();
}

class _ReviewDoctorPageState extends State<ReviewDoctorPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
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
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            titleAppBar: "Doctor Reviews",
            onPressedFunc: () => Navigator.pop(context),
          ),
          SliverToBoxAdapter(
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
                  TabBar(
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: whiteColor,
                      unselectedLabelColor: purpleColor,
                      indicator: BoxDecoration(
                        color: purpleColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      tabs: [
                        Container(
                          width: 80,
                          height: 30,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: purpleColor,
                              )),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: _tabController.index == 0
                                    ? whiteColor
                                    : yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("All")
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: purpleColor,
                              )),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: _tabController.index == 1
                                    ? whiteColor
                                    : yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("5")
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: purpleColor,
                              )),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: _tabController.index == 2
                                    ? whiteColor
                                    : yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("4")
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: purpleColor,
                              )),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: _tabController.index == 3
                                    ? whiteColor
                                    : yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("3")
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: purpleColor,
                              )),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: _tabController.index == 4
                                    ? whiteColor
                                    : yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("2")
                            ],
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          padding: const EdgeInsets.only(left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: 1,
                                color: purpleColor,
                              )),
                          child: Row(
                            children: [
                              Icon(
                                Icons.star_rate,
                                color: _tabController.index == 5
                                    ? whiteColor
                                    : yellowColor,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text("1")
                            ],
                          ),
                        ),
                      ]),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1.1,
                    child: TabBarView(controller: _tabController, children: [
                      reviewSection(),
                      reviewSection(),
                      reviewSection(),
                      reviewSection(),
                      reviewSection(),
                      reviewSection(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget reviewSection() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Reviews",
                style: medium(
                  sizeFont: 16,
                  colorFont: blackColor,
                ),
              ),
              SizedBox(
                width: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            ],
          ),
          Column(
            children: reviewData
                .map((item) => CardReviewWidget(
                    image: item['image']!,
                    personName: item['name']!,
                    date: item['date']!,
                    content: item['content']!))
                .toList(),
          )
        ],
      );
}
