import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/menu_doctor.dart';
import 'package:flutter/material.dart';

class PersonalConsulPage extends StatelessWidget {
  const PersonalConsulPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, orderPersonalConsulroute),
        shape: const CircleBorder(),
        backgroundColor: whiteColor,
        child: Image.asset(
          "assets/images/icon_clipboard.jpg",
          width: 24,
          height: 24,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
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
                "Personal Consul",
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
          )
        ],
        body: SingleChildScrollView(
          child: Column(
            children: [
              GridView.builder(
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.5,
                  mainAxisExtent: 250,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 8,
                ),
                itemCount: docImage.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, doctorProfileRoute),
                      child: Image.asset(docImage[index]));
                },
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
