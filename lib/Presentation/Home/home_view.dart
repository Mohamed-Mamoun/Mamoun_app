import 'package:advance_course/Presentation/cart/cart.dart';
import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/settings/setting.dart';
import 'package:advance_course/Presentation/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.only(top: 30.0.h, bottom: 15.0.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.to(() => const SettingsView(),
                        transition: Get.locale == AppStrings.arabic
                            ? Transition.rightToLeft
                            : Transition.leftToRight);
                  },
                  icon: const Icon(
                    Icons.settings,
                    size: 31,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    AssetsManager.searchIcon,
                    height: 27.w,
                    width: 27.w,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CartView(),
                        transition: Get.locale == AppStrings.arabic
                            ? Transition.leftToRight
                            : Transition.rightToLeft);
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: Image.asset(
                      AssetsManager.cartIcon,
                      height: 30.w,
                      width: 30.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const TabBarWidget(),
        ]),
      ),
    );
  }
}

/////////
class BestProduct extends StatelessWidget {
  const BestProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 250.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
                color: ColorManager.lightGrey,
                borderRadius: BorderRadius.circular(10)),
            width: 180.w,
          );
        },
      ),
    );
  }
}
