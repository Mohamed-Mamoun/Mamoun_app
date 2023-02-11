import 'package:advance_course/Presentation/login/login.dart';
import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:advance_course/Presentation/resources/values_manager.dart';
import 'package:advance_course/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          elevation: Appsize.s0,
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
          height: Appsize.s120,
          alignment: const Alignment(0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                child: Text(AppStrings.skip.tr,
                    textAlign: TextAlign.end,
                    style: StylesManager().getMediumStyle(
                      color: ColorManager.primary,
                      fontSize: Appsize.s20,
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
                          textAlign: TextAlign.end,
                          style: StylesManager().getMediumStyle(
                            color: ColorManager.primary,
                            fontSize: Appsize.s20,
                          )),
                      onPressed: () {
                        Get.to(() => const LoginView(),
                            transition: Transition.cupertino);
                      },
                    )
                  : TextButton(
                      child: Text(AppStrings.next.tr,
                          textAlign: TextAlign.end,
                          style: StylesManager().getMediumStyle(
                            color: ColorManager.primary,
                            fontSize: Appsize.s20,
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
        const SizedBox(
          height: Appsize.s40,
        ),
        SizedBox(
          height: Appsize.s290,
          width: Appsize.s290,
          child: Lottie.asset(sider!.img.toString()),
        ),
        const SizedBox(
          height: Appsize.s60,
        ),
        Text(
          sider!.title.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: Appsize.s20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Appsize.s20),
          child: Text(
            sider!.subTitle.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
