import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/white_appbar.dart';
import 'package:flutter/material.dart';

class SwitchAccountPage extends StatefulWidget {
  const SwitchAccountPage({super.key});

  @override
  State<SwitchAccountPage> createState() => _SwitchAccountPageState();
}

class _SwitchAccountPageState extends State<SwitchAccountPage> {
  int? selectedBankRadioTile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: whiteAppBar(
        context,
        'Switch Account',
        true,
        false,
        () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            RadioListTile(
              activeColor: purpleColor,
              value: 1,
              groupValue: selectedBankRadioTile,
              title: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("assets/images/user.jpg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Aurelia Sukianto",
                    style: medium(
                      sizeFont: 14,
                      colorFont: blackColor,
                    ),
                  )
                ],
              ),
              onChanged: (value) {
                setState(() {
                  selectedBankRadioTile = value;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Divider(
                color: greyColor,
                indent: 16,
                thickness: 1,
              ),
            ),
            RadioListTile(
              activeColor: purpleColor,
              value: 2,
              groupValue: selectedBankRadioTile,
              title: Row(
                children: [
                  const CircleAvatar(
                    radius: 18,
                    backgroundImage: AssetImage("assets/images/user.jpg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Caroline Lie",
                    style: medium(
                      sizeFont: 14,
                      colorFont: blackColor,
                    ),
                  )
                ],
              ),
              onChanged: (value) {
                setState(() {
                  selectedBankRadioTile = value;
                });
              },
              controlAffinity: ListTileControlAffinity.trailing,
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 150,
              child: CustomButton(
                  onPressed: () {},
                  childWidget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "Add Account",
                        style: bold(
                          colorFont: whiteColor,
                          sizeFont: 12,
                        ),
                      ),
                      const Icon(
                        Icons.add,
                        color: lightWhite,
                        size: 24,
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
