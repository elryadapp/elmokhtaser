import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppUi {
  static _AppColors get colors => _AppColors();
  static _AppAssets get assets => _AppAssets();
  static _AppFonts get fonts => _AppFonts();
  static _Others get shared => _Others();
  static _AppThemes get themes => _AppThemes();
}

class _AppColors {
  final activeColor = const Color(0xff4FAB79);
  final correctCardColor = const Color(0xff7518DD);
  final emptyAnsCardColor = const Color(0xff3D67E7);
  final titleColor = const Color(0xff484848);
  final subTitleColor = const Color(0xff727272);
  final btnBgColor = const Color(0xffF3F3F3);
  final shadeColor = const Color.fromARGB(255, 191, 203, 207);
  final mainColor = const Color(0xff29B4E3);
  final secondryColor = const Color(0xffF3F3F3);
  final bgColor = const Color(0xffF9F9F9);
  final buttonColor = const Color(0xffED7565);

  final borderColor = const Color(0xffDADADA);

  final whiteColor = Colors.white;
}

class _AppThemes {
  Map<int, Color> color = {
    50: const Color(0xff29B4E3),
    100: const Color(0xff29B4E3),
    200: const Color(0xff29B4E3),
    300: const Color(0xff29B4E3),
    400: const Color(0xff29B4E3),
    500: const Color(0xff29B4E3),
    600: const Color(0xff29B4E3),
    700: const Color(0xff29B4E3),
    800: const Color(0xff29B4E3),
    900: const Color(0xff29B4E3),
  };

  ThemeData get lightTheme => ThemeData(
        primarySwatch: MaterialColor(0xff29B4E3, color),
        scaffoldBackgroundColor: AppUi.colors.bgColor,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          elevation: 20,
          selectedItemColor: AppUi.colors.mainColor,
        ),
        appBarTheme: AppBarTheme(
            titleSpacing: 20,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: AppUi.colors.whiteColor,
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: AppUi.colors.mainColor,
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark),
            backgroundColor: AppUi.colors.mainColor,
            elevation: 0,
            iconTheme: IconThemeData(color: AppUi.colors.whiteColor)),
      );
}

class _AppFonts {}

class _AppAssets {
  final lottieNotification = 'assets/lottie/notification.json';
  final contest = 'assets/images/contest.jpg';
  final madaLogo = 'assets/icons/Mada_Logo.png';
  final visaLogo = 'assets/icons/visa.png';
  final signture = 'assets/images/signature.png';
  final certificateBg = 'assets/images/certificate_bg.png';
  final certificateShape1 = 'assets/images/shape1.png';
  final certificateShape2 = 'assets/images/shape2.png';

  final pdfIcon = 'assets/icons/pdf.png';
  final zoomIcon = 'assets/icons/zoom_icon.png';
  final zoom = 'assets/icons/zoom.png';

  final empty = 'assets/lottie/empty.json';
final noInternetLottie='assets/lottie/no-internet.json';
  final networkImageBaseLink = 'https://emary.azq1.com/Mo5tsr/';
  final gradCap = 'assets/icons/grad_cap.png';
  final homeFake1 = 'assets/images/home_fake1.png';
  final logo = 'assets/images/logo.png';
  final cardIcon = 'assets/icons/card_icon.png';
  final onBoarding = 'assets/images/onboarding.png';
  final logoName = 'assets/images/logo_name.png';
  final fakeCourseImg = 'assets/images/fake_couse_img.png';

  final couresImg = 'assets/images/cour_img.png';
  final testImg = 'assets/images/test_img.png';
  final loadingLottie = 'assets/lottie/loading.json';
  final examImg = 'assets/images/exam.png';
}

class _Others {}
