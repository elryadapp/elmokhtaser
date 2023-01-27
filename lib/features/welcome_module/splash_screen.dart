import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:sizer/sizer.dart';
import 'package:elmokhtaser/core/components/animated_page.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        const Duration(
          milliseconds: 2000,
        ), () async {
      if (Constants.token.isNotEmpty || Constants.token != '') {
        // await CartCubit.get(context).getAllCartItems(context);
        // await NotificationCubit.get(context).getUserNotification(context);
        Navigator.pushReplacementNamed(context, Routes.layout);
      } else {
        Navigator.pushReplacementNamed(context, Routes.onBoarding);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [AppUi.colors.shadeColor, AppUi.colors.bgColor])),
            child:Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    AppSlideAnimation(
                      horizontalOffset: 100,
                      child: Center(
                          child: Image.asset(AppUi.assets.logo),
                        ),
                    ),
                      SizedBox(
                        height: 3.h,
                      ),
                    AppSlideAnimation( verticalOffset: 100.0,
                        child: Center(
                          child: Image.asset(AppUi.assets.logoName)))
                     ,
                      SizedBox(
                        height: 7.h,
                      ),
                       BuildCondition(
                        condition: state is GetAllCartLoadingState||state is GetUserNotificationLoadingState,
                        fallback: (context)=>Container(),
                        builder: (context) {
                          return AppUtil.appLoader(height: 14.h);
                        }
                      ),
                    ],
                  ),
                ),
          ),
        );
      },
    );
  }
}
