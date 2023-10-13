import 'dart:async';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';

import 'package:bright_me/widget/dash_divider.dart';
import 'package:flutter/material.dart';

class ShopPaymentComplete extends StatefulWidget {
  const ShopPaymentComplete({super.key});

  @override
  State<ShopPaymentComplete> createState() => _ShopPaymentCompleteState();
}

class _ShopPaymentCompleteState extends State<ShopPaymentComplete> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, orderProductRoute);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: purpleColor,
        appBar: AppBar(
          leading: null,
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
                      "21-03-2023 09:41:20",
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
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: DashedDivider(height: 1, color: greyColor),
                    ),

                    rowText('Order', 'Travel Pack - True Brotherrhod'),
                    const SizedBox(
                      height: 10,
                    ),
                    rowText('Order Time', '13 Maret 2023, 1 PM'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: DashedDivider(height: 1, color: greyColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Destination address',
                          style: reguler(
                            sizeFont: 14,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          width: 186,
                          child: Wrap(
                            children: [
                              Text(
                                'Garden Dian Regency Jl Alamanda 1 no 14',
                                textAlign: TextAlign.end,
                                style: reguler(
                                  sizeFont: 14,
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    rowText('Phone Number', '08113552304'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 13),
                      child: DashedDivider(height: 1, color: greyColor),
                    ),
                    rowText('Bill', 'Rp 91.400'),
                    const SizedBox(
                      height: 10,
                    ),
                    rowText('Additional cost', 'Rp 0'),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      child: DashedDivider(height: 1, color: greyColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: bold(
                            sizeFont: 17,
                          ),
                        ),
                        Text(
                          'Rp 91.400',
                          style: bold(
                            sizeFont: 17,
                          ),
                        ),
                      ],
                    ),
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
