import 'package:bright_me/bloc/detection/detection_bloc.dart';
import 'package:bright_me/constants/recomendation_const.dart';
import 'package:bright_me/widget/loading_wigdet.dart';
import 'package:bright_me/widget/snackbar.dart';
import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/widget/custom_appbar.dart';
import 'package:bright_me/widget/custom_button.dart';

import 'package:bright_me/widget/row_product_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProcessResultPage extends StatefulWidget {
  final String imagePath;
  const ProcessResultPage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<ProcessResultPage> createState() => _ProcessResultPageState();
}

class _ProcessResultPageState extends State<ProcessResultPage> {
  @override
  void initState() {
    context
        .read<DetectionBloc>()
        .add(PostPhotoDetectionEvent(widget.imagePath));
    super.initState();
  }

  Future _dialogPop(
    String title,
    String buttonText,
    void Function() onTap,
  ) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            title: Text(
              title,
              style: medium(colorFont: blackColor, sizeFont: 14),
              textAlign: TextAlign.center,
            ),
            actions: [
              Center(
                child: SizedBox(
                    width: 210,
                    child: CustomButton(
                      buttonText: buttonText,
                      onPressed: onTap,
                    )),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          CustomAppBar(
              titleAppBar: "Process Result",
              onPressedFunc: () async {
                await _dialogPop(
                    "Do you want to track your face progress?", "Save Now!",
                    () {
                  context
                      .read<DetectionBloc>()
                      .add(SaveImageEvent(widget.imagePath));
                });
              })
        ],
        body: BlocConsumer<DetectionBloc, DetectionState>(
          listener: (context, state) {
            if (state is PostDetectionEror) {
              showSnackBar(
                context,
                state.text,
                purpleColor,
                whiteColor,
              );
            } else if (state is SaveImageEror) {
              showSnackBar(
                context,
                state.text,
                purpleColor,
                whiteColor,
              );
            } else if (state is SaveImageSuccess) {
              _dialogPop("Save Success", "Back To Homepage", () {
                Navigator.pushNamedAndRemoveUntil(
                    context, appRoute, (route) => false);
              });
            }
          },
          builder: (context, state) {
            if (state is PostDetectionLoading || state is SaveImageLoading) {
              return const LoadingWidget(
                color: whiteColor,
              );
            } else if (state is PostDetectionSuccess) {
              return const ResultSuccess();
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class ResultSuccess extends StatefulWidget {
  const ResultSuccess({
    Key? key,
  }) : super(key: key);

  @override
  State<ResultSuccess> createState() => _ResultSuccessState();
}

class _ResultSuccessState extends State<ResultSuccess> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () async {
      await _dialogPop();
    });
    super.initState();
  }

  Future _dialogPop() async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            title: Text(
              "Your Face Condition:",
              style: medium(colorFont: blackColor, sizeFont: 14),
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Acne and Oily",
              textAlign: TextAlign.center,
              style: medium(
                sizeFont: 16,
                colorFont: purpleColor,
              ),
            ),
            actions: [
              Center(
                child: SizedBox(
                    width: 210,
                    child: CustomButton(
                      buttonText: "Check the Detail Now!",
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(34), topRight: Radius.circular(34)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 167,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24), color: lightPuprle),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Text(
                          "Information",
                          textAlign: TextAlign.center,
                          style: semiBold(
                            sizeFont: 16,
                            colorFont: purpleColor,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.info_rounded,
                        color: purpleColor,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "The result is base on probability results. The highest probability, it's more likely to become the result. For the best result, please refers to the guideline for taking the picture or consultation with a doctor who is already available on this application",
                          style: reguler(
                            sizeFont: 12,
                            colorFont: purpleColor,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 16),
              child: Text(
                "Summary",
                style: semiBold(sizeFont: 16),
              ),
            ),
            Container(
              height: 167,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    width: 1,
                    color: purpleColor,
                  ),
                  color: lightWhite),
              child: Column(
                children: [
                  Text(
                    "Daily Tips",
                    textAlign: TextAlign.center,
                    style: semiBold(
                      sizeFont: 16,
                      colorFont: purpleColor,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "1.Wash problem areas with a gentle cleanser.\n2.Try over-the-counter acne products to dry excess oil and promote peeling.Avoid irritants.\n3.Protect your skin from the sun. Avoid friction or pressure on your skin.\n4.Avoid touching or picking acne-prone areas.\n5.Shower after strenuous activities.",
                          style: reguler(
                            sizeFont: 12,
                            colorFont: darGreykColor,
                          ),
                          softWrap: true,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 16),
              child: Text(
                "Product Recommendation",
                style: semiBold(sizeFont: 16),
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = recoData[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 16),
                    child: RowProductCard(
                      name: item['name']!,
                      image: item['image']!,
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, recommendedProduct),
              child: Text(
                "View More",
                style: medium(
                  sizeFont: 12,
                  colorFont: greyColor,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 16),
              child: Text(
                "Recommended for You",
                style: semiBold(sizeFont: 16),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, glowUpPlanRoute),
              child: Image.asset("assets/images/banner1.jpg"),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, glowUpPlanRoute),
              child: Image.asset("assets/images/banner2.jpg"),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
