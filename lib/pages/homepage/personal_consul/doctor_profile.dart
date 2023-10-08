import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/doctor_profile_data.dart';
import 'package:bright_me/pages/homepage/personal_consul/modal_confirm.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/modal_widget.dart';
import 'package:bright_me/widget/widget_appbar.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBar(
        context,
        "Doctor Profile",
      ),
      backgroundColor: purpleColor,
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
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/doctor5.jpg"),
                              radius: 45,
                            ),
                            const SizedBox(
                              width: 20,
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
                                  height:
                                      6, // Ubah nilai ini untuk memberikan jarak vertikal yang sesuai
                                ),
                                Text(
                                  "446.1/8468/spdv/x/2010",
                                  style: reguler(
                                    colorFont: purpleColor,
                                    sizeFont: 12,
                                  ),
                                ),
                                const SizedBox(
                                  height:
                                      25, // Ubah nilai ini untuk memberikan jarak vertikal yang sesuai
                                ),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 15,
                                      backgroundColor: cremColor,
                                      child: Icon(
                                        Icons.groups,
                                        color: redColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      "Client",
                                      style: medium(
                                        colorFont: greyColor,
                                        sizeFont: 12,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "1,5k+",
                                      style: medium(
                                        colorFont: redColor,
                                        sizeFont: 14,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30,
                            bottom: 23,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: cremColor,
                                    child: Icon(
                                      Icons.person,
                                      color: redColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Experience",
                                    style: medium(
                                      colorFont: greyColor,
                                      sizeFont: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "12 Years+",
                                    style: medium(
                                      colorFont: redColor,
                                      sizeFont: 14,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  const CircleAvatar(
                                    radius: 15,
                                    backgroundColor: lightYellow,
                                    child: Icon(
                                      Icons.star,
                                      color: yellowColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    "Rating",
                                    style: medium(
                                      colorFont: greyColor,
                                      sizeFont: 12,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "4.9",
                                    style: medium(
                                      colorFont: redColor,
                                      sizeFont: 14,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Description",
                              style: medium(
                                sizeFont: 16,
                                colorFont: blackColor,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                  context, reviewDoctorRoute),
                              child: Text(
                                "See Reviews",
                                style: medium(
                                  sizeFont: 12,
                                  colorFont: purpleColor,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Wrap(
                            children: [
                              Text(
                                "Dr. Carly is a dermatologist at Husada International Hospital, Surabaya. Dr. Carly earned the title as the youngest doctor to open a new breakthrough about local beauty products in Indonesia.",
                                style: reguler(
                                  sizeFont: 12,
                                  colorFont: greyColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Client Likes",
                            style: medium(
                              sizeFont: 16,
                              colorFont: blackColor,
                            ),
                          ),
                        ),
                        Wrap(
                          runSpacing: 4,
                          spacing: 8,
                          children: dataClientLike
                              .map((item) => IntrinsicWidth(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        top: 10,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 7,
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: lightPuprle,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            item['title']!,
                                            style: medium(
                                              sizeFont: 12,
                                              colorFont: purpleColor,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            item['number']!,
                                            style: medium(
                                              colorFont: redColor,
                                              sizeFont: 12,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ))
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp 135.000",
                        style: semiBold(
                          sizeFont: 16,
                        ),
                      ),
                      SizedBox(
                        width: 190,
                        child: CustomButton(
                          onPressed: () async {
                            await showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              context: context,
                              builder: (context) {
                                return ModalBottomWidget(
                                    childrenWidget: modalWidgetConsul(
                                  context,
                                ));
                              },
                            );
                          },
                          buttonText: "Consultation",
                        ),
                      )
                    ],
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
