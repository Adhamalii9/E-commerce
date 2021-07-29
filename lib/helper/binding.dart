import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:get/get.dart';


class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => LocalStorageData());
    Get.lazyPut(() => profileViewModel());
  }
}