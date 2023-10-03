import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

import '../widget/dash_divider.dart';

class PaymentCompletePage extends StatelessWidget {
  const PaymentCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          toolbarHeight: 100,
          centerTitle: true,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24)),
          ),
          backgroundColor: purpleColor,
          title: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 30,
            ),
            child: Text(
              "Instructions",
              style: semiBold(
                sizeFont: 20,
                colorFont: whiteColor,
              ),
            ),
          ),
        ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.check_circle,
                              color: purpleColor,
                              size: 120,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 13,
                                  bottom: 25,
                                ),
                                child: Text(
                                  "Successful Transaction",
                                  style: medium(
                                    colorFont: blackColor,
                                    sizeFont: 16,
                                  ),
                                )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transaction Time",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                              Text(
                                "11-07-2022 17:19:20",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transaction number",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                              Text(
                                "#14524569854587",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                            ),
                            child: DashedDivider(height: 1, color: greyColor),
                          ),

                          //Nama  transaction
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Name",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                              Text(
                                "Aurelia Sukianto",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Phone Number",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                              Text(
                                "+62 812 345 6789",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                            ),
                            child: DashedDivider(height: 1, color: greyColor),
                          ),

                          // Subscription type
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Subscription",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                              Text(
                                "Annual Plan",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                            ),
                            child: DashedDivider(height: 1, color: greyColor),
                          ),

                          //price

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Bill",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                              Text(
                                "Rp 410.000",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Additional cost",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                              Text(
                                "Rp 0",
                                style: reguler(
                                  sizeFont: 14,
                                ),
                              ),
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                            ),
                            child: DashedDivider(height: 1, color: greyColor),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total",
                                style: reguler(
                                  sizeFont: 20,
                                ),
                              ),
                              Text(
                                "Rp 410.000",
                                style: reguler(
                                  sizeFont: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, glowUpMenuRoute),
                      buttonText: "Start GlowUp Plan Now!",
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
