import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bright_me/bloc/cart/cart_bloc.dart';
import 'package:bright_me/bloc/like/like_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/product_const.dart';
import 'package:bright_me/models/product.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:bright_me/widget/review_card.dart';
import 'package:bright_me/widget/snackbar.dart';

class DetailProductPage extends StatefulWidget {
  final Product product;
  final Function(bool) onLikeStatusChanged;
  const DetailProductPage({
    Key? key,
    required this.product,
    required this.onLikeStatusChanged,
  }) : super(key: key);

  @override
  State<DetailProductPage> createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage>
    with SingleTickerProviderStateMixin {
  int _carrouselIndex = 0;
  late bool isfavorite;
  late TabController _tabController;
  int _selectedVariant = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabChange);
    isfavorite = widget.product.isLike;
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();

    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPuprle,
      body: SafeArea(
          child: Stack(
        children: [
          BlocListener<CartBloc, CartState>(
            listener: (context, state) {
              if (state is AddCartItemSuccess) {
                showSnackBar(context, "Add item to cart");
              } else if (state is AddCartItemEror) {
                showSnackBar(context, "fail add item");
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.3,
                    child: Stack(
                      children: [
                        SizedBox(
                          child: CarouselSlider.builder(
                            options: CarouselOptions(
                              viewportFraction: 1,
                              enlargeCenterPage: true,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _carrouselIndex = index;
                                });
                              },
                            ),
                            itemCount: widget.product.productImages.length,
                            itemBuilder: (
                              BuildContext context,
                              int itemIndex,
                              int pageViewIndex,
                            ) =>
                                Image.network(
                              widget.product.productImages[itemIndex].img,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: DotsIndicator(
                            dotsCount: widget.product.productImages.length,
                            position: _carrouselIndex,
                            decorator: DotsDecorator(
                              size: const Size.square(4),
                              color: greyColor,
                              activeColor: purpleColor,
                              activeSize: const Size(47, 4),
                              activeShape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topRight,
                            child: ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                    shadowColor:
                                        const Color.fromRGBO(0, 0, 0, 0.25),
                                    backgroundColor: const Color.fromRGBO(
                                        186, 160, 202, 0.50),
                                    fixedSize: const Size(24, 24),
                                    shape: const CircleBorder()),
                                child: const Icon(
                                  Icons.close,
                                  color: lightWhite,
                                )))
                      ],
                    ),
                  ),
                  Container(
                    color: lightWhite,
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Stok: 8",
                              style: reguler(
                                sizeFont: 14,
                                colorFont: purpleColor,
                              ),
                            ),
                            ElevatedButton(
                                onPressed: () {
                                  if (isfavorite) {
                                    context
                                        .read<LikeBloc>()
                                        .add(DeleteLikeProductByIdEvent(
                                          widget.product.idLike!,
                                          widget.product,
                                        ));
                                  } else {
                                    context
                                        .read<LikeBloc>()
                                        .add(AddLikedProductEvent(
                                          widget.product,
                                          widget
                                              .product.productVariations[0].id,
                                        ));
                                  }
                                  setState(() {
                                    isfavorite = !isfavorite;
                                    widget.product.isLike = isfavorite;
                                    widget.onLikeStatusChanged(isfavorite);
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: whiteColor,
                                    fixedSize: const Size(32, 32),
                                    shape: const CircleBorder()),
                                child: isfavorite
                                    ? const Icon(
                                        Icons.favorite,
                                        color: purpleColor,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.favorite_outline,
                                        color: purpleColor,
                                        size: 20,
                                      )),
                          ],
                        ),
                        SizedBox(
                          height: 47,
                          width: 200,
                          child: Wrap(
                            children: [
                              Text(
                                widget.product.name,
                                style: medium(
                                  sizeFont: 16,
                                  colorFont: blackColor,
                                ),
                                softWrap: true,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 55,
                              width: 200,
                              child: Wrap(
                                children: [
                                  Text(
                                    widget.product.summary,
                                    style: reguler(
                                      sizeFont: 12,
                                      colorFont: greyColor,
                                    ),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                            !widget.product.hasDiscount()
                                ? discountPriceWidget()
                                : normalPriceWidget(),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                          child: TabBar(
                              controller: _tabController,
                              labelColor: whiteColor,
                              unselectedLabelColor: purpleColor,
                              indicator: BoxDecoration(
                                color: tabColorOrder,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              tabs: const [
                                Tab(
                                  child: Text("Description"),
                                ),
                                Tab(
                                  child: Text("Reviews"),
                                ),
                                Tab(
                                  child: Text("Usage"),
                                ),
                              ]),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 300,
                          child: TabBarView(
                            controller: _tabController,
                            children: [
                              SizedBox(
                                height: 60,
                                child: Column(
                                  children: [
                                    Text.rich(
                                      TextSpan(children: [
                                        TextSpan(
                                          text: widget.product.description,
                                          style: medium(
                                            sizeFont: 12,
                                            colorFont: greyColor,
                                          ),
                                        ),
                                      ]),
                                    ),
                                    Row(
                                      children: [
                                        Wrap(
                                          spacing: 6,
                                          direction: Axis.horizontal,
                                          children: choiceChips(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              ListView(
                                  shrinkWrap: true,
                                  physics: const ScrollPhysics(),
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: SizedBox(
                                        width: 130,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: yellowColor,
                                            ),
                                            Text(
                                              "4.9",
                                              style: medium(
                                                colorFont: yellowColor,
                                                sizeFont: 14,
                                              ),
                                            ),
                                            Text(
                                              "(99 Reviews)",
                                              style: medium(
                                                colorFont: greyColor,
                                                sizeFont: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Column(
                                      children: reviewProductData
                                          .take(3)
                                          .map((item) => CardReviewWidget(
                                              image: item['image']!,
                                              personName: item['name']!,
                                              date: item['date']!,
                                              content: item['content']!))
                                          .toList(),
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 15,
                                        ),
                                        child: Text(
                                          "View more",
                                          style: medium(
                                            sizeFont: 16,
                                            colorFont: purpleColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.1,
                                    )
                                  ]),
                              ListView(
                                children: [
                                  Wrap(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.product.usage,
                                            style: medium(
                                              sizeFont: 12,
                                              colorFont: greyColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.1,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
                padding: const EdgeInsets.all(24),
                color: lightWhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        context.read<CartBloc>().add(AddCartItemEvent(widget
                            .product.productVariations[_selectedVariant].id));
                      },
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(160, 48),
                          side: const BorderSide(
                            color: purpleColor,
                            width: 1,
                          ),
                          shape: const StadiumBorder()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.shopping_cart_outlined,
                            color: purpleColor,
                            size: 24,
                          ),
                          Text(
                            "Add to Cart",
                            style: semiBold(
                              colorFont: purpleColor,
                              sizeFont: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 160,
                      child: CustomButton(
                        onPressed: () {},
                        buttonText: "Buy Now",
                      ),
                    )
                  ],
                )),
          )
        ],
      )),
    );
  }

  Widget normalPriceWidget() {
    return Text(
      "Rp ${widget.product.productVariations[_selectedVariant].price}",
      style: semiBold(
        colorFont: purpleColor,
        sizeFont: 20,
      ),
    );
  }

  Widget discountPriceWidget() {
    return Column(
      children: [
        Text(
          "Rp ${widget.product.discountPrice(_selectedVariant)}",
          style: semiBold(
            colorFont: purpleColor,
            sizeFont: 20,
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        Text("Rp ${widget.product.productVariations[_selectedVariant].price}",
            style: const TextStyle(
              fontSize: 10,
              color: greyColor,
              decoration: TextDecoration.lineThrough,
              decorationColor: purpleColor,
            ))
      ],
    );
  }

  List<Widget> choiceChips() {
    List<Widget> chips = [];
    for (int i = 0; i < widget.product.productVariations.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(
          top: 30,
        ),
        child: ChoiceChip(
          label: Text(widget.product.productVariations[i].name),
          labelStyle: medium(
            colorFont: purpleColor,
            sizeFont: 10,
          ),
          backgroundColor: whiteColor,
          selected: _selectedVariant == i,
          selectedColor: lightPuprle,
          onSelected: (bool value) {
            setState(() {
              _selectedVariant = i;
            });
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }
}
