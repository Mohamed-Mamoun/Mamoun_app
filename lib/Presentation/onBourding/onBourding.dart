import 'package:advance_course/Presentation/login/login.dart';
import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/resources/values_manager.dart';
import 'package:advance_course/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:get_storage/get_storage.dart';

class OnBourdingView extends StatefulWidget {
  const OnBourdingView({super.key});

  @override
  State<OnBourdingView> createState() => _OnBourdingViewState();
}

class _OnBourdingViewState extends State<OnBourdingView> {
  int currentIndex = 0;
  final List<SiderClass> list = getSlids();
  bool onLastPage = false;

  final PageController _pageController = PageController(initialPage: 0);

  static List<SiderClass> getSlids() => [
        SiderClass(
            title: AppStrings.onBourdingTitle1,
            subTitle: AppStrings.onBourdingSubTitle1,
            img: AssetsManager.onBourdingLogo1),
        SiderClass(
            title: AppStrings.onBourdingTitle2,
            subTitle: AppStrings.onBourdingSubTitle2,
            img: AssetsManager.onBourdingLogo2),
        SiderClass(
            title: AppStrings.onBourdingTitle3,
            subTitle: AppStrings.onBourdingSubTitle3,
            img: AssetsManager.onBourdingLogo3),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorManager.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarColor: ColorManager.white,
          ),
        ),
        body: PageView.builder(
          itemCount: list.length,
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              if (value == 2) {
                onLastPage = true;
              } else {
                onLastPage = false;
              }
            });
          },
          itemBuilder: (context, index) {
            return OnBourdingPage(
              sider: list[index],
            );
          },
        ),
        bottomSheet: Container(
          margin: const EdgeInsets.symmetric(horizontal: Appsize.s16),
          height: 120.w,
          alignment: const Alignment(0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Text(AppStrings.skip.tr,
                    textScaleFactor: 1,
                    textAlign: TextAlign.end,
                    style: StylesManager().getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: 20.w,
                    )),
                onPressed: () {
                  setState(() {
                    _pageController.jumpToPage(2);
                  });
                },
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
              ),
              onLastPage
                  ? TextButton(
                      child: Text(AppStrings.done.tr,
                          textScaleFactor: 1,
                          textAlign: TextAlign.end,
                          style: StylesManager().getMediumStyle(
                            color: ColorManager.primary,
                            fontSize: 20.w,
                          )),
                      onPressed: () {
                        GetStorage().write('onBourdingDone', 'completed');
                        Get.to(() => const LoginView(),
                            transition: Transition.cupertino);
                      },
                    )
                  : TextButton(
                      child: Text(AppStrings.next.tr,
                          textScaleFactor: 1,
                          textAlign: TextAlign.end,
                          style: StylesManager().getMediumStyle(
                            color: ColorManager.primary,
                            fontSize: 20.w,
                          )),
                      onPressed: () {
                        _pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn);
                      },
                    )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class OnBourdingPage extends StatelessWidget {
  OnBourdingPage({super.key, this.sider});

  SiderClass? sider = SiderClass();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
        ),
        SizedBox(
          height: 290.h,
          width: 290.w,
          child: Lottie.asset(sider!.img.toString()),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          sider!.title.toString(),
          textScaleFactor: 1,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            sider!.subTitle.toString(),
            textScaleFactor: 1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
