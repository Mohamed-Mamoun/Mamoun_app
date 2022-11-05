import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ThemeManager {
  // App Theme
  ThemeData getAppTheme() {
    return ThemeData(

        // main app Colors
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
            elevation: Appsize.s4),

        // App bar Theme
        appBarTheme: AppBarTheme(
            color: ColorManager.primary,
            shadowColor: ColorManager.primaryOpacity70,
            centerTitle: true,
            elevation: Appsize.s4,
            titleTextStyle: StylesManager().getReqularStyle(
                color: ColorManager.white, fontSize: FontSize.s16)),

        // Button Theme
        buttonTheme: ButtonThemeData(
            shape: const StadiumBorder(),
            buttonColor: ColorManager.primary,
            disabledColor: ColorManager.grey1,
            splashColor: ColorManager.primaryOpacity70),

        // Elevated Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          textStyle: StylesManager().getReqularStyle(color: ColorManager.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Appsize.s12),
          ),
        )),

        // Text Theme
        textTheme: TextTheme(
            headline1: StylesManager().getSemiBoldStyle(
                color: ColorManager.darkGrey, fontSize: FontSize.s16),
            subtitle1:
                StylesManager().getMediumStyle(color: ColorManager.lightGrey),
            caption:
                StylesManager().getReqularStyle(color: ColorManager.grey1)),

        // Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.all(AppPadding.p8),
          helperStyle:
              StylesManager().getReqularStyle(color: ColorManager.grey1),
          labelStyle:
              StylesManager().getMediumStyle(color: ColorManager.darkGrey),
          errorStyle:
              StylesManager().getReqularStyle(color: ColorManager.error),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.grey,
                width: Appsize.s1_5,
              ),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Appsize.s8))),

          //  focused Border
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.primary,
                width: Appsize.s1_5,
              ),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Appsize.s8))),

          //  focused Error Border
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.grey,
                width: Appsize.s1_5,
              ),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Appsize.s8))),

          //  error Border
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorManager.error,
                width: Appsize.s1_5,
              ),
              borderRadius:
                  const BorderRadius.all(Radius.circular(Appsize.s8))),
        ));
  }
}
