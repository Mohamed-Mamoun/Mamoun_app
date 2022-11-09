import 'dart:async';
import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _delay() {
    _timer = Timer(const Duration(seconds: 3), _navigate);
  }

  _navigate() {
    Navigator.pushReplacementNamed(context, Routes.onBourdingRoute);
  }

  @override
  void initState() {
    super.initState();
    _delay();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage(AssetsManager.logoAsset)),
      ),
    );
  }
}
