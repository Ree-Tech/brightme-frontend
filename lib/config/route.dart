import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/pages/app_page.dart';
import 'package:bright_me/pages/auth/login_page.dart';
import 'package:bright_me/pages/auth/otp_page.dart';
import 'package:bright_me/pages/auth/register_page.dart';
import 'package:bright_me/pages/detection/camera_page.dart';
import 'package:bright_me/pages/detection/proces_result_page.dart';
import 'package:bright_me/pages/detection/recommendation_page.dart';
import 'package:bright_me/pages/eror_page.dart';
import 'package:bright_me/pages/onboarding/onboarding_page.dart';
import 'package:bright_me/pages/survey/survey_page.dart';
import 'package:flutter/material.dart';

class RouteGenarator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case surveyRoute:
        return MaterialPageRoute(builder: (_) => const SurveyPage());
      case otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpPage());
      case appRoute:
        return MaterialPageRoute(builder: (_) => const AppPages());
      case cameraPage:
        return MaterialPageRoute(builder: (_) => const CameraPage());
      case processResultPage:
        return MaterialPageRoute(builder: (_) => const ProcessResultPage());
      case recommendedProduct:
        return MaterialPageRoute(builder: (_) => const RecommendationPage());

      default:
        return MaterialPageRoute(
            builder: (_) => ErorPage(
                  textEror: settings.arguments as String,
                ));
    }
  }
}
