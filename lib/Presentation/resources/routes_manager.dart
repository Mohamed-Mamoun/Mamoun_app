import 'package:advance_course/Presentation/forget_password/forget_password.dart';
import 'package:advance_course/Presentation/login/login.dart';
import 'package:advance_course/Presentation/Home/home_view.dart';
import 'package:advance_course/Presentation/onBourding/onbourding.dart';
import 'package:advance_course/Presentation/register/register.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/splash/splash.dart';
import 'package:advance_course/Presentation/cart/cart.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String loginRoute = '/login';
  static const String mainRoute = '/main';
  static const String onBourdingRoute = '/onbourding';
  static const String rigisterRoute = '/register';
  static const String splashRoute = '/';
  static const String storeDetailsRoute = '/storeDetails';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBourdingRoute:
        return MaterialPageRoute(builder: (_) => const OnBourdingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.rigisterRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const CartView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(
                  AppStrings.undefinedRoute,
                  style: StylesManager().getReqularStyle(fontSize: 17),
                ),
              ),
              body: Center(
                  child: Text(
                AppStrings.undefinedRoute,
                style: StylesManager().getReqularStyle(fontSize: 22),
              )),
            ));
  }
}
