import 'package:advance_course/Presentation/Home/view_model.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/widgets/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isDarkThme = false;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: const CustomizBackButton(),
          leadingWidth: 100.w,
          automaticallyImplyLeading: false,
          centerTitle: true,
          titleTextStyle: StylesManager().getMediumStyle(fontSize: 18.sp),
          title: Text(
            AppStrings.settings.tr,
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10.h),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.language,
                size: 31,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                AppStrings.lan.tr,
                textScaleFactor: 1,
                style: StylesManager().getMediumStyle(fontSize: 18.sp),
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: Theme.of(context).dividerColor,
            ),
            ListTile(
              title: Text('              English',
                  textScaleFactor: 1,
                  style: StylesManager().getMediumStyle(fontSize: 20)),
              trailing: Get.locale == AppStrings.english
                  ? Icon(
                      Icons.check,
                      color: ColorManager.primary,
                    )
                  : null,
              onTap: () {
                Get.updateLocale(AppStrings.english);
                GetStorage().write('lang', 'en');
                GetStorage().save();
              },
            ),
            ListTile(
              title: Text('              العربية',
                  textScaleFactor: 1,
                  style: StylesManager().getMediumStyle(fontSize: 20)),
              trailing: Get.locale == AppStrings.arabic
                  ? Icon(
                      Icons.check,
                      color: ColorManager.primary,
                    )
                  : null,
              onTap: () {
                Get.updateLocale(AppStrings.arabic);
                GetStorage().write('lang', 'ar');
                GetStorage().save();
              },
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(vertical: 2.h),
              color: Theme.of(context).dividerColor,
            ),
            ListTile(
              leading: Icon(
                Icons.dark_mode,
                size: 31,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                AppStrings.darkMode.tr,
                textScaleFactor: 1,
                style: StylesManager().getMediumStyle(fontSize: 15.sp),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.dark_mode,
                ),
                onPressed: () {},
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
              leading: Icon(
                Icons.exit_to_app,
                size: 32,
                color: ColorManager.primary,
              ),
              title: Text(
                AppStrings.signOut.tr,
                textScaleFactor: 1,
                style: StylesManager().getMediumStyle(fontSize: 18.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
