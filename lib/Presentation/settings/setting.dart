import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            title: Text('English',
                style: StylesManager().getMediumStyle(
                    color: ColorManager.darkGrey, fontSize: 20)),
            onTap: () {
              Get.updateLocale(AppStrings.english);
              GetStorage().write('lang', 'en');
              GetStorage().save();
              print(GetStorage().read('lang'));
            },
          ),
          ListTile(
            title: Text('العربية',
                style: StylesManager().getMediumStyle(
                    color: ColorManager.darkGrey, fontSize: 20)),
            onTap: () {
              Get.updateLocale(AppStrings.arabic);
              GetStorage().write('lang', 'ar');
              GetStorage().save();
              print(GetStorage().read('lang'));
            },
          ),
        ],
      ),
    );
  }
}
