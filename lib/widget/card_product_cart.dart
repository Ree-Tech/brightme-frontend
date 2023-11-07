import 'package:bright_me/bloc/cart/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/models/cart.dart';

class CartProductCard extends StatefulWidget {
  final Cart cart;

  const CartProductCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<CartProductCard> createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  late bool isCheck;
  late int productCounter;
  late String productPrice;

  @override
  void initState() {
    productCounter = int.parse(widget.cart.quantity);
    isCheck = widget.cart.isCheck;
    productPrice =
        widget.cart.productVariation.discountProductPrice(productCounter);
    super.initState();
  }

  void increaseProduct() {
    setState(() {
      productCounter++;
      widget.cart.quantity = productCounter.toString();
      productPrice =
          widget.cart.productVariation.discountProductPrice(productCounter);
    });

    context.read<CartBloc>().add(UpdateQuantityItemEvent(
          widget.cart.id,
          productCounter,
        ));
  }

  void derecsesProduct() {
    if (productCounter > 1) {
      setState(() {
        productCounter--;
        widget.cart.quantity = productCounter.toString();
        productPrice =
            widget.cart.productVariation.discountProductPrice(productCounter);
      });

      context.read<CartBloc>().add(UpdateQuantityItemEvent(
            widget.cart.id,
            productCounter,
          ));
    } else {
      context.read<CartBloc>().add(DeleteCartItemEvent(
            widget.cart.id,
          ));
    }
  }

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
                onPressed: () {
                  context.read<CartBloc>().add(DeleteCartItemEvent(
                        widget.cart.id,
                      ));
                },
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
                  int check = isCheck ? 1 : 0;

                  context
                      .read<CartBloc>()
                      .add(UpdateCheckItemEvent(widget.cart.id, check));
                },
              ),
            ),
            Container(
              height: 160,
              width: 310,
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
                    child: Container(
                      color: lightPuprle,
                      height: 160,
                      width: 110,
                      child: Image.network(
                        widget
                            .cart.productVariation.product.productImages[0].img,
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
                        SizedBox(
                          height: 80,
                          width: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: Text(
                                  widget.cart.productVariation.product.name,
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
                                child: Row(
                                  children: [
                                    Text(
                                      widget
                                          .cart.productVariation.product.brand,
                                      style: reguler(
                                        sizeFont: 10,
                                        colorFont: greyColor,
                                      ),
                                      softWrap: true,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 4),
                                      child: Icon(Icons.fiber_manual_record,
                                          color: greyColor, size: 4),
                                    ),
                                    Text(
                                      widget.cart.productVariation.name,
                                      style: reguler(
                                        sizeFont: 10,
                                        colorFont: greyColor,
                                      ),
                                      softWrap: true,
                                    ),
                                  ],
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
                              "Rp $productPrice",
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
                                GestureDetector(
                                  onTap: () => derecsesProduct(),
                                  child: const CircleAvatar(
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Text(
                                    "$productCounter",
                                    style: medium(
                                      sizeFont: 12,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => increaseProduct(),
                                  child: const CircleAvatar(
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
