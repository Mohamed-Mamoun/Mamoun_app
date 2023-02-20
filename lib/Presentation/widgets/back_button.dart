import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomizBackButton extends StatelessWidget {
  const CustomizBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: ColorManager.white,
            ),
            Text(
              AppStrings.back.tr,
              textScaleFactor: 1,
              style: StylesManager()
                  .getMediumStyle(color: ColorManager.white, fontSize: 17.sp),
            )
          ],
        ),
      ),
    );
  }
}
