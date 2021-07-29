import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class profileViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCurrentUser();
  }

  UserModel get userModel => _userModel;
  UserModel _userModel;

  void getCurrentUser() async {
    loading.value= true;
    await localStorageData.getUser.then((value) {
      _userModel = value;
    });
    loading.value=false;
    update();
  }



  Future<void> signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localStorageData.deleteUser();
  }
}
