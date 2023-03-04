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
  static const String submit = "Submit";
  static const String email = "Email";
  static const String password = "Password";
  static const String name = "Full Name";
  static const String phone = "Phone Number";
  static const String accountExist = "Already Have an account?";
  static const String accountDontExist = "Dont have an account?";

  static const String settings = "Settings";
  static const String back = "Back";
  static const String lan = "Language";
  static const String signOut = "Sign out";
  static const String popular = "Popular";
  static const String home = 'Home';
  static const String cosmatics = 'Cosmatics';
  static const String seeAll = 'See All';
  static const String recentProduct = 'Recent Porducts';
  static const String cart = 'My Cart';
  static const String darkMode = 'Dark Mode';
  static const String details = 'Details';
  static const String addToCart = 'Add To Cart';
  static const String description = 'Description';
  static const String subTotal = 'Sub Total';
  static const String delivery = 'Delivery';
  static const String total = 'Total';
  static const String addProductsToCart = 'Add Products To Cart';

  // validation
  static const String validateName = 'Please Enter Your Full Name';
  static const String validateNumber = 'Please Enter Your Phone Number';
  static const String validateEmail = 'Please Enter Your Email';
  static const String validatePass = 'Please Enter Your Password';
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
          AppStrings.validateEmail: AppStrings.validateEmail,
          AppStrings.validatePass: AppStrings.validatePass,
          AppStrings.validateName: AppStrings.validateName,
          AppStrings.validateNumber: AppStrings.validateNumber,
          AppStrings.submit: AppStrings.submit,
          AppStrings.settings: AppStrings.settings,
          AppStrings.back: AppStrings.back,
          AppStrings.lan: AppStrings.lan,
          AppStrings.popular: AppStrings.popular,
          AppStrings.home: AppStrings.home,
          AppStrings.cosmatics: AppStrings.cosmatics,
          AppStrings.recentProduct: AppStrings.recentProduct,
          AppStrings.seeAll: AppStrings.seeAll,
          AppStrings.cart: AppStrings.cart,
          AppStrings.darkMode: AppStrings.darkMode,
          AppStrings.details: AppStrings.details,
          AppStrings.addToCart: AppStrings.addToCart,
          AppStrings.description: AppStrings.description,
          AppStrings.subTotal: AppStrings.subTotal,
          AppStrings.delivery: AppStrings.delivery,
          AppStrings.total: AppStrings.total,
          AppStrings.addProductsToCart: AppStrings.addProductsToCart,
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
          AppStrings.validateEmail: "الرجاء ادخال البريد الالكتروني",
          AppStrings.validatePass: "الرجاء ادخال كلمة السر",
          AppStrings.validateName: "الرجاء ادخال السم بالكامل",
          AppStrings.validateNumber: "الرجاء ادخال رقم الهاتف",
          AppStrings.submit: "ادخال",
          AppStrings.settings: "الأعدادات",
          AppStrings.back: "رجوع",
          AppStrings.lan: "اللغة",
          AppStrings.signOut: "نسجيل خروج",
          AppStrings.popular: "منتجات رائجة",
          AppStrings.home: "الرئيسية",
          AppStrings.cosmatics: "مستحضرات التجميل",
          AppStrings.recentProduct: "احدث المنتجات",
          AppStrings.seeAll: "الكل",
          AppStrings.darkMode: "الوضع الليلي",
          AppStrings.cart: "السلة",
          AppStrings.details: "التفاصيل",
          AppStrings.addToCart: "اضافة الي السلة",
          AppStrings.description: "وصف المنتج",
          AppStrings.subTotal: "السعر الجزئي",
          AppStrings.delivery: "سعر التوصيل",
          AppStrings.total: "السعر الكلي",
          AppStrings.addProductsToCart: "اضف منتجات الي السلة",
        },
      };
}
