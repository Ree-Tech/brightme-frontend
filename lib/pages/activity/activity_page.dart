import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/acitivty_data.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({super.key});

  @override
  State<ActivityPage> createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                const CustomAppBar(
                  titleAppBar: "Activity",
                  borderRadius: 24,
                )
              ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "My Order",
                    style: medium(sizeFont: 14),
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                      top: 14,
                      bottom: 30,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: lightPuprle,
                      boxShadow: boxShadow,
                    ),
                    child: Column(
                      children: orderData.asMap().entries.map((entry) {
                        final item = entry.value;
                        final isLastItem = entry.key == orderData.length - 1;

                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pushNamed(
                                context,
                                orderProductRoute,
                                arguments: entry.key,
                              ),
                              child: ListTile(
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
                        );
                      }).toList(),
                    ),
                  ),
                  Text(
                    "My Consultation",
                    style: medium(sizeFont: 14),
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(
                        top: 14,
                        bottom: 30,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: lightPuprle,
                        boxShadow: boxShadow,
                      ),
                      child: Column(
                        children: consulData.asMap().entries.map((entry) {
                          final item = entry.value;
                          final isLastItem = entry.key == orderData.length - 1;

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  orderPersonalConsulroute,
                                  arguments: entry.key,
                                ),
                                child: ListTile(
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
                          );
                        }).toList(),
                      )),
                  Text(
                    "Payment History",
                    style: medium(sizeFont: 14),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: paymentData
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
                                Image.asset(
                                  item['image'],
                                ),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  )
                ],
              ),
            ),
          )),
    );
  }
}
