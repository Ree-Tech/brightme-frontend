import 'dart:async';

import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/instruction_payment_data.dart';

class IntructionPaymentPage extends StatefulWidget {
  final String routeAfterPay;
  const IntructionPaymentPage({
    Key? key,
    required this.routeAfterPay,
  }) : super(key: key);

  @override
  State<IntructionPaymentPage> createState() => _IntructionPaymentPageState();
}

class _IntructionPaymentPageState extends State<IntructionPaymentPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, widget.routeAfterPay);
    });
    super.initState();
  }

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
          leading: Padding(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 30,
            ),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                )),
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
        body: SafeArea(
          child: Column(
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
                      Row(
                        children: [
                          Container(
                            width: 90,
                            height: 41,
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(
                              right: 40,
                            ),
                            decoration: BoxDecoration(
                              boxShadow: boxShadow,
                              color: lightWhite,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(
                              "assets/images/ovo.jpg",
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          Text(
                            "Checked automatically",
                            style: reguler(
                              sizeFont: 12,
                              colorFont: greyColor,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 23,
                          bottom: 14,
                        ),
                        child: Text(
                          "No. Account",
                          style: medium(
                            sizeFont: 14,
                            colorFont: blackColor,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "08113552304",
                            style: semiBold(
                              sizeFont: 18,
                              colorFont: purpleColor,
                            ),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: greyButton,
                              ),
                              child: Text(
                                "COPY",
                                style: semiBold(
                                  colorFont: purpleColor,
                                  sizeFont: 14,
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Pay within. ",
                              style: reguler(
                                sizeFont: 12,
                                colorFont: greyColor,
                              )),
                          TextSpan(
                              text: "1 x 24 hours. ",
                              style: bold(
                                colorFont: purpleColor,
                                sizeFont: 12,
                              )),
                          TextSpan(
                              text:
                                  "If you do not pay,the\ntransaction will be forfeited",
                              style: reguler(
                                sizeFont: 12,
                                colorFont: greyColor,
                              ))
                        ])),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 14,
                        ),
                        child: Text(
                          "Payment Step",
                          style: medium(
                            sizeFont: 14,
                            colorFont: blackColor,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: instructionsPaymentData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: greyButton,
                                  radius: 20,
                                  child: Text(
                                    "${index + 1}",
                                    style: bold(
                                      sizeFont: 12,
                                      colorFont: purpleColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  child: Text(
                                    instructionsPaymentData[index],
                                    style: reguler(
                                      sizeFont: 12,
                                    ),
                                    softWrap: true,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
