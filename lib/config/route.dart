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
import 'package:bright_me/pages/homepage/glowup_plan/glowup_plan.dart';
import 'package:bright_me/pages/homepage/glowup_plan/menu_glowup.dart';
import 'package:bright_me/pages/homepage/glowup_plan/notifications_page.dart';
import 'package:bright_me/pages/homepage/news_page.dart';
import 'package:bright_me/pages/homepage/personal_consul/chat_page.dart';
import 'package:bright_me/pages/homepage/personal_consul/doctor_profile.dart';
import 'package:bright_me/pages/homepage/personal_consul/order_personal_consul.dart';
import 'package:bright_me/pages/homepage/personal_consul/personal_consul_page.dart';
import 'package:bright_me/pages/homepage/personal_consul/rate_doctor_page.dart';
import 'package:bright_me/pages/homepage/personal_consul/review_page.dart';
import 'package:bright_me/pages/homepage/spesial_product.dart';
import 'package:bright_me/pages/onboarding/onboarding_page.dart';
import 'package:bright_me/pages/payment/consul_paymnet_complete.dart';
import 'package:bright_me/pages/payment/glowup_payment_complete.dart';
import 'package:bright_me/pages/payment/instructions_payment.dart';
import 'package:bright_me/pages/payment/payment_page.dart';
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
        return MaterialPageRoute(
            builder: (_) => PaymentPage(
                  routeAfterPay: settings.arguments as String,
                ));
      case instructionsPayRoute:
        return MaterialPageRoute(
            builder: (_) => IntructionPaymentPage(
                  routeAfterPay: settings.arguments as String,
                ));
      case glowupPaymentCompleteRoute:
        return MaterialPageRoute(
            builder: (_) => const GlowUPaymentCompletePage());
      case personalConsulRoute:
        return MaterialPageRoute(builder: (_) => const PersonalConsulPage());
      case doctorProfileRoute:
        return MaterialPageRoute(builder: (_) => const DoctorProfile());
      case reviewDoctorRoute:
        return MaterialPageRoute(builder: (_) => const ReviewDoctorPage());
      case consulPaymentCompleteRoute:
        return MaterialPageRoute(builder: (_) => const ConsulPaymentComplete());
      case orderPersonalConsulroute:
        return MaterialPageRoute(
            builder: (_) => const OrderPersonalConsulPage());
      case rateDoctorRoute:
        return MaterialPageRoute(builder: (_) => const RateDoctorPage());
      case chatConsulRoute:
        return MaterialPageRoute(builder: (_) => const ChatPage());

      default:
        return MaterialPageRoute(
            builder: (_) => ErorPage(
                  textEror: settings.arguments as String?,
                ));
    }
  }
}
