import 'package:advance_course/Presentation/resources/routes_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal();
  static const MyApp instance = MyApp._internal();
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        builder: EasyLoading.init(),
        translations: LocalString(),
        theme: ThemeManager.lightTheme,
        locale: box.read('lang') == 'ar'
            ? const Locale('ar', 'AR')
            : const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RoutesGenerator.getRoute,
        initialRoute: Routes.splashRoute,
        defaultTransition: Transition.cupertino,
      ),
    );
  }
}
