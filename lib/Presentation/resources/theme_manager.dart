import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeManager {
///////////////////////////////////////////////
  static ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: ColorManager.primary,
      scaffoldBackgroundColor: const Color(0xFF222831),
      dividerColor: ColorManager.white,
      textTheme: TextTheme(
        titleLarge: TextStyle(color: ColorManager.white.withOpacity(0.8)),
        titleMedium: StylesManager().getMediumStyle(fontSize: 14.sp),
      ),
      iconTheme: IconThemeData(color: ColorManager.white),

      // App bar Theme
      appBarTheme: AppBarTheme(
          color: ColorManager.primary,
          shadowColor: ColorManager.primaryOpacity70,
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
      primaryColor: ColorManager.primary,
      iconTheme: IconThemeData(color: ColorManager.primary),
      scaffoldBackgroundColor: ColorManager.white,
      // // main app Colors
      dividerColor: ColorManager.darkGrey,

      // App bar Theme
      appBarTheme: AppBarTheme(
          color: ColorManager.primary,
          shadowColor: ColorManager.primaryOpacity70,
          centerTitle: true,
          elevation: 4,
          titleTextStyle: StylesManager().getReqularStyle(fontSize: 16)),

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
        prefixIconColor: ColorManager.darkGrey,
        contentPadding: const EdgeInsets.all(10),
        helperStyle: TextStyle(
            fontSize: 12.0.sp,
            fontFamily: FontFamilyManager.fontFamily,
            color: ColorManager.darkGrey),
        counterStyle: TextStyle(
            fontSize: 12.0.sp,
            fontFamily: FontFamilyManager.fontFamily,
            color: ColorManager.darkGrey),
        hintStyle: TextStyle(
            fontSize: 12.0.sp,
            fontFamily: FontFamilyManager.fontFamily,
            color: ColorManager.darkGrey),
        labelStyle: StylesManager().getMediumStyle(),
        errorStyle: StylesManager().getReqularStyle(),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGrey, width: 2.5)),

        //   //  focused Border
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.primary, width: 2.5)),

        //   //  focused Error Border
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGrey, width: 2.5)),

        //   //  error Border
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorManager.lightGrey, width: 2.5)),
      ));
}
