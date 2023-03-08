import 'package:advance_course/Presentation/Search/view_model.dart';
import 'package:advance_course/Presentation/resources/color_manager.dart';
import 'package:advance_course/Presentation/resources/styles_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SearchViewModel(),
      builder: (controller) => Scaffold(
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
            onChanged: (value) {
              controller.changeValue(value);
            },
          ),
        ),
        body: StreamBuilder(
            stream: controller.searchKey == null || controller.searchKey == ''
                ? controller.products
                : controller.collRef
                    .where('searchIndex', arrayContains: controller.searchKey)
                    .snapshots(),
            builder: (context, snapshot) {
              ////////////////////////////////////////////////
              if (snapshot.hasError) {
                return Center(
                    child: Text(
                  'Something went wrong',
                  style: StylesManager().getMediumStyle(fontSize: 15.sp),
                ));
              }

              if (!snapshot.hasData) {
                return Center(
                    child: Text(
                  'Something went wrong',
                  style: StylesManager().getMediumStyle(fontSize: 15.sp),
                ));
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.connectionState == ConnectionState.none) {
                return Center(
                    child: Text(
                  'Something went wrong',
                  style: StylesManager().getMediumStyle(fontSize: 15.sp),
                ));
              }
              ///////////////////////////////////////////////////////////
              var data = snapshot.requireData;
              return ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: Theme.of(context).primaryColorDark),
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(12)),
                      margin: const EdgeInsets.all(15),
                      height: 130.h,
                      width: 100.w,
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: data.docs[index]['image'],
                            height: 70.h,
                            width: 70.w,
                            progressIndicatorBuilder:
                                (context, child, loadingProgress) {
                              if (loadingProgress == null) {}
                              return Center(
                                child: CircularProgressIndicator(
                                  color: ColorManager.primary,
                                ),
                              );
                            },
                            errorWidget: (context, string, dynamic) {
                              return const Icon(
                                Icons.broken_image,
                                size: 35,
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  });
            }),
      ),
    );
  }
}
