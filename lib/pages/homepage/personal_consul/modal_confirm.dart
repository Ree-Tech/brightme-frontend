import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

List<Widget> modalWidgetConsul(
  BuildContext context,
) =>
    [
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Check details",
              style: semiBold(
                sizeFont: 18,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 21,
                bottom: 24,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/doctor5.jpg"),
                    radius: 25,
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
                        height: 6,
                      ),
                      Text(
                        "446.1/8468/spdv/x/2010",
                        style: reguler(
                          colorFont: purpleColor,
                          sizeFont: 12,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      const Divider(
        color: Color(0xffF3F4F6),
        thickness: 8,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Benefit Good Doctor",
              style: reguler(
                sizeFont: 16,
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const WidgetSpan(
                      child: Icon(
                    Icons.check_circle,
                    color: purpleColor,
                    size: 18,
                  )),
                  TextSpan(
                    text: "Insurance",
                    style: reguler(
                      sizeFont: 16,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      const Divider(
        color: Color(0xffF3F4F6),
        thickness: 8,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 15,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Consultation",
                  style: reguler(
                    sizeFont: 16,
                  ),
                ),
                Text(
                  "Rp 135.000",
                  style: reguler(
                    sizeFont: 16,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Covered by insurance",
                  style: reguler(
                    sizeFont: 16,
                    colorFont: discountColor,
                  ),
                ),
                Text(
                  "-Rp 135.000",
                  style: reguler(
                    sizeFont: 16,
                    colorFont: discountColor,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: bold(
                    sizeFont: 16,
                  ),
                ),
                Text(
                  "Rp 0",
                  style: bold(
                    sizeFont: 16,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      const Divider(
        color: Color(0xffF3F4F6),
        thickness: 10,
      ),
      Padding(
        padding: const EdgeInsets.all(30),
        child: CustomButton(
          onPressed: () => Navigator.pushNamed(
            context,
            paymentRoute,
            arguments: consulPaymentCompleteRoute,
          ),
          buttonText: "Confirmation",
        ),
      )
    ];
