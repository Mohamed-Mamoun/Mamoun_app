import 'package:advance_course/Presentation/Details/details_view.dart';
import 'package:advance_course/Presentation/Home/view_model.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/settings/setting.dart';
import 'package:advance_course/Presentation/widgets/tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                    icon: Icon(
                      Icons.settings,
                      size: 31,
                      color: Get.isDarkMode
                          ? ColorManager.primary
                          : ColorManager.black.withOpacity(0.9),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search_outlined,
                      size: 31,
                      color: Get.isDarkMode
                          ? ColorManager.primary
                          : ColorManager.black.withOpacity(0.9),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.cartShopping,
                      size: 25,
                      color: Get.isDarkMode
                          ? ColorManager.primary
                          : ColorManager.black.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            const TabBarWidget(),
          ]),
        ),
      ),
    );
  }
}

/////////
class BestProduct extends StatelessWidget {
  const BestProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => Container(
        margin: EdgeInsets.only(top: 10.w, bottom: 10.h),
        height: 250.h,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.productsModel.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                    () => DetailsView(model: controller.productsModel[index]));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(1, 1),
                    ),
                  ],
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 180.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ColorManager.white,
                      ),
                      child: Image.asset(
                        controller.productsModel[index].productImage.toString(),
                        height: 150.h,
                      ),
                    ),
                    Text(
                      controller.productsModel[index].productName.toString(),
                      textScaleFactor: 1,
                      style: StylesManager().getSemiBoldStyle(
                          fontSize: 13.sp, color: ColorManager.black),
                    ),
                    Text(
                      'Price:  ${controller.productsModel[index].productPrice}  SDG',
                      textScaleFactor: 1,
                      style: StylesManager().getSemiBoldStyle(fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
