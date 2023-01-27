import 'package:elmokhtaser/core/components/bloc_observer.dart';
import 'package:elmokhtaser/core/network/local/cache_helper.dart';
import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/notification_helper.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/elmokhtaser_root/elmokhtaser_root.dart';
import 'package:elmokhtaser/features/auth_module/_exports.dart';
import 'package:elmokhtaser/firebase_options.dart';
import 'package:elmokhtaser/generated/codegen_loader.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  await DioHelper.init();
  await NotificationHelper.init();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);

   Bloc.observer = MyBlocObserver();

    runApp(
     EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      startLocale:  Locale(Constants.lang),
      saveLocale: true,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: const ElmokhtaserApp())
    );
 
}
