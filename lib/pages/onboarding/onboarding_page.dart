import 'package:bright_me/config/color_theme.dart';
import 'package:bright_me/config/font_theme.dart';
import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/constants/onboarding_data.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, loginRoute);
    }
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skipPage() {
    _pageController.jumpToPage(2);
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          itemCount: onboardingData.length,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    onboardingData[index]['image'],
                    height: 300,
                    width: 280,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: screenSize * 0.4,
                  decoration: const BoxDecoration(
                    color: purpleColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 34, left: 30, right: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          onboardingData[index]['title'],
                          style: bold(
                            sizeFont: 20,
                            colorFont: whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17, bottom: 35),
                          child: Text(
                            onboardingData[index]['subtitle'],
                            style: medium(
                              sizeFont: 12,
                              colorFont: whiteColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () => _nextPage(),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: whiteColor,
                              fixedSize: Size(screenSize, 48),
                              shape: const StadiumBorder()),
                          child: Text(
                            _currentPage != onboardingData.length - 1
                                ? "Next"
                                : "Get Started",
                            style: semiBold(
                              sizeFont: 16,
                              colorFont: purpleColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Visibility(
                                visible: _currentPage > 0,
                                child: ElevatedButton(
                                  onPressed: () => _prevPage(),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: purpleColor,
                                  ),
                                  child: Text(
                                    "Prev",
                                    style: semiBold(
                                      sizeFont: 16,
                                      colorFont: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                              DotsIndicator(
                                dotsCount: onboardingData.length,
                                position: _currentPage,
                                decorator: DotsDecorator(
                                  size: const Size.square(4),
                                  color: whiteColor,
                                  activeColor: whiteColor,
                                  activeSize: const Size(47, 4),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                ),
                              ),
                              Visibility(
                                visible:
                                    _currentPage != onboardingData.length - 1,
                                child: ElevatedButton(
                                  onPressed: () => _skipPage(),
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: purpleColor,
                                  ),
                                  child: Text(
                                    "Skip",
                                    style: semiBold(
                                      sizeFont: 16,
                                      colorFont: whiteColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
