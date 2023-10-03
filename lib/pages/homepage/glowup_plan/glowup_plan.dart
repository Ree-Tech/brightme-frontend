import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/glowup_plan_data.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/modal_widget.dart';
import 'package:flutter/material.dart';

class GlowUpPlanPage extends StatelessWidget {
  const GlowUpPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 100),
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Unlock Your\nGlowUp Plan",
                    style: medium(
                      sizeFont: 32,
                      colorFont: blackColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    child: Text(
                      "Choose your subscription plan",
                      style: reguler(
                        sizeFont: 16,
                        colorFont: greyColor,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: planData
                            .map(
                              (item) => Container(
                                width: 270,
                                height: 332,
                                margin: const EdgeInsets.only(
                                  right: 24,
                                  left: 5,
                                  top: 15,
                                  bottom: 15,
                                ),
                                padding: const EdgeInsets.only(
                                  top: 25,
                                  bottom: 20,
                                  left: 12,
                                  right: 12,
                                ),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(24),
                                    border: Border.all(
                                      width: 1,
                                      color: purpleColor,
                                    )),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Column(
                                      children: [
                                        Text(
                                          item['name']!,
                                          style: bold(
                                            colorFont: purpleColor,
                                            sizeFont: 16,
                                          ),
                                        ),
                                        Text(
                                          item['price']!,
                                          style: bold(
                                            colorFont: purpleColor,
                                            sizeFont: 14,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 26,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "Full access to GlowUp Plan feature\nRewards system\nSave the statistics",
                                            style: reguler(sizeFont: 12),
                                          ),
                                        ),
                                      ],
                                    )),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: SizedBox(
                                        width: 145,
                                        child: CustomButton(
                                          buttonText: '1 month free',
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              backgroundColor:
                                                  Colors.transparent,
                                              isScrollControlled: true,
                                              context: context,
                                              builder: (context) {
                                                return ModalBottomWidget(
                                                  childrenWidget: modalWidget(
                                                    item['name']!,
                                                    item['price']!,
                                                    context,
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList()),
                  ),
                  const Text("Maybe later",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                          color: purpleColor))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> modalWidget(
    String planName,
    String price,
    BuildContext context,
  ) =>
      [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Check details",
                style: semiBold(
                  sizeFont: 18,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 21,
                  bottom: 24,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/icon_glowup.jpg",
                      width: 42,
                      height: 42,
                    ),
                    const SizedBox(
                      width: 34,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "GlowUp Plan",
                          style: semiBold(
                            sizeFont: 16,
                          ),
                        ),
                        Text(
                          planName,
                          style: reguler(
                            colorFont: purpleColor,
                            sizeFont: 12,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xffF3F4F6),
          thickness: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Starting today",
                style: reguler(
                  sizeFont: 16,
                ),
              ),
              Text(
                "30-day free trial",
                style: reguler(
                  sizeFont: 16,
                ),
              )
            ],
          ),
        ),
        const Divider(
          color: Color(0xffF3F4F6),
          thickness: 8,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Starting Dec 7, 2022",
                    style: reguler(
                      sizeFont: 16,
                    ),
                  ),
                  Text(
                    price,
                    style: reguler(
                      sizeFont: 16,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: bold(
                      sizeFont: 16,
                    ),
                  ),
                  Text(
                    "Rp 410.000",
                    style: bold(
                      sizeFont: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Color(0xffF3F4F6),
          thickness: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: CustomButton(
            onPressed: () => Navigator.pushNamed(context, paymentRoute),
            buttonText: "Confirmation",
          ),
        )
      ];
}
