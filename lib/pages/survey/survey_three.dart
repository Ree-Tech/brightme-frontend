import 'package:flutter/material.dart';

import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/constants/survey_data.dart';
import 'package:bright_me/widget/custom_radio.dart';

class SurveyThreePage extends StatefulWidget {
  final ValueChanged<String> onSurveyThreeValueChanged;
  const SurveyThreePage({
    Key? key,
    required this.onSurveyThreeValueChanged,
  }) : super(key: key);

  @override
  State<SurveyThreePage> createState() => _SurveyThreePageState();
}

class _SurveyThreePageState extends State<SurveyThreePage> {
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
          itemCount: surveyThreeData.length,
          itemBuilder: (context, index) {
            return CustomRadio(
              label: Text(
                surveyThreeData[index],
                style: medium(sizeFont: 16),
              ),
              groupValue: selectedRadioTile,
              value: index,
              onChanged: (value) {
                setState(() {
                  selectedRadioTile = value;
                });
                widget.onSurveyThreeValueChanged(
                    surveyThreeData[selectedRadioTile!]);
              },
            );
          },
        ),
      ],
    );
  }
}
