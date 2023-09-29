import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/tap_text.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            children: [
              Image.asset(
                "assets/images/otp.jpg",
                height: 245,
                width: 245,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12,
                ),
                child: Text(
                  "OTP Verification",
                  style: extraBold(
                    sizeFont: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Text(
                  "We will send you a one-time OTP code\non this your email",
                  textAlign: TextAlign.center,
                  style: reguler(
                    sizeFont: 15,
                  ),
                ),
              ),

              //todo: dapatkan email dari halaman sebelumnya
              Padding(
                padding: const EdgeInsets.only(
                  top: 15,
                  bottom: 40,
                ),
                child: Text(
                  "aurelia@gmail.com",
                  style: bold(
                    sizeFont: 14,
                    colorFont: greyColor,
                  ),
                ),
              ),

              OTPTextField(
                  length: 4,
                  width: double.infinity,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 42,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 50,
                  spaceBetween: 0,
                  style: medium(sizeFont: 15),
                  onChanged: (pin) {
                    print("Changed: " + pin);
                  },
                  onCompleted: (pin) {
                    print("Completed: " + pin);
                  }),

              const SizedBox(
                height: 60,
              ),

              CustomButton(
                buttonText: "Submit",
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, surveyRoute),
              ),
              const SizedBox(
                height: 16,
              ),
              TapText(
                text1: "Already have an account?",
                text2: 'Login',
                onTapFunc: () =>
                    Navigator.pushReplacementNamed(context, loginRoute),
              )
            ],
          ),
        ),
      )),
    );
  }
}
