import 'package:bright_me/config/route_name.dart';
import 'package:bright_me/pages/app_page.dart';
import 'package:bright_me/pages/auth/login_page.dart';
import 'package:bright_me/pages/auth/otp_page.dart';
import 'package:bright_me/pages/auth/register_page.dart';
import 'package:bright_me/pages/detection/camera_page.dart';
import 'package:bright_me/pages/detection/proces_result_page.dart';
import 'package:bright_me/pages/detection/recommendation_page.dart';
import 'package:bright_me/pages/eror_page.dart';
import 'package:bright_me/pages/homepage/community/community_page.dart';
import 'package:bright_me/pages/homepage/community/community_profile_page.dart';
import 'package:bright_me/pages/homepage/community/join_community.dart';
import 'package:bright_me/pages/homepage/detail_new_page.dart';
import 'package:bright_me/pages/homepage/glowup_edu/glowup_edu.dart';
import 'package:bright_me/pages/homepage/glowup_plan/glowup_detail.dart';
import 'package:bright_me/pages/homepage/glowup_plan/menu_glowup.dart';
import 'package:bright_me/pages/homepage/glowup_plan/notifications_page.dart';
import 'package:bright_me/pages/homepage/news_page.dart';
import 'package:bright_me/pages/homepage/spesial_product.dart';
import 'package:bright_me/pages/onboarding/onboarding_page.dart';
import 'package:bright_me/pages/payment_complete.dart';
import 'package:bright_me/pages/payment_page.dart';
import 'package:bright_me/pages/survey/survey_page.dart';
import 'package:flutter/material.dart';

import '../pages/homepage/glowup_plan/glowup_plan.dart';
import '../pages/instructions_payment.dart';

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
      case cameraPageRoute:
        return MaterialPageRoute(builder: (_) => const CameraPage());
      case processResultRoute:
        return MaterialPageRoute(builder: (_) => const ProcessResultPage());
      case recommendedProduct:
        return MaterialPageRoute(builder: (_) => const RecommendationPage());
      case newsRoute:
        return MaterialPageRoute(builder: (_) => const NewsPage());
      case detailNewsRoute:
        return MaterialPageRoute(builder: (_) => const DetailNewsPage());
      case spesialProductRoute:
        return MaterialPageRoute(builder: (_) => const SpesialProduct());
      case communityRoute:
        return MaterialPageRoute(builder: (_) => const CommunityPage());
      case joinCommunityRoute:
        return MaterialPageRoute(builder: (_) => const JoinCommunityPage());
      case communityProfileRoute:
        return MaterialPageRoute(builder: (_) => const CommunityProfilePage());
      case glowupEduRoute:
        return MaterialPageRoute(builder: (_) => const GlowUpEduPage());
      case glowUpPlanRoute:
        return MaterialPageRoute(builder: (_) => const GlowUpPlanPage());
      case glowUpMenuRoute:
        return MaterialPageRoute(builder: (_) => const MenuGlowUpPage());
      case glowUpDetail:
        return MaterialPageRoute(builder: (_) => const GlowUpPlanDetailPage());
      case notifGlowUp:
        return MaterialPageRoute(builder: (_) => const NotificationsPage());
      case paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentPage());
      case instructionsPayRoute:
        return MaterialPageRoute(builder: (_) => const IntructionPaymentPage());
      case paymentCompleteRoute:
        return MaterialPageRoute(builder: (_) => const PaymentCompletePage());

      default:
        return MaterialPageRoute(
            builder: (_) => ErorPage(
                  textEror: settings.arguments as String?,
                ));
    }
  }
}
