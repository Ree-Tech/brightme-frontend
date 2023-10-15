import 'package:bright_me/bloc/auth/auth_bloc.dart';
import 'package:bright_me/widget/loading_wigdet.dart';
import 'package:bright_me/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';

class OtpPage extends StatefulWidget {
  final String email;
  const OtpPage({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  bool isDone = false;
  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is ConfirmSucess) {
            Navigator.pushReplacementNamed(context, loginRoute);
          } else if (state is ConfirmEror) {
            showSnackBar(context, state.text);
          }
        },
        builder: (context, state) {
          if (state is ConfirmLoading) {
            return const LoadingWidget();
          }
          return SafeArea(
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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      bottom: 40,
                    ),
                    child: Text(
                      widget.email,
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
                        setState(() {
                          code = pin;
                        });
                      },
                      onCompleted: (pin) {
                        setState(() {
                          isDone = true;
                        });
                      }),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomButton(
                      buttonText: "Submit",
                      onPressed: () {
                        if (isDone) {
                          context
                              .read<AuthBloc>()
                              .add(ConfirmAccountEvent(widget.email, code));
                        } else {
                          showSnackBar(context, "Fill the OTP code first");
                        }
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
