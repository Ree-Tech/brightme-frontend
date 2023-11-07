import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:flutter/material.dart';

class GlowUpEduDetail extends StatelessWidget {
  const GlowUpEduDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 424,
              child: Column(
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                    ),
                    child: SafeArea(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 20,
                            left: 30,
                            child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: whiteColor,
                                )),
                          ),
                          Positioned(
                            top: 30,
                            left: 120,
                            child: Text(
                              "GlowUp Education",
                              style: semiBold(
                                sizeFont: 20,
                                colorFont: whiteColor,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 123,
                            right: 60,
                            child: Image.asset(
                              "assets/images/icon_cirlce.png",
                              width: 36,
                              height: 36,
                            ),
                          ),
                          Positioned(
                            bottom: 70,
                            left: 40,
                            child: Image.asset(
                              "assets/images/icon_cirlce.png",
                              width: 21,
                              height: 21,
                            ),
                          ),
                          Positioned(
                            bottom: 28,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/images/half_cirlce.png",
                              height: 110,
                              width: 200,
                            ),
                          ),
                          Positioned(
                            bottom: 28,
                            left: 0,
                            right: 0,
                            child: Image.asset(
                              "assets/images/doctor9.png",
                              height: 158,
                              width: 158,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 74,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    transform: Matrix4.translationValues(0.0, -28.0, 0.0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                        color: lightWhite,
                        boxShadow: boxShadow,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Acne Prevention and Treatment",
                          style: semiBold(
                            sizeFont: 16,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 9),
                          child: Divider(
                            color: Colors.grey,
                            height: 1,
                            thickness: 1,
                            indent: 16,
                            endIndent: 16,
                          ),
                        ),
                        Text(
                          "Presented by Dr. John Elbert W, Sp.DV",
                          style: reguler(
                            sizeFont: 12,
                            colorFont: purpleColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(
                vertical: 11,
                horizontal: 30,
              ),
              decoration: BoxDecoration(
                  color: lightWhite,
                  boxShadow: boxShadow,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What you learn",
                    style: semiBold(
                      sizeFont: 16,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 9),
                    child: Divider(
                      color: Colors.grey,
                      height: 1,
                      thickness: 1,
                    ),
                  ),
                  topicLearn("Type of acnes"),
                  topicLearn("The symptoms of acne"),
                  topicLearn("Apply sunscreen in acne skin"),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 30,
              ),
              decoration: BoxDecoration(
                color: const Color(0x70F7F7F7),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 23),
                    child: Text(
                      "8 Chapter Video",
                      style: semiBold(
                        sizeFont: 16,
                      ),
                    ),
                  ),
                  videoPreview(
                    "assets/images/video1.png",
                    "Chapter 1",
                    "What are the types of acne?",
                  ),
                  videoPreview(
                    "assets/images/video2.png",
                    "Chapter 2",
                    "What are the symptoms of acne?",
                  ),
                  videoPreview(
                    "assets/images/video3.png",
                    "Chapter 3",
                    "How to apply sunscreen in acne skin?",
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topicLearn(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Image.asset(
            "assets/images/icon_cirlce.png",
            width: 7,
            height: 7,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: reguler(
              sizeFont: 12,
            ),
          )
        ],
      ),
    );
  }

  Widget videoPreview(
    String image,
    String chapter,
    String title,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 23),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: 100,
              height: 72,
            ),
          ),
          const SizedBox(
            width: 18,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chapter,
                style: reguler(
                  colorFont: purpleColor,
                  sizeFont: 12,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SizedBox(
                width: 150,
                child: Wrap(
                  children: [
                    Text(
                      title,
                      style: medium(
                        sizeFont: 12,
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
