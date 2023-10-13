import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/dash_divider.dart';
import 'package:bright_me/widget/step_widget.dart';
import 'package:bright_me/widget/widget_appbar.dart';
import 'package:flutter/material.dart';

class OrderConfirmPage extends StatefulWidget {
  const OrderConfirmPage({super.key});

  @override
  State<OrderConfirmPage> createState() => _OrderConfirmPageState();
}

class _OrderConfirmPageState extends State<OrderConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgetAppBar(
        context,
        "Order Confirmation",
      ),
      backgroundColor: purpleColor,
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 30,
              ),
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: Column(
                children: [
                  const StepWidget(indexStep: 2),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 37,
                      bottom: 47,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Image.network(
                        "https://s4.bukalapak.com/img/42747563182/s-463-463/data.png.webp",
                        height: 100,
                        width: 188,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Column(
                      children: [
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
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    child: Divider(
                      color: Color(0xffF3F4F6),
                      thickness: 14,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 14),
                    child: CustomButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, paymentProductPage),
                      buttonText: "Confirmation",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
