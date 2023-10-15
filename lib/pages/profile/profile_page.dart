import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/profile_data.dart';
import 'package:bright_me/models/user.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/custom_radio.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int? selectedBankRadioTile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(left: 30, right: 30, top: 65),
                margin: const EdgeInsets.only(top: 100),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          currUser.name ?? "",
                          style: semiBold(
                            sizeFont: 16,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Settings",
                      style: medium(sizeFont: 14),
                    ),
                    menuBuilder(accountData),
                    Text(
                      "Account",
                      style: medium(sizeFont: 14),
                    ),
                    menuBuilder(settingData),
                    Text(
                      "Support",
                      style: medium(sizeFont: 14),
                    ),
                    menuBuilder(supporrtData),
                    Text(
                      "About",
                      style: medium(sizeFont: 14),
                    ),
                    menuBuilder(aboutData),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Joined since March 2023",
                          style: reguler(
                            sizeFont: 12,
                            colorFont: purpleColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage("assets/images/user.jpg"),
                      radius: 60,
                      backgroundColor: lightWhite,
                    ),
                    Positioned(
                      bottom: -7,
                      right: -15,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: purpleColor,
                              fixedSize: const Size(32, 32),
                              shape: const CircleBorder()),
                          child: const Icon(
                            Icons.photo_camera_outlined,
                            color: whiteColor,
                            size: 28,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuBuilder(List<Map<String, dynamic>> data) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        top: 14,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: lightWhite,
        boxShadow: boxShadow,
      ),
      child: Column(
        children: data.asMap().entries.map((entry) {
          final item = entry.value;
          final isLastItem = entry.key == data.length - 1;

          return GestureDetector(
            onTap: () async {
              if (item['route'] == "showModal") {
                await showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return langguageModal();
                  },
                );
              } else if (item['route'] != "none") {
                Navigator.pushNamed(context, item['route']);
              }
            },
            child: Column(
              children: [
                ListTile(
                  leading: item['Icon'],
                  title: Text(
                    item['title'],
                    style: reguler(
                      sizeFont: 14,
                      colorFont: darGreykColor,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: darGreykColor,
                    size: 16,
                  ),
                ),
                if (!isLastItem)
                  const Divider(
                    color: Colors.grey,
                    height: 1,
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                  ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget langguageModal() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: MediaQuery.sizeOf(context).height * 0.5,
          padding: const EdgeInsets.only(
            top: 40,
          ),
          decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Text(
                      "Language",
                      style: medium(
                        colorFont: blackColor,
                        sizeFont: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.27,
                      child: Column(
                        children: [
                          CustomRadio(
                            groupValue: selectedBankRadioTile,
                            label: Text(
                              "English",
                              style: medium(
                                sizeFont: 16,
                              ),
                            ),
                            value: 1,
                            onChanged: (value) {
                              setState(() {
                                selectedBankRadioTile = value;
                              });
                            },
                          ),
                          CustomRadio(
                            groupValue: selectedBankRadioTile,
                            label: Text(
                              "Bahasa Indonesia",
                              style: medium(
                                sizeFont: 16,
                              ),
                            ),
                            value: 2,
                            onChanged: (value) {
                              setState(() {
                                selectedBankRadioTile = value;
                              });
                            },
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                      bottom: 10,
                    ),
                    child: CustomButton(
                      onPressed: () => Navigator.pop(context),
                      buttonText: 'Save',
                    ),
                  )
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}
