import 'package:advance_course/Presentation/Home/view_model.dart';
import 'package:advance_course/Presentation/cart/view_model.dart';
import 'package:advance_course/Presentation/login/view_mode.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
  }
}
