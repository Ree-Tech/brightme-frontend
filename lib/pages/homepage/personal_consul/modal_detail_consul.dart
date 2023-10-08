import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

List<Widget> modalDetailConfirm(
  BuildContext context,
  String id,
  String date,
  String image,
  String name,
  String idDoctor,
) =>
    [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 300,
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
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Consultation",
                        style: reguler(
                          sizeFont: 14,
                        ),
                      ),
                      Text(
                        "Rp 60.000",
                        style: reguler(
                          sizeFont: 14,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 7,
                      bottom: 7,
                    ),
                    child: Divider(
                      color: greyColor,
                      thickness: 2,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: bold(
                          sizeFont: 14,
                        ),
                      ),
                      Text(
                        "Rp 60.000",
                        style: bold(
                          sizeFont: 14,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: SizedBox(
                      width: 100,
                      child: CustomButton(
                        onPressed: () => Navigator.pushNamed(
                            context, rateDoctorRoute,
                            arguments: {
                              'name': name,
                              'image': image,
                            }),
                        buttonText: "Rate",
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(
                          "assets/images/icon_mask.jpg",
                        ),
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Consultation Summary",
                        style: semiBold(
                          sizeFont: 16,
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 18,
                      bottom: 16,
                    ),
                    child: Divider(
                      color: greyColor,
                      thickness: 2,
                    ),
                  ),
                  Text(
                    "Problem",
                    style: semiBold(
                      sizeFont: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 12,
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          "Skin is very sensitive with the appearance of wet and red pimples. Coupled with outdoor activities because of a basketball player",
                          style: reguler(
                            sizeFont: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                  Text(
                    "Suggestion",
                    style: semiBold(
                      sizeFont: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 12,
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          "\n1.Use sunblock\n2.Aloe vera drink\n3.Use body lotion/n4.Use face wash",
                          style: reguler(
                            sizeFont: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/icon_recommend.jpg",
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        "Recommended product",
                        style: semiBold(
                          sizeFont: 16,
                        ),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 18,
                      bottom: 16,
                    ),
                    child: Divider(
                      color: greyColor,
                      thickness: 2,
                    ),
                  ),
                  Text(
                    "Suggestion",
                    style: semiBold(
                      sizeFont: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 12,
                    ),
                    child: Wrap(
                      children: [
                        Text(
                          "\n1.Wardah Seaweed Balancing Facial Wash\n2.WARDAH UV Shield Sunscreen Gel\n3.Wardah Nature Daily Witch Hazel Purifying Moisturizer Gel\n4.Wardah Acnederm Acne Spot Treatment Gel",
                          style: reguler(
                            sizeFont: 12,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      )
    ];
