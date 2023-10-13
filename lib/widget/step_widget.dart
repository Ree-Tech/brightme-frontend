import 'package:another_stepper/another_stepper.dart';
import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:flutter/material.dart';

class StepWidget extends StatelessWidget {
  final int indexStep;
  const StepWidget({
    Key? key,
    required this.indexStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnotherStepper(
      stepperList: [
        StepperData(
            title: StepperText(
              "Product",
              textStyle: reguler(sizeFont: 12),
            ),
            iconWidget: passStep()),
        StepperData(
            title: StepperText(
              "Order",
              textStyle: reguler(sizeFont: 12),
            ),
            iconWidget: passStep()),
        StepperData(
            title: StepperText(
              "Confirmation",
              textStyle: reguler(sizeFont: 12),
            ),
            iconWidget: indexStep > 2 ? passStep() : currentStep()),
        StepperData(
            title: StepperText(
              "Payment",
              textStyle: reguler(sizeFont: 12),
            ),
            iconWidget: indexStep >= 3 ? currentStep() : nonActieStep()),
      ],
      stepperDirection: Axis.horizontal,
      iconWidth: 30,
      iconHeight: 30,
      activeBarColor: purpleColor,
      inActiveBarColor: greyColor,
      inverted: true,
      verticalGap: 40,
      activeIndex: indexStep,
      barThickness: 6,
    );
  }

  Widget passStep() => Container(
        decoration: const BoxDecoration(
            color: purpleColor,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            )),
        child: const Center(
          child: Icon(
            Icons.check,
            color: whiteColor,
          ),
        ),
      );

  Widget currentStep() => Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(
            width: 1,
            color: purpleColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.check,
            color: purpleColor,
          ),
        ),
      );

  Widget nonActieStep() => Container(
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(
            width: 1,
            color: greyColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.check,
            color: greyColor,
          ),
        ),
      );
}
