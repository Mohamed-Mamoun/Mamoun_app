import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

final ThemesController _themesController = Get.find();

showAppearanceModal(ThemeData theme, String current) {
  Get.bottomSheet(Container(
    padding: const EdgeInsets.all(16),
    height: 270.h,
    decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select a Theme",
          textScaleFactor: 1,
          style: Get.theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 32),
        ListTile(
          leading: const Icon(
            Icons.brightness_5,
            color: Colors.blue,
          ),
          title: Text("Light",
              textScaleFactor: 1, style: Get.theme.textTheme.titleMedium),
          onTap: () {
            _themesController.setTheme('light');
            Get.back();
          },
          trailing: Icon(
            Icons.check,
            color: current == 'light' ? Colors.blue : Colors.transparent,
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.brightness_2,
            color: Colors.orange,
          ),
          title: Text("Dark",
              textScaleFactor: 1, style: Get.theme.textTheme.titleMedium),
          onTap: () {
            _themesController.setTheme('dark');
            Get.back();
          },
          trailing: Icon(
            Icons.check,
            color: current == 'dark' ? Colors.orange : Colors.transparent,
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            Icons.brightness_6,
            color: Colors.blueGrey,
          ),
          title: Text("System",
              textScaleFactor: 1, style: Get.theme.textTheme.titleMedium),
          onTap: () {
            _themesController.setTheme('system');
            Get.back();
          },
          trailing: Icon(
            Icons.check,
            color: current == 'system' ? Colors.blueGrey : Colors.transparent,
          ),
        ),
      ],
    ),
  ));
}

//////////////////////////////////////////////////
showLangButtomsheet() {
  return Get.bottomSheet(Container(
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
    height: 210.h,
    decoration: BoxDecoration(
        color: Get.theme.scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " Select a Language ",
          style: Get.theme.textTheme.titleLarge,
        ),
        const SizedBox(height: 32),
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.language,
            color: Colors.blue,
          ),
          title: Text("العربية", style: Get.theme.textTheme.titleMedium),
          onTap: () {
            Get.updateLocale(AppStrings.arabic);
            GetStorage().write('lang', 'ar');
            GetStorage().save();
            Get.back();
          },
          trailing: Icon(
            Icons.check,
            color: Get.locale == AppStrings.arabic
                ? Colors.blue
                : Colors.transparent,
          ),
        ),
        const SizedBox(height: 16),
        ListTile(
          leading: const Icon(
            FontAwesomeIcons.language,
            color: Colors.orange,
          ),
          title: Text("English", style: Get.theme.textTheme.titleMedium),
          onTap: () {
            Get.updateLocale(AppStrings.english);
            GetStorage().write('lang', 'en');
            GetStorage().save();
            Get.back();
          },
          trailing: Icon(
            Icons.check,
            color: Get.locale == AppStrings.english
                ? Colors.orange
                : Colors.transparent,
          ),
        ),
      ],
    ),
  ));
}

//////////////////////////////////////////////////
showSuccessModelSheet() {
  return Get.bottomSheet(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        height: 200.h,
        decoration: BoxDecoration(
            color: Get.theme.scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AssetsManager.orderSuccess,
                height: 120.h, width: 350.w),
            SizedBox(height: 10.h),
            Text("Order Confirmed", style: Get.theme.textTheme.headlineSmall),
          ],
        ),
      ),
      isDismissible: false);
}
