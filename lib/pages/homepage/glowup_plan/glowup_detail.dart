import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

class GlowUpPlanDetailPage extends StatelessWidget {
  const GlowUpPlanDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            titleAppBar: "GlowUp Plan",
            onPressedFunc: () => Navigator.pop(context),
            actionList: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(right: 15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications_sharp,
                    color: purpleColor, // Warna ikon
                  ),
                  onPressed: () => Navigator.pushNamed(context, notifGlowUp),
                ),
              ),
            ],
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
                  Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            "assets/images/face2.png",
                            width: 200,
                            height: 200,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 4),
                          child: Text(
                            "Week 2 ",
                            style: semiBold(
                              sizeFont: 18,
                            ),
                          ),
                        ),
                        Text(
                          "March 13, 2023",
                          style: reguler(
                            sizeFont: 12,
                            colorFont: purpleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 90,
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 30,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          width: 1,
                          color: purpleColor,
                        ),
                        color: lightWhite),
                    child: Text(
                      "Oh no!\nYour skin seems to be misbehaving",
                      textAlign: TextAlign.center,
                      style: semiBold(
                        sizeFont: 16,
                        colorFont: purpleColor,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 30,
                        color: purpleColor,
                        margin: const EdgeInsets.only(right: 14),
                      ),
                      Text(
                        "Reports ",
                        style: semiBold(
                          colorFont: purpleColor,
                          sizeFont: 16,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 31,
                    ),
                    child: Wrap(children: [
                      Text(
                        "Your skin condition is quite concerning and needs attention. \n1.There are a lot of acne.\n2.The color of acne is red.\n3.There are also acne scars\n4.There are a few wrinkles on the face.\n5.The skin looks oily.",
                        softWrap: true,
                        style: reguler(
                          sizeFont: 12,
                        ),
                      ),
                    ]),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 30,
                        color: purpleColor,
                        margin: const EdgeInsets.only(right: 14),
                      ),
                      Text(
                        "Causes Revealed!",
                        style: semiBold(
                          colorFont: purpleColor,
                          sizeFont: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 31,
                    ),
                    child: Wrap(children: [
                      Text(
                        "Here are some aspects that require close attention.\n1.Allergies or sensitivities to certain skincare or cosmetic products\n2.Stress and lack of sleep\n3.Dryness and dehydration\n4.Lack of proper skincare routine\n5.Unhealthy diet and poor nutrition",
                        softWrap: true,
                        style: reguler(
                          sizeFont: 12,
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.all(14),
                    margin: const EdgeInsets.only(
                      top: 20,
                      bottom: 30,
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          width: 1,
                          color: purpleColor,
                        ),
                        color: lightWhite),
                    child: Column(
                      children: [
                        Text(
                          "Fix Your Condition",
                          textAlign: TextAlign.center,
                          style: semiBold(
                            sizeFont: 16,
                            colorFont: purpleColor,
                          ),
                        ),
                        Flexible(
                            child: Text(
                          "The following skin treatments can help you maintain your skin in a more optimal way.\n1.Wash problem areas with a gentle cleanser. \n2.Try over-the-counter acne products to dry excess oil and promote peeling.\n3.Avoid irritants.\n4.Protect your skin from the sun.\n5.Avoid friction or pressure on your skin.\n6.Avoid touching or picking acne-prone areas.\n7.Shower after strenuous activities.",
                          softWrap: true,
                          style: reguler(
                            sizeFont: 12,
                          ),
                        )),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 30,
                        color: purpleColor,
                        margin: const EdgeInsets.only(right: 14),
                      ),
                      Text(
                        "Need more help?",
                        style: semiBold(
                          colorFont: purpleColor,
                          sizeFont: 16,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      bottom: 31,
                    ),
                    child: Wrap(children: [
                      Text(
                        "Reach out to the experts for their expert advice and guidance.",
                        softWrap: true,
                        style: reguler(
                          sizeFont: 12,
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, personalConsulRoute),
                    childWidget: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/maki_doctor2.png",
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "Personal Consultation",
                          style: semiBold(
                            colorFont: whiteColor,
                            sizeFont: 16,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
