import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';

class CartProductCard extends StatefulWidget {
  final String image;
  final String name;
  final String subName;
  final String price;

  const CartProductCard({
    Key? key,
    required this.image,
    required this.name,
    required this.subName,
    required this.price,
  }) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  bool isCheck = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const BehindMotion(),
          children: [
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor,
                    fixedSize: const Size(32, 32),
                    shape: const CircleBorder()),
                child: const Icon(
                  Icons.delete_rounded,
                  color: purpleColor,
                ))
          ],
        ),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.5,
              child: Checkbox(
                activeColor: purpleColor,
                value: isCheck,
                onChanged: (value) {
                  setState(() {
                    isCheck = value!;
                  });
                },
              ),
            ),
            Container(
              height: 160,
              decoration: BoxDecoration(
                  color: lightWhite,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: boxShadow),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        bottomLeft: Radius.circular(12)),
                    child: SizedBox(
                      height: 130,
                      width: 110,
                      child: Image.network(
                        widget.image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    height: 170,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(24),
                          bottomRight: Radius.circular(24)),
                      color: lightWhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // saya ingin text di dalam column dapat membuat baris baru apabila sudah
                        SizedBox(
                          height: 80,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.name,
                                  style: medium(
                                    colorFont: blackColor,
                                    sizeFont: 12,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Flexible(
                                child: Text(
                                  widget.subName,
                                  style: reguler(
                                    sizeFont: 10,
                                    colorFont: greyColor,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              widget.price,
                              style: semiBold(
                                colorFont: purpleColor,
                                sizeFont: 12,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 14,
                                  backgroundColor: greyButton,
                                  child: Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: blackColor,
                                      size: 17,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text(
                                    "2",
                                    style: medium(
                                      sizeFont: 12,
                                    ),
                                  ),
                                ),
                                const CircleAvatar(
                                  radius: 14,
                                  backgroundColor: greyButton,
                                  child: Center(
                                    child: Icon(
                                      Icons.add,
                                      color: blackColor,
                                      size: 17,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
