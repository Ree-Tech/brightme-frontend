import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:flutter/material.dart';

class GlowUpEduPage extends StatelessWidget {
  const GlowUpEduPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 200,
            centerTitle: true,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 80,
              ),
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: whiteColor,
                  )),
            ),
            backgroundColor: purpleColor,
            title: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                bottom: 80,
              ),
              child: Text(
                "GlowUp Education",
                style: semiBold(
                  sizeFont: 20,
                  colorFont: whiteColor,
                ),
              ),
            ),
            flexibleSpace: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 30,
                    left: 40,
                    right: 40,
                  ),
                  child: SizedBox(
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
                )),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      bannerImage("assets/images/banne_edu1.png", context),
                      bannerImage("assets/images/banne_edu2.png", context),
                      bannerImage("assets/images/banne_edu3.png", context),
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

  Widget bannerImage(
    String image,
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, glowupEduDetail),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
