import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yuyuid/app/routes/app_pages.dart';
import 'package:yuyuid/app/routes/app_pages.dart';
import 'package:yuyuid/shared/shared.dart';
import 'package:yuyuid/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //disabled portrait or landscape
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await GetStorage.init();
  !kIsWeb ? Platform.isAndroid : ThemeService().changeNavigationBarThemes();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int connectionType = 0;
  late StreamSubscription _streamSubscription;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        title: "Applications",
        smartManagement: SmartManagement.keepFactory,
        // initialRoute: Routes.HOME,
        initialRoute: Routes.HOME,
        theme: ThemeConfig.lightTheme,
        defaultTransition: Transition.noTransition,
        //this would be the solution
        transitionDuration: Duration(seconds: 0),
        builder: EasyLoading.init(),
        getPages: AppPages.routes
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
  // ..indicatorSize = 45.0
    ..radius = 10.0
  // ..progressColor = Colors.yellow
    ..backgroundColor = ColorConstants.lightGray
    ..indicatorColor = hexToColor('#64DEE0')
    ..textColor = hexToColor('#64DEE0')
  // ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
