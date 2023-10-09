import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

class SuccessChangePassword extends StatelessWidget {
  const SuccessChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Image.asset("assets/images/lock_secure.png"),
            Padding(
              padding: const EdgeInsets.only(top: 58, bottom: 97),
              child: Text(
                "Congratulations, the password update was successful! ",
                style: semiBold(sizeFont: 20),
                textAlign: TextAlign.center,
              ),
            ),
            CustomButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, loginRoute);
              },
              buttonText: "Login Now",
            )
          ],
        ),
      ),
    );
  }
}
