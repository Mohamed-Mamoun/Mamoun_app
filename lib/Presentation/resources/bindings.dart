import 'package:advance_course/Presentation/Home/view_model.dart';
import 'package:advance_course/Presentation/cart/view_model.dart';
import 'package:advance_course/Presentation/login/view_mode.dart';
import 'package:advance_course/Presentation/order/view_model.dart';
import 'package:advance_course/Presentation/resources/theme_manager.dart';
import 'package:get/get.dart';

import '../Search/view_model.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => SearchViewModel());
    Get.lazyPut(() => OrderViewMode());
    Get.lazyPut(() => ThemesController());
  }
}
