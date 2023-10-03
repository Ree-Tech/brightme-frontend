import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/notification_data.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: CustomScrollView(
        slivers: [
          CustomAppBar(
            titleAppBar: "GlowUp Plan",
            onPressedFunc: () => Navigator.pop(context),
            actionList: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10),
                child: FlutterSwitch(
                  padding: 7,
                  toggleColor: whiteColor,
                  switchBorder: Border.all(
                    width: 2,
                    color: whiteColor,
                  ),
                  inactiveColor: purpleColor,
                  activeColor: purpleColor,
                  width: 52,
                  height: 32,
                  toggleSize: 14,
                  value: isSwitched,
                  onToggle: (val) {
                    setState(() {
                      isSwitched = val;
                    });
                  },
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30),
                  decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34),
                    ),
                  ),
                  child: Column(
                    children: notifData
                        .map((item) => cardNotif(
                              item['title']!,
                              item['subtitle']!,
                              item['time']!,
                              item['day']!,
                            ))
                        .toList(),
                  )))
        ],
      ),
    );
  }

  Widget cardNotif(
    String title,
    String subtitle,
    String time,
    String day,
  ) =>
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.only(
          bottom: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: lightWhite,
          boxShadow: boxShadow,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/icon_notif.jpg'),
              radius: 20,
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: semiBold(
                      sizeFont: 14,
                      colorFont: darGreykColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Text(
                      subtitle,
                      style: reguler(
                        sizeFont: 12,
                        colorFont: darGreykColor,
                      ),
                      softWrap: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        time,
                        style: reguler(
                          sizeFont: 12,
                          colorFont: purpleColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 20,
                        ),
                        child: Text(
                          day,
                          style: reguler(
                            sizeFont: 12,
                            colorFont: purpleColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
