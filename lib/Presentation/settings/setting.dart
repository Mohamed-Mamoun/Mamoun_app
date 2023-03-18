import 'package:advance_course/Presentation/Home/view_model.dart';
import 'package:advance_course/Presentation/resources/font_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/resources/theme_manager.dart';
import 'package:advance_course/Presentation/widgets/back_button.dart';
import 'package:advance_course/Presentation/widgets/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final ThemesController themesController = Get.find();
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: const CustomizBackButton(),
          leadingWidth: 100.w,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            AppStrings.settings.tr,
            style: Get.theme.textTheme.titleLarge,
            textScaleFactor: 1,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            ListTile(
              onTap: () {},
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green.withAlpha(30)),
                child: const Center(
                  child: Icon(
                    FontAwesomeIcons.listCheck,
                    color: Colors.green,
                  ),
                ),
              ),
              title: Text(
                "Your orders",
                textScaleFactor: 1,
                style: StylesManager().getMediumStyle(fontSize: 18.sp),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: Theme.of(context).dividerColor,
            ),
            ListTile(
              onTap: () {
                showLangButtomsheet();
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.orange.withAlpha(30)),
                child: const Center(
                  child: Icon(
                    Icons.language,
                    color: Colors.orange,
                  ),
                ),
              ),
              title: Text(
                AppStrings.lan.tr,
                textScaleFactor: 1,
                style: StylesManager().getMediumStyle(fontSize: 18.sp),
              ),
              trailing: SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        Get.locale == AppStrings.arabic ? "العربية" : "English",
                        style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade600,
                            fontFamily: FontFamilyManager.fontFamily)),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: Theme.of(context).dividerColor,
            ),
            ListTile(
              onTap: () {
                showAppearanceModal(theme, themesController.theme);
              },
              contentPadding: const EdgeInsets.all(8),
              leading: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.purple.withAlpha(30)),
                child: const Center(
                  child: Icon(
                    Icons.dark_mode,
                    color: Colors.purple,
                  ),
                ),
              ),
              title: Text('Appearance',
                  textScaleFactor: 1,
                  style: StylesManager().getMediumStyle(fontSize: 18.sp)),
              trailing: SizedBox(
                width: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(themesController.theme,
                        style: theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.grey.shade600,
                            fontFamily: FontFamilyManager.fontFamily)),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: Theme.of(context).dividerColor,
            ),
            ListTile(
              onTap: () {
                controller.signOut();
              },
              contentPadding: const EdgeInsets.all(10),
              leading: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red.withAlpha(30)),
                child: const Center(
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                ),
              ),
              title: Text(AppStrings.signOut.tr,
                  textScaleFactor: 1,
                  style: StylesManager().getMediumStyle(fontSize: 18.sp)),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
