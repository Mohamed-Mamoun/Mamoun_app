import 'package:advance_course/Presentation/Home/view_model.dart';
import 'package:advance_course/Presentation/cart/view_model.dart';
import 'package:advance_course/Presentation/login/view_mode.dart';
import 'package:advance_course/Presentation/order/view_model.dart';
import 'package:advance_course/app/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await ScreenUtil.ensureScreenSize();
  await GetStorage.init();
  Get.put(HomeViewModel());
  Get.put(LoginViewModel());
  Get.put(CartViewModel());
  Get.put(OrderViewMode());
  runApp(MyApp());
}
