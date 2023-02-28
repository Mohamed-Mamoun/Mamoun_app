import 'dart:async';
import 'package:advance_course/Presentation/Home/home_view.dart';
import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/routes_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  void initState() {
    super.initState();
    _delay();
  }

  _delay() {
    _timer = Timer(const Duration(seconds: 6), _navigate);
  }

  _navigate() {
    Navigator.pushReplacementNamed(
        context,
        GetStorage().read('onBourdingDone') == 'completed' &&
                FirebaseAuth.instance.currentUser != null
            ? Routes.mainRoute
            : GetStorage().read('onBourdingDone') == 'completed'
                ? Routes.loginRoute
                : Routes.onBourdingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Center(
        child: Image.asset(
          AssetsManager.logoAsset,
        ),
      ),
    );
  }
}
