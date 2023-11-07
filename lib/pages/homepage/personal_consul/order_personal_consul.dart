import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/pages/homepage/personal_consul/modal_detail_consul.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/modal_widget.dart';
import 'package:flutter/material.dart';

class OrderPersonalConsulPage extends StatefulWidget {
  const OrderPersonalConsulPage({super.key});

  @override
  State<OrderPersonalConsulPage> createState() =>
      _OrderPersonalConsulPageState();
}

class _OrderPersonalConsulPageState extends State<OrderPersonalConsulPage>
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
            titleAppBar: "Personal Consul",
            onPressedFunc: () => Navigator.pushNamedAndRemoveUntil(
                context, appRoute, (route) => false),
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
                      height: 400,
                      child: TabBarView(controller: _tabController, children: [
                        activeTab(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            doneTab(
                              "Consultation 10948374",
                              "10 Jul 2022, 12.49",
                              "assets/images/doctor6.jpg",
                              "Dr. Clara Clarin Lius, Sp.DV",
                              "235.1/6342/spdv/II/2016",
                            ),
                            doneTab(
                              "Consultation 18273092",
                              "23 Feb 2022, 09.35",
                              "assets/images/doctor7.jpg",
                              "Dr. Edward Wilson, Sp.KK",
                              "123.2/7234/spkk/V/2011",
                            ),
                          ],
                        ),
                        cancelTab(),
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

  Widget activeTab() => Align(
        alignment: Alignment.topCenter,
        child: Container(
          height: 110,
          margin: const EdgeInsets.only(
            top: 30,
            left: 4,
            right: 4,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 25,
          ),
          decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: whiteColor,
              borderRadius: BorderRadius.circular(34)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/doctor5.jpg"),
                radius: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Carly Ely, Sp.DV",
                    style: semiBold(
                      sizeFont: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "446.1/8468/spdv/x/2010",
                    style: reguler(
                      colorFont: purpleColor,
                      sizeFont: 12,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, chatConsulRoute),
                child: Image.asset(
                  "assets/images/icon_chat.png",
                  width: 42,
                  height: 42,
                ),
              )
            ],
          ),
        ),
      );

  Widget doneTab(
    String id,
    String date,
    String image,
    String name,
    String idDoctor,
  ) =>
      GestureDetector(
        onTap: () async {
          await showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return ModalBottomWidget(
                  maxModalHeight: 0.83,
                  borderRadius: 34,
                  childrenWidget: modalDetailConfirm(
                    context,
                    id,
                    date,
                    image,
                    name,
                    idDoctor,
                  ));
            },
          );
        },
        child: Container(
          height: 160,
          margin: const EdgeInsets.only(
            top: 30,
            left: 4,
            right: 4,
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 22,
            horizontal: 25,
          ),
          decoration: BoxDecoration(
              boxShadow: boxShadow,
              color: whiteColor,
              borderRadius: BorderRadius.circular(34)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    id,
                    style: reguler(
                      colorFont: blackColor,
                      sizeFont: 10,
                    ),
                  ),
                  Text(
                    date,
                    style: reguler(
                      sizeFont: 10,
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 7,
                  bottom: 14,
                ),
                child: Divider(
                  color: greyColor,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(image),
                    radius: 25,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: semiBold(
                          sizeFont: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        idDoctor,
                        style: reguler(
                          colorFont: purpleColor,
                          sizeFont: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
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
                  ),
                ],
              ),
            ],
          ),
        ),
      );

  Widget cancelTab() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/cancel_consul.jpg"),
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 4,
            ),
            child: Text(
              "You haven't canceled any consultations",
              style: medium(
                sizeFont: 14,
                colorFont: blackColor,
              ),
            ),
          ),
          Text(
            "consult our doctor to get a solution for\nyour skin problems",
            style: reguler(
              sizeFont: 14,
              colorFont: blackColor,
            ),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 17,
            ),
            child: Text(
              "Check our consulting service",
              style: medium(
                colorFont: purpleColor,
                sizeFont: 14,
              ),
            ),
          )
        ],
      );
}
