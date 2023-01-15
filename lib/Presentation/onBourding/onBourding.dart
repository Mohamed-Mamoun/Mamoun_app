import 'package:advance_course/Presentation/resources/assets_manager.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/strings_manager.dart';
import 'package:advance_course/Presentation/resources/theme_manager.dart';
import 'package:advance_course/Presentation/resources/values_manager.dart';
import 'package:advance_course/domain/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBourdingView extends StatefulWidget {
  const OnBourdingView({super.key});

  @override
  State<OnBourdingView> createState() => _OnBourdingViewState();
}

class _OnBourdingViewState extends State<OnBourdingView> {
  final List<SiderClass> _list = getSlids();
  final PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

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
        SiderClass(
            title: AppStrings.onBourdingTitle4,
            subTitle: AppStrings.onBourdingSubTitle4,
            img: AssetsManager.onBourdingLogo4),
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
        itemCount: _list.length,
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        itemBuilder: (context, index) {
          return OnBourdingPage(
            sider: _list[index],
          );
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class OnBourdingPage extends StatelessWidget {
  SiderClass? sider = SiderClass();
  OnBourdingPage({super.key, this.sider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: Appsize.s40,
        ),
        Text(
          sider!.title.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }
}
