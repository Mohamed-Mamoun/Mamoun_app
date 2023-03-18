import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeManager {
///////////////////////////////////////////////
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColorDark: ColorManager.white,
      primaryColorLight: ColorManager.primary,
      primaryColor: ColorManager.primary,
      scaffoldBackgroundColor: const Color(0xFF222831),
      dividerColor: ColorManager.white,
      textTheme: TextTheme(
          titleLarge: TextStyle(
            color: ColorManager.white,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          headlineLarge: TextStyle(
            color: ColorManager.white,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          headlineMedium: TextStyle(
            color: ColorManager.white,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          headlineSmall: TextStyle(
            color: ColorManager.white,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          titleMedium: TextStyle(
            color: ColorManager.white,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          titleSmall: TextStyle(
            color: ColorManager.white,
            fontFamily: FontFamilyManager.fontFamily,
          )),
      iconTheme: IconThemeData(
        color: ColorManager.white,
      ),
      // App bar Theme
      appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF222831),
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarColor: ColorManager.primary),
          shadowColor: ColorManager.primary,
          centerTitle: true,
          elevation: 4,
          titleTextStyle: StylesManager().getReqularStyle(fontSize: 16)),

      // Button Theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          buttonColor: ColorManager.primary,
          disabledColor: ColorManager.grey1,
          splashColor: ColorManager.primaryOpacity70),

      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 10,
              shadowColor: ColorManager.darkGrey,
              backgroundColor: ColorManager.primary,
              padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 3),
              textStyle: StylesManager().getReqularStyle(fontSize: 20),
              shape: const StadiumBorder())),

      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        prefixIconColor: ColorManager.white.withOpacity(0.8),

        helperStyle: StylesManager().getReqularStyle(fontSize: 14),
        hintStyle: TextStyle(
            fontSize: 12.0.sp,
            fontFamily: FontFamilyManager.fontFamily,
            color: ColorManager.white),
        labelStyle: StylesManager().getMediumStyle(),
        errorStyle: StylesManager().getReqularStyle(),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGrey, width: 2.5)),

        //  focused Border
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary, width: 2.5)),

        //  focused Error Border
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGrey, width: 2.5)),

        //  error Border
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGrey, width: 2.5)),
      ));

  ///////////////////////////////////////////////
  static ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColorDark: ColorManager.darkGrey,
      primaryColorLight: ColorManager.black,
      primaryColor: ColorManager.primary,
      iconTheme: IconThemeData(color: ColorManager.primary),
      scaffoldBackgroundColor: ColorManager.white,
      // // main app Colors
      dividerColor: ColorManager.darkGrey,
      textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: ColorManager.black,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          headlineMedium: TextStyle(
            color: ColorManager.black,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          headlineSmall: TextStyle(
            color: ColorManager.black,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          titleLarge: TextStyle(
            color: ColorManager.black,
            fontSize: 18.sp,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          titleMedium: TextStyle(
            color: ColorManager.black,
            fontFamily: FontFamilyManager.fontFamily,
          ),
          titleSmall: TextStyle(
            color: ColorManager.black,
            fontFamily: FontFamilyManager.fontFamily,
          )),
      // App bar Theme
      appBarTheme: AppBarTheme(
        color: ColorManager.white,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: ColorManager.primary),
        shadowColor: ColorManager.primary,
        centerTitle: true,
        elevation: 4,
        titleTextStyle: TextStyle(
            color: ColorManager.darkGrey,
            fontWeight: FontWeight.w600,
            fontFamily: FontFamilyManager.fontFamily),
      ),

      // // Button Theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          buttonColor: ColorManager.primary,
          disabledColor: ColorManager.grey1,
          splashColor: ColorManager.primaryOpacity70),

      // // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 10,
              shadowColor: ColorManager.darkGrey,
              backgroundColor: ColorManager.primary,
              padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 3),
              textStyle: StylesManager().getReqularStyle(fontSize: 20),
              shape: const StadiumBorder())),

      // // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(10),
        prefixIconColor: ColorManager.darkGrey,

        helperStyle: StylesManager().getReqularStyle(fontSize: 14),
        hintStyle: TextStyle(
            fontSize: 12.0.sp,
            fontFamily: FontFamilyManager.fontFamily,
            color: ColorManager.darkGrey),
        labelStyle: StylesManager().getMediumStyle(),
        errorStyle: StylesManager().getReqularStyle(),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.darkGrey, width: 2.5)),

        //  focused Border
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary, width: 2.5)),

        //  focused Error Border
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGrey, width: 2.5)),

        //  error Border
        errorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 2.5)),
      ));
}

class ThemesController extends GetxController {
  final storage = GetStorage();

  var theme = 'light';

  @override
  void onInit() {
    super.onInit();

    getThemeState();
  }

  getThemeState() {
    if (storage.read('theme') != null) {
      return setTheme(storage.read('theme'));
    }

    setTheme('light');
  }

  void setTheme(String value) {
    theme = value;
    storage.write('theme', value);

    if (value == 'system') Get.changeThemeMode(ThemeMode.system);
    if (value == 'light') Get.changeThemeMode(ThemeMode.light);
    if (value == 'dark') Get.changeThemeMode(ThemeMode.dark);

    update();
  }
}
