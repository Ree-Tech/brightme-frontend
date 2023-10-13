import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';

class OrderCard extends StatelessWidget {
  final Widget titleButton;
  final Widget statusWidget;
  final void Function()? onTapFunc;
  const OrderCard({
    Key? key,
    required this.titleButton,
    required this.statusWidget,
    this.onTapFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275,
      padding: const EdgeInsets.only(
        top: 17,
        left: 16,
        right: 20,
      ),
      decoration: BoxDecoration(
          color: lightWhite,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 8,
              color: Color.fromRGBO(0, 0, 0, 0.10),
            ),
          ],
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Order ID : 337420309834",
            style: reguler(
              colorFont: blackColor,
              sizeFont: 10,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Order date : 21 Mar 2023, 09.41",
                      style: reguler(
                        sizeFont: 10,
                        colorFont: greyColor,
                      ),
                    ),
                    TextSpan(
                      text: " | ",
                      style: reguler(
                        colorFont: greyColor,
                        sizeFont: 12,
                      ),
                    ),
                    TextSpan(
                      text: "Status : ",
                      style: reguler(
                        sizeFont: 10,
                        colorFont: greyColor,
                      ),
                    ),
                  ],
                ),
              ),
              statusWidget
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              color: greyColor,
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 70,
                    width: 90,
                    child: Image.network(
                      "https://s4.bukalapak.com/img/42747563182/s-463-463/data.png.webp",
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 112,
                        child: Wrap(
                          children: [
                            Text(
                              "Travel Pack - True Brotherrhod",
                              style: medium(
                                colorFont: blackColor,
                                sizeFont: 10,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Qty : 1",
                        style: reguler(
                          colorFont: greyColor,
                          sizeFont: 10,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Text(
                "Rp 59.850",
                style: semiBold(
                  colorFont: purpleColor,
                  sizeFont: 12,
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(
              color: greyColor,
              thickness: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment",
                    style: semiBold(
                      colorFont: blackColor,
                      sizeFont: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Ovo | *******6789",
                    style: reguler(
                      sizeFont: 10,
                    ),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery",
                    style: semiBold(
                      colorFont: blackColor,
                      sizeFont: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Address",
                    style: reguler(
                      sizeFont: 8,
                      colorFont: greyColor,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    width: 137,
                    child: Wrap(
                      children: [
                        Text(
                          "Garden Dian Regency Jl Edelweis 1 no 14",
                          style: reguler(
                            sizeFont: 10,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                      fixedSize: const Size(100, 27),
                      side: const BorderSide(
                        color: purpleColor,
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/icon_invoice.jpg",
                        width: 20,
                        height: 20,
                      ),
                      Text(
                        "Invoice",
                        style: semiBold(
                          colorFont: purpleColor,
                          sizeFont: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                    onPressed: onTapFunc,
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(110, 27),
                        backgroundColor: purpleColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    child: titleButton)
              ],
            ),
          )
        ],
      ),
    );
  }
}
