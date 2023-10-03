import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/confirm_popup.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class MenuGlowUpPage extends StatelessWidget {
  Future _dialogPop(BuildContext context) async {
    showDialog(
        context: context,
        builder: (context) {
          return ConfirmPopUp(
            title: "Delete this photo?",
            confirmButtonText: 'Yes',
            onPressedConfirm: () {
              Navigator.pop(context);
            },
          );
        });
  }

  const MenuGlowUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            titleAppBar: "GlowUp Plan",
            actionList: [
              Container(
                width: 40,
                height: 40,
                margin: const EdgeInsets.only(right: 15),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: whiteColor,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.notifications_sharp,
                    color: purpleColor, // Warna ikon
                  ),
                  onPressed: () {
                    // Tindakan yang harus diambil ketika tombol ditekan
                  },
                ),
              )
            ],
          )
        ],
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34), topRight: Radius.circular(34)),
            ),
            child: GridView.builder(
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.5,
                mainAxisExtent: 250,
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
              ),
              itemCount: 8,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.pushNamed(context, glowUpDetail),
                  child: Container(
                    width: 145,
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: const DecorationImage(
                        image: AssetImage("assets/images/face.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 200),
                          width: 160,
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/box.png",
                                ),
                                fit: BoxFit.cover),
                          ),
                          child: Center(
                            child: Text(
                              "04 / 06 / 2023",
                              style: semiBold(sizeFont: 14),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 5,
                          top: 8,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: whiteColor,
                            ),
                            child: IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red, // Warna ikon
                              ),
                              onPressed: () async {
                                await _dialogPop(context);
                              },
                            ),
                          ),
                        ),
                        // kenapa widget ini tidajk muncul
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
