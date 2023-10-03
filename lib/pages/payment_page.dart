import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/payment_data.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/custom_radio.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int? selectedDigitalRadioTile;
  int? selectedBankRadioTile;

  String paymentUser = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            titleAppBar: "Payment Method",
            onPressedFunc: () => Navigator.pop(context),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.85,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 16),
                        child: Text(
                          "Digital Payment",
                          style: semiBold(
                            sizeFont: 14,
                          ),
                        ),
                      ),
                      Column(
                        children: digitalPayment
                            .map((item) => CustomRadio(
                                  label: Image.asset(
                                    item['image'],
                                    width: 74,
                                    height: 16,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  groupValue: selectedDigitalRadioTile,
                                  value: item['id'],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedDigitalRadioTile = value;
                                      selectedBankRadioTile = null;
                                    });
                                    paymentUser = digitalPayment[
                                        selectedDigitalRadioTile!]['payment'];
                                  },
                                ))
                            .toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 16),
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
                                    width: 74,
                                    height: 16,
                                    alignment: Alignment.centerLeft,
                                  ),
                                  groupValue: selectedBankRadioTile,
                                  value: item['id'],
                                  onChanged: (value) {
                                    setState(() {
                                      selectedBankRadioTile = value;
                                      selectedDigitalRadioTile = null;
                                    });
                                    paymentUser =
                                        bankPayment[selectedBankRadioTile!]
                                            ['payment'];
                                  },
                                ))
                            .toList(),
                      ),
                    ],
                  )),
                  CustomButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, instructionsPayRoute),
                    buttonText: "Pay",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
