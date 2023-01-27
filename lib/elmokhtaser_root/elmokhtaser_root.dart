import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/config/app_routes/route_generator.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/bloc_providers.dart';
import 'package:elmokhtaser/features/auth_module/_exports.dart';
import 'package:flutter/material.dart';
class ElmokhtaserApp extends StatelessWidget {
  const ElmokhtaserApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:BlocProviders.providers(context),
      child: Sizer(builder: (context, orientation, deviceType) {
        return  MaterialApp(
              title: 'El-Moktaser El-Shamel',
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: AppUi.themes.lightTheme,
              debugShowCheckedModeBanner: false,
              initialRoute: Routes.splash,
              onGenerateRoute: RouterGenarator.generateRoute,
            
        );
      }),
    );
  }
}
