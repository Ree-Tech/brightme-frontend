import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/dash_divider.dart';
import 'package:flutter/material.dart';

class ConsulPaymentComplete extends StatelessWidget {
  const ConsulPaymentComplete({super.key});

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
              "Transaction",
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

                          rowText(
                            "Transaction Time",
                            "11-07-2022 17:19:20",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          rowText(
                            "Transaction number",
                            "#14524569854587",
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                            ),
                            child: DashedDivider(height: 1, color: greyColor),
                          ),

                          //Nama  transaction
                          rowText(
                            "Name",
                            "Aurelia Sukianto",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          rowText(
                            "Phone Number",
                            "+62 812 345 6789",
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                            ),
                            child: DashedDivider(height: 1, color: greyColor),
                          ),

                          // Subscription type
                          rowText(
                            "Doctor",
                            "Dr. Carly Ely, Sp.DV",
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                            ),
                            child: DashedDivider(height: 1, color: greyColor),
                          ),

                          //price

                          rowText(
                            "Bill",
                            "Rp 135.000",
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          rowText(
                            "Additional cost",
                            "Rp 0",
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 20,
                              bottom: 8,
                            ),
                            child: DashedDivider(height: 1, color: greyColor),
                          ),
                          rowText(
                            "Total",
                            "Rp 135.000",
                          ),
                        ],
                      ),
                    ),
                    CustomButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                        context,
                        orderPersonalConsulroute,
                      ),
                      buttonText: "Start Consul Now!",
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget rowText(
    String textLeft,
    String textRight,
  ) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            textLeft,
            style: reguler(
              sizeFont: 14,
            ),
          ),
          Text(
            textRight,
            style: reguler(
              sizeFont: 14,
            ),
          ),
        ],
      );
}
