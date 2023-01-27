
import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/features/auth_module/login/login_screen.dart';
import 'package:elmokhtaser/features/auth_module/register/register_screen.dart';
import 'package:elmokhtaser/features/auth_module/verification/verification_screen.dart';
import 'package:elmokhtaser/features/welcome_module/on_boarding_screen.dart';
import 'package:elmokhtaser/features/welcome_module/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterGenarator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    
    switch (settings.name) 
    {

      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
        // case Routes.courseUnitScreen:
        // return MaterialPageRoute(builder: (context) =>  CourseUnitScreen(courseId:settings.arguments));
      case Routes.onBoarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case Routes.verification:
        return MaterialPageRoute(
            builder: (context) => const VerificationScreen());
      // case Routes.termsAndConditions:
      //   return MaterialPageRoute(
      //       builder: (context) => const TermsAndConditions());
      // case Routes.about:
      //   return MaterialPageRoute(builder: (context) => const AboutScreen());
      // case Routes.more:
      //   return MaterialPageRoute(builder: (context) => const MoreScreen());
      // case Routes.competitions:
      //   return MaterialPageRoute(builder: (context) => const ContestScreen());
      // case Routes.layout:
      //   return MaterialPageRoute(builder: (context) => const LayoutScreen());
      // case Routes.home:
      //   return MaterialPageRoute(builder: (context) => const HomeScreen());
      // case Routes.courses:
      //   return MaterialPageRoute(builder: (context) => const CoursesScreen());
      // case Routes.courseDetails:
      //   return MaterialPageRoute(
      //       builder: (context) => CourseDetailsScreen(
      //             coursesItem: settings.arguments,
      //           ));
      // case Routes.news:
      //   return MaterialPageRoute(builder: (context) => const NewsScreen());
      // case Routes.newsDetails:
      //   return MaterialPageRoute(
      //       builder: (context) => NewsDetailsScreen(
      //             newsId: settings.arguments,
      //           ));
      // case Routes.card:
      //   return MaterialPageRoute(builder: (context) => const CardScreen());
      // case Routes.privacy:
      //   return MaterialPageRoute(builder: (context) => const PrivacyScreen());
      // case Routes.personalCourses:
      //   return MaterialPageRoute(
      //       builder: (context) => const PersonalCoursesScreen());
      // case Routes.personalCoursesDetails:
      //   return MaterialPageRoute(
      //       builder: (context) => PersonalCoursesDetailsScreen(
      //             courseId: settings.arguments,
      //           ));
      // case Routes.profile:
      //   return MaterialPageRoute(builder: (context) => const ProfileScreen());
      // case Routes.testTrial:
      //   return MaterialPageRoute(
      //       builder: (context) => TestTrialScreen(
      //             contentChild: settings.arguments,
      //           ));
      // case Routes.certificate:
      //   return MaterialPageRoute(
      //       builder: (context) => const CertificateScreen());
      // case Routes.certificateView:
      //   return MaterialPageRoute(
      //       builder: (context) => CertificateViewScreen(
      //             certificateItem: settings.arguments,
      //           ));
      // case Routes.passwordEditing:
      //   return MaterialPageRoute(
      //       builder: (context) => const PasswordEditingScreen());
      // case Routes.profileSetting:
      //   return MaterialPageRoute(
      //       builder: (context) => const ProfileSettingScreen());
      // case Routes.marketing:
      //   return MaterialPageRoute(builder: (context) => const MarketingScreen());
      // case Routes.accountStatement:
      //   return MaterialPageRoute(
      //       builder: (context) => const AccountStatementScreen());
      // case Routes.answersView:
      //   return MaterialPageRoute(
      //       builder: (context) => AnswersViewScreen(
      //             sutdentExamResultModel: settings.arguments,
      //           ));
      // case Routes.singleAnswerView:
      //   return MaterialPageRoute(
      //       builder: (context) => SingleAnswerViewScreen(
      //             questionDetails: settings.arguments,
      //           ));
      // case Routes.mainTests:
      //   return MaterialPageRoute(builder: (context) => const MainTestsScreen());
      // case Routes.singleTestInfo:
      //   return MaterialPageRoute(
      //       builder: (context) => SingleTestInfoScreen(
      //             childList: settings.arguments,
      //           ));
      // case Routes.singleTest:
      //   return MaterialPageRoute(
      //       builder: (context) => SingleTestScreen(
      //             contentChildId: settings.arguments,
      //           ));
      // case Routes.chat:
      //   return MaterialPageRoute(builder: (context) => const ChatScreen());
      // case Routes.chatDetails:
      //   return MaterialPageRoute(
      //       builder: (context) => const ChatDetailsScreen());
      // case Routes.singleContest:
      //   return MaterialPageRoute(
      //       builder: (context) => SingleContestScreen(
      //             contestId: settings.arguments,
      //           ));
      // case Routes.multiAttemptScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => MultiAttemptScreen(
      //             attemptId: settings.arguments,
      //           ));
      // case Routes.paymentScreen:
      //   return MaterialPageRoute(builder: (context) => const PaymentScreen());
      // case Routes.pdfPreview:
      //   return MaterialPageRoute(builder: (context) => const PdfPreviewPage());
      // case Routes.notificationScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const NotificationScreen());
      // case Routes.lostInternetConnectionScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const LostInernetConnectionScreen());
      //         case Routes.generalTest:
      //   return MaterialPageRoute(
      //       builder: (context) => const GeneralTestScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) => Scaffold(body: Container()));
  }
}
