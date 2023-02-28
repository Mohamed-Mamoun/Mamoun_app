import 'package:advance_course/Presentation/Home/home_view.dart';
import 'package:advance_course/Presentation/Home/view_model.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TabBar(
                labelColor:
                    Get.isDarkMode ? ColorManager.white : ColorManager.black,
                unselectedLabelStyle:
                    StylesManager().getMediumStyle(fontSize: 16.sp),
                labelStyle: StylesManager().getMediumStyle(fontSize: 16.sp),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: ColorManager.primary.withOpacity(0.9)),
                isScrollable: true,
                // indicatorColor: ColorManager.primary,
                indicatorWeight: 3,
                tabs: [
                  Tab(
                    height: 35.h,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Text(
                        AppStrings.home.tr,
                        textScaleFactor: 1,
                      ),
                    ),
                  ),
                  Tab(
                    height: 35.h,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        AppStrings.cosmatics.tr,
                        textScaleFactor: 1,
                      ),
                    ),
                  ),
                ]),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              height: 550.h,
              child: TabBarView(
                children: [const MainWidget(), Container()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final CNTL = Get.find<HomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '  ${AppStrings.popular.tr}',
              textScaleFactor: 1,
              style: StylesManager().getSemiBoldStyle(fontSize: 24.sp),
            ),
            Text(
              '  ${AppStrings.seeAll.tr} ',
              textScaleFactor: 1,
              style: StylesManager().getSemiBoldStyle(
                  color: ColorManager.lightGrey, fontSize: 15.sp),
            ),
          ],
        ),
        const BestProduct(),
        Text(
          '  ${AppStrings.recentProduct.tr}',
          textScaleFactor: 1,
          style: StylesManager().getReqularStyle(fontSize: 24.sp),
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 190.h,
          child: ListView.builder(
            itemCount: CNTL.productsModel.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10.w, left: 10.w, bottom: 15.h),
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
                height: 140.h,
                width: 180.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          CNTL.productsModel[index].productImage.toString(),
                          height: 100.h,
                          width: 100.w,
                        ),
                        SizedBox(width: 15.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              CNTL.productsModel[index].productName.toString(),
                              textScaleFactor: 1,
                              style: StylesManager()
                                  .getSemiBoldStyle(fontSize: 15.sp),
                            ),
                            Text(
                              'Price:  ${CNTL.productsModel[index].productPrice}  SDG',
                              textScaleFactor: 1,
                              style: StylesManager()
                                  .getSemiBoldStyle(fontSize: 16.sp),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
