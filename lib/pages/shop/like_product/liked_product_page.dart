import 'package:bright_me/bloc/like/like_bloc.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/models/product.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/loading_wigdet.dart';
import 'package:bright_me/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LikedProductPage extends StatefulWidget {
  const LikedProductPage({super.key});

  @override
  State<LikedProductPage> createState() => _LikedProductPageState();
}

class _LikedProductPageState extends State<LikedProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
            titleAppBar: "Liked Products",
            onPressedFunc: () => Navigator.pushNamedAndRemoveUntil(
              context,
              appRoute,
              (route) => false,
              arguments: 3,
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Material(
            color: purpleColor,
            child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34)),
                ),
                child: BlocBuilder<LikeBloc, LikeState>(
                  builder: (context, state) {
                    if (state is DeleteLikeProductByIdSuccess) {
                      return childWidget();
                    } else if (state is DeleteLikeProductByIdLoading) {
                      return const LoadingWidget();
                    }
                    return childWidget();
                  },
                )),
          ),
        ),
      ),
    );
  }

  Widget childWidget() {
    if (listUserLike.isNotEmpty) {
      return GridView.builder(
        physics: const ScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.5,
          mainAxisExtent: 270,
          crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: listUserLike.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductCard(product: listUserLike[index]);
        },
      );
    }
    return const Center(
      child: Text("List Liked Product empty"),
    );
  }
}
