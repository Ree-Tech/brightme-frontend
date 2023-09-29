import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/pages/survey/survey_one.dart';
import 'package:bright_me/pages/survey/survey_three.dart';
import 'package:bright_me/pages/survey/survey_two.dart';
import 'package:bright_me/widget/custom_button.dart';
import 'package:flutter/material.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  int _currentPage = 0;
  String surveyTwoValue =
      " "; // di isi data selected  value  dari survey_two.dart
  String surveyThreeValue =
      " "; // di isi data  selected  value  dari survey_theree.dart

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, appRoute);
    }
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: purpleColor,
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 30,
          ),
          child: IconButton(
              onPressed: () => _prevPage(),
              icon: const Icon(
                Icons.arrow_back,
                color: whiteColor,
              )),
        ),
        backgroundColor: purpleColor,
        title: Padding(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 30,
          ),
          child: Text(
            "Survey",
            textAlign: TextAlign.center,
            style: semiBold(
              sizeFont: 20,
              colorFont: whiteColor,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 30,
                    right: 30,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                          child: PageView(
                        onPageChanged: _onPageChanged,
                        controller: _pageController,
                        children: [
                          SurveyOnePage(
                            ageController: _ageController,
                            nameController: _nameController,
                          ),
                          SurveyTwoPage(
                            onSurveyTwoValueChanged: (value) {
                              setState(() {
                                surveyTwoValue = value;
                              });
                            },
                          ),
                          SurveyThreePage(
                            onSurveyThreeValueChanged: (value) {
                              setState(() {
                                surveyThreeValue = value;
                              });
                            },
                          ),
                        ],
                      )),
                      CustomButton(
                        buttonText: _currentPage < 2 ? "Next" : "Submit",
                        onPressed: () => _nextPage(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
