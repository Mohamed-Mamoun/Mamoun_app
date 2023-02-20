import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemeManager {
  // App Theme
  ThemeData getAppTheme() {
    return ThemeData(
        scaffoldBackgroundColor: ColorManager.white,
        // main app Colors
        dividerColor: ColorManager.lightGrey,
        primaryColor: ColorManager.primary,
        primaryColorLight: ColorManager.primaryOpacity70,
        primaryColorDark: ColorManager.darkPrimary,
        disabledColor: ColorManager.grey1,
        shadowColor: ColorManager.primaryOpacity70,
        colorScheme:
            ColorScheme.fromSwatch().copyWith(secondary: ColorManager.grey),

        // Card Theme
        cardTheme: CardTheme(
            color: ColorManager.white,
            shadowColor: ColorManager.grey,
            elevation: 4),

        // App bar Theme
        appBarTheme: AppBarTheme(
            color: ColorManager.primary,
            shadowColor: ColorManager.primaryOpacity70,
            centerTitle: true,
            elevation: 4,
            titleTextStyle: StylesManager()
                .getReqularStyle(color: ColorManager.white, fontSize: 16)),

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 110, vertical: 3),
                textStyle: StylesManager()
                    .getReqularStyle(color: ColorManager.white, fontSize: 20),
                shape: const StadiumBorder())),

        // Text Theme
        textTheme: TextTheme(
            displayLarge: StylesManager().getSemiBoldStyle(
                color: ColorManager.darkGrey, fontSize: 18.sp),
            titleMedium: StylesManager()
                .getMediumStyle(color: ColorManager.darkGrey, fontSize: 14.sp),
            bodySmall:
                StylesManager().getReqularStyle(color: ColorManager.grey1)),

        // Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(10),
          helperStyle: StylesManager()
              .getReqularStyle(color: ColorManager.grey1, fontSize: 14),
          hintStyle: TextStyle(
              fontSize: 12.0.sp,
              fontFamily: FontFamilyManager.fontFamily,
              color: ColorManager.darkGrey),
          labelStyle:
              StylesManager().getMediumStyle(color: ColorManager.darkGrey),
          errorStyle:
              StylesManager().getReqularStyle(color: ColorManager.error),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.lightGrey, width: 2.5)),

          //  focused Border
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.primary, width: 2.5)),

          //  focused Error Border
          focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.lightGrey, width: 2.5)),

          //  error Border
          errorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorManager.lightGrey, width: 2.5)),
        ));
  }
}
