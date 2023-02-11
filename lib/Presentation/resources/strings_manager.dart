import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStrings {
  // Locale
  static var arabic = const Locale('ar', 'AR');
  static var english = const Locale('en', 'US');
  //  //  //
  // undefined Route
  static const String undefinedRoute = "Route Not Found";
  //  //  //
  // Titles
  static const String onBourdingTitle1 = "Welcom To Your favorite App";
  static const String onBourdingTitle2 = "";
  static const String onBourdingTitle3 = "This is Title #3";
  static const String onBourdingTitle4 = "This is Title #4";
  //  //  //
  // SubTitles
  static const String onBourdingSubTitle1 =
      "Here We Are going to Talk about Software development Tegnologies";
  static const String onBourdingSubTitle2 = "This is Sub Title #2";
  static const String onBourdingSubTitle3 = "This is Sub Title #3";
  static const String onBourdingSubTitle4 = "This is Sub Title #4";

  static const String skip = "Skip";
  static const String next = "Next";
  static const String done = "Done";

  static const String login = "Sign In";
  static const String login2 = "Login";
  static const String signUp = "Sign up";
  static const String email = "Email";
  static const String password = "Password";
  static const String name = "Full Name";
  static const String phone = "Phone Number";
  static const String accountExist = "Already Have an account?";
  static const String accountDontExist = "Dont have an account?";
}

class LocalString extends Translations {
  @override

  //
  Map<String, Map<String, String>> get keys => {
        "en_Us": {
          AppStrings.accountExist: AppStrings.accountExist,
          AppStrings.login: AppStrings.login,
          AppStrings.login2: AppStrings.login2,
          AppStrings.signUp: AppStrings.signUp,
          AppStrings.next: AppStrings.next,
          AppStrings.done: AppStrings.done,
          AppStrings.email: AppStrings.email,
          AppStrings.password: AppStrings.password,
          AppStrings.skip: AppStrings.skip,
          AppStrings.accountDontExist: AppStrings.accountDontExist,
          AppStrings.name: AppStrings.name,
          AppStrings.phone: AppStrings.phone,
        },
        "ar": {
          AppStrings.login: "تسجيل دخول",
          AppStrings.login2: "تسجيل دخول",
          AppStrings.signUp: "انشاء حساب",
          AppStrings.next: "التالي",
          AppStrings.done: "انهاء",
          AppStrings.accountExist: "لديك حساب بالفعل؟",
          AppStrings.email: "البريد الالكتروني",
          AppStrings.password: "كلمة السر",
          AppStrings.skip: "تخطي",
          AppStrings.accountDontExist: "ليس لديك حساب؟",
          AppStrings.name: "الاسم",
          AppStrings.phone: "رقم الهاتف",
        },
      };
}
