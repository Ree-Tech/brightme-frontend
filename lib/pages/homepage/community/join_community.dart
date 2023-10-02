import 'package:action_slider/action_slider.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

class JoinCommunityPage extends StatefulWidget {
  const JoinCommunityPage({super.key});

  @override
  State<JoinCommunityPage> createState() => _JoinCommunityPageState();
}

class _JoinCommunityPageState extends State<JoinCommunityPage> {
  // to navigate grup info page
  handleSubmit() {
    Navigator.pushNamed(context, communityProfileRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                          )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset(
                      "assets/images/comunity2.png",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30, left: 30, right: 30, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset("assets/images/user_community.jpg"),
                          SizedBox(
                            width: 140,
                            child: CustomButton(
                              onPressed: () {},
                              childWidget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon:
                                          const Icon(Icons.check_box_rounded)),
                                  Text(
                                    "You joined",
                                    style: medium(
                                      colorFont: lightWhite,
                                      sizeFont: 11,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        top: 25,
                        left: 30,
                        right: 30,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                        color: lightPuprle,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Surabaya Bright Me",
                                style: semiBold(
                                  sizeFont: 20,
                                ),
                              ),
                              Image.asset(
                                "assets/images/icon_chat.png",
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 14),
                            child: Divider(
                              thickness: 1,
                              color: purpleColor,
                            ),
                          ),
                          Text(
                            "Descriptions",
                            style: medium(
                              sizeFont: 14,
                              colorFont: darGreykColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 6,
                              bottom: 28,
                            ),
                            child: Text(
                              "This community is a place to grow with its members so that they can successfully bring local products...",
                              style: medium(
                                sizeFont: 14,
                                colorFont: greyColor,
                              ),
                              softWrap: true,
                            ),
                          ),
                          Center(
                            child: ActionSlider.standard(
                              width: 300.0,
                              height: 48,
                              backgroundColor: purpleColor,
                              toggleColor: whiteColor,
                              action: (controller) async {
                                controller.loading(); //starts loading animation
                                await Future.delayed(
                                    const Duration(seconds: 3));
                                controller.success(); //starts success animation
                                await Future.delayed(
                                    const Duration(seconds: 1));
                                controller.reset(); //resets the slider
                                handleSubmit();
                              },
                              child: Text(
                                "Swipe and Let's go",
                                style: semiBold(
                                    sizeFont: 16, colorFont: whiteColor),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.1,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
