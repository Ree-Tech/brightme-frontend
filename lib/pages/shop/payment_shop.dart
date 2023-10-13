import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/payment_data.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/custom_radio.dart';
import 'package:bright_me/widget/step_widget.dart';
import 'package:flutter/material.dart';

class PaymentShopPage extends StatefulWidget {
  const PaymentShopPage({super.key});

  @override
  State<PaymentShopPage> createState() => _PaymentShopPageState();
}

class _PaymentShopPageState extends State<PaymentShopPage> {
  int? selectedDigitalRadioTile;
  int? selectedBankRadioTile;
  int? selectedVaRadioTile;

  String paymentUser = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(
                      top: 20,
                      right: 60,
                    ),
                    color: purpleColor,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: whiteColor,
                            size: 24,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              "Payment Method",
                              style: semiBold(
                                sizeFont: 20,
                                colorFont: whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                        const StepWidget(indexStep: 3),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 16),
                                child: Text(
                                  "Digital Payment",
                                  style: semiBold(
                                    sizeFont: 14,
                                  ),
                                ),
                              ),
                              Column(
                                children: ewalletpayment
                                    .map((item) => CustomRadio(
                                          label: Image.asset(
                                            item['image'],
                                            width: 81,
                                            height: item['id'] == 0 ? 26 : 47,
                                            alignment: Alignment.centerLeft,
                                          ),
                                          groupValue: selectedDigitalRadioTile,
                                          value: item['id'],
                                          onChanged: (value) {
                                            setState(() {
                                              selectedDigitalRadioTile = value;
                                              selectedBankRadioTile = null;
                                              selectedVaRadioTile = null;
                                            });
                                            paymentUser = ewalletpayment[
                                                    selectedDigitalRadioTile!]
                                                ['payment'];
                                          },
                                        ))
                                    .toList(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 16),
                                child: Text(
                                  "Bank transfer",
                                  style: semiBold(
                                    sizeFont: 14,
                                  ),
                                ),
                              ),
                              Column(
                                children: bankPayment
                                    .map((item) => CustomRadio(
                                          label: Image.asset(
                                            item['image'],
                                            width: 80,
                                            height: item['id'] == 1 ? 47 : 26,
                                            alignment: Alignment.centerLeft,
                                          ),
                                          groupValue: selectedBankRadioTile,
                                          value: item['id'],
                                          onChanged: (value) {
                                            setState(() {
                                              selectedBankRadioTile = value;
                                              selectedDigitalRadioTile = null;
                                              selectedVaRadioTile = null;
                                            });
                                            paymentUser = bankPayment[
                                                    selectedBankRadioTile!]
                                                ['payment'];
                                          },
                                        ))
                                    .toList(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom: 16),
                                child: Text(
                                  "Virtual Account",
                                  style: semiBold(
                                    sizeFont: 14,
                                  ),
                                ),
                              ),
                              Column(
                                children: vaPayment
                                    .map((item) => CustomRadio(
                                          label: Image.asset(
                                            item['image'],
                                            width: 80,
                                            height: item['id'] == 1 ? 47 : 26,
                                            alignment: Alignment.centerLeft,
                                          ),
                                          groupValue: selectedVaRadioTile,
                                          value: item['id'],
                                          onChanged: (value) {
                                            setState(() {
                                              selectedVaRadioTile = value;
                                              selectedBankRadioTile = null;
                                              selectedDigitalRadioTile = null;
                                            });
                                            paymentUser = bankPayment[
                                                    selectedVaRadioTile!]
                                                ['payment'];
                                          },
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.15,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                color: whiteColor,
                child: CustomButton(
                  onPressed: () => Navigator.pushNamed(
                      context, instructionsPayRoute,
                      arguments: shopPaymentCompleteRoute),
                  buttonText: "Pay",
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
