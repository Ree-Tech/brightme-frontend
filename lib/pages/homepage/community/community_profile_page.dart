import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/community_profile_data.dart';
import 'package:flutter/material.dart';

class CommunityProfilePage extends StatelessWidget {
  const CommunityProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      )),
                ),
              ),
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
                  children: [
                    Text(
                      "Surabaya Bright Me",
                      style: semiBold(
                        sizeFont: 20,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 248,
                      child: Text(
                        "Welcome to the Bright Me Surabaya community, let's learn and grow together... Don't hesitate to ask :) Enjoy friends!",
                        style: reguler(
                          sizeFont: 12,
                          colorFont: blackColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: profileData
                            .map(
                              (item) => Column(
                                children: [
                                  Image.asset(
                                    item['image']!,
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    item['title']!,
                                    style: reguler(
                                      colorFont: textGrey,
                                      sizeFont: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 10),
                      child: Divider(
                        thickness: 1,
                        color: blueColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Members (24)",
                          style: medium(
                            sizeFont: 14,
                            colorFont: darGreykColor,
                          ),
                        ),
                        Text(
                          "See all",
                          style: medium(
                            sizeFont: 12,
                            colorFont: greyColor,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    // parbaiki kodingan ini sehingga listview bulder berkeja dengan baik
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/icon_adduser.jpg",
                            width: 50,
                            height: 50,
                          ),
                          Row(
                              children: imageProfile
                                  .map(
                                    (item) => Padding(
                                      padding: const EdgeInsets.only(left: 12),
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(item),
                                        radius: 20,
                                      ),
                                    ),
                                  )
                                  .toList()),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 10),
                      child: Divider(
                        thickness: 1,
                        color: blueColor,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Group Activity",
                        style: medium(
                          sizeFont: 14,
                          colorFont: darGreykColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      children: grupActivity
                          .map(
                            (item) => Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: lightPuprle,
                                boxShadow: boxShadow,
                              ),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage:
                                        NetworkImage(item['image']),
                                    radius: 20,
                                  ),
                                  const SizedBox(
                                    width: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['title'],
                                        style: reguler(
                                          sizeFont: 12,
                                          colorFont: darGreykColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        item['subtitle'],
                                        style: reguler(
                                          sizeFont: 12,
                                          colorFont: greyColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        item['time'],
                                        style: reguler(
                                          sizeFont: 12,
                                          colorFont: purpleColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                alignment: Alignment.topCenter,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1531844251246-9a1bfaae09fc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1516&q=80",
                  ),
                  radius: 60,
                  backgroundColor: lightWhite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
