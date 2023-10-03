import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:flutter/material.dart';

class GlowUpEduPage extends StatelessWidget {
  const GlowUpEduPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            flexibleSpace: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Text(
                      "GlowUp Education",
                      style: semiBold(
                        sizeFont: 20,
                        colorFont: whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 268,
                    height: 32,
                    child: TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: lightWhite,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1,
                            color: greyColor,
                          ),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: "Search",
                        hintStyle: medium(
                          sizeFont: 14,
                          colorFont: greyColor,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: greyColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: purpleColor,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/banne_edu1.png",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset("assets/images/banne_edu2.png"),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset("assets/images/banne_edu3.png"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
