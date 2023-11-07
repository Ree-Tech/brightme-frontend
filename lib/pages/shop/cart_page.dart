import 'package:bright_me/bloc/cart/cart_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/models/cart.dart';
import 'package:bright_me/widget/card_product_cart.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/loading_wigdet.dart';
import 'package:bright_me/widget/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    context.read<CartBloc>().add(FetchListCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int discountPrice = totalDiscountCheckCart();
    int normalPrice = totalNormalCheckCart();
    int totalPrice = normalPrice - discountPrice;
    return Scaffold(
        body: CustomScrollView(slivers: [
      CustomAppBar(
        titleAppBar: "My Cart",
        onPressedFunc: () => Navigator.pop(context),
      ),
      SliverToBoxAdapter(
        child: Material(
          color: purpleColor,
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34)),
              ),
              child: BlocConsumer<CartBloc, CartState>(
                listener: (context, state) {
                  if (state is DeleteCartItemSuccess ||
                      state is UpdateCheckItemSuccess) {
                    context.read<CartBloc>().add(FetchListCartEvent());
                  } else if (state is DeleteCartItemEror) {
                    showSnackBar(context, "Faild delete item");
                  } else if (state is UpdateQuantityItemSuccess) {
                    discountPrice = totalDiscountCheckCart();
                    normalPrice = totalNormalCheckCart();
                    totalPrice = normalPrice - discountPrice;
                  } else if (state is FetchCartSuccess) {
                    discountPrice = totalDiscountCheckCart();
                    normalPrice = totalNormalCheckCart();
                    totalPrice = normalPrice - discountPrice;
                  }
                },
                builder: (context, state) {
                  if (state is FetchCartLoading ||
                      state is DeleteCartItemLoading) {
                    return const LoadingWidget();
                  } else if (state is FetchCartNoData) {
                    return const Center(
                      child: Text("Cart Empty"),
                    );
                  } else if (state is FetchCartEror) {
                    return Center(
                      child: Text(state.text),
                    );
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: userCart.length,
                          itemBuilder: (context, index) {
                            return CartProductCard(
                              cart: userCart[index],
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          color: Color(0xffF3F4F6),
                          thickness: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Sub Total",
                                  style: reguler(sizeFont: 16),
                                ),
                                Text(
                                  "Rp $normalPrice",
                                  style: reguler(
                                    sizeFont: 16,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 27),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Discount",
                                    style: reguler(
                                      sizeFont: 16,
                                      colorFont: discountColor,
                                    ),
                                  ),
                                  Text(
                                    "-Rp $discountPrice",
                                    style: reguler(
                                      sizeFont: 16,
                                      colorFont: discountColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total",
                                    style: bold(
                                      sizeFont: 16,
                                    ),
                                  ),
                                  Text(
                                    "Rp $totalPrice",
                                    style: bold(
                                      sizeFont: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Divider(
                          color: Color(0xffF3F4F6),
                          thickness: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: CustomButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, orderConfirmRoute),
                          buttonText: "Checkout",
                        ),
                      )
                    ],
                  );
                },
              )),
        ),
      ),
    ]));
  }
}
