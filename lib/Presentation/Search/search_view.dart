import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Theme.of(context).primaryColorDark,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back)),
        elevation: 2,
        shadowColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextFormField(
          autofocus: true,
          decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              isDense: true,
              hintText: 'Search...',
              hintStyle: StylesManager().getMediumStyle(fontSize: 14.sp),
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none),
          onChanged: (value) {},
        ),
      ),
    );
  }
}
