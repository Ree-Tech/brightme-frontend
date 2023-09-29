import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/survey_data.dart';
import 'package:bright_me/widget/custom_radio.dart';

class SurveyTwoPage extends StatefulWidget {
  final ValueChanged<String> onSurveyTwoValueChanged;
  const SurveyTwoPage({
    Key? key,
    required this.onSurveyTwoValueChanged,
  }) : super(key: key);

  @override
  State<SurveyTwoPage> createState() => _SurveyTwoPageState();
}

class _SurveyTwoPageState extends State<SurveyTwoPage> {
  int? selectedRadioTile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What do you feel now?",
          style: semiBold(
            sizeFont: 16,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "You can choose 1 which you are sure of the most",
          style: medium(
            sizeFont: 12,
            colorFont: greyColor,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: surveyTwoData.length,
          itemBuilder: (context, index) {
            return CustomRadio(
              label: Text(
                surveyTwoData[index],
                style: medium(sizeFont: 16),
              ),
              groupValue: selectedRadioTile,
              value: index,
              onChanged: (value) {
                setState(() {
                  selectedRadioTile = value;
                });
                widget
                    .onSurveyTwoValueChanged(surveyTwoData[selectedRadioTile!]);
              },
            );
          },
        ),
      ],
    );
  }
}
