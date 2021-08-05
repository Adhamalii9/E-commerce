import 'dart:async';

import 'package:e_commerce/control_view.dart';
import 'package:e_commerce/core/services/firestore_user.dart';
import 'package:e_commerce/helper/local_storage_data.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:get/get_rx/get_rx.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name;
  Rxn<User> _user = Rxn<User>();


  String get user => _user.value?.email;

  final LocalStorageData localStorageData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
    if (_auth.currentUser != null) {
      getCurrentUserData(_auth.currentUser.uid);
    }
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await (_googleSignIn.signIn() as FutureOr<GoogleSignInAccount>);
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    await _auth.signInWithCredential(credential).then((user) async {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }

  void FacebookSignInMethod() async {
    FacebookLoginResult result = await _facebookLogin.logIn(customPermissions:['email']);

    final accessToken = result.accessToken.token;

    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);

      await _auth.signInWithCredential(faceCredential).then((user) async {
        saveUser(user);
        Get.offAll(ControlView());
      });
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        getCurrentUserData(value.user.uid);
      });
      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Error login account', "THE E-MAIL/PASSWORD IS INCORRECT",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void createAccountWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });

      Get.offAll(ControlView());
    } catch (e) {
      print(e);
      Get.snackbar('Error login account', "THE E-MAIL/PASSWORD IS INCORRECT",
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    UserModel userModel = UserModel(user.user.uid, user.user.email,
        name == null ? user.user.displayName : name, '');
    await FirestoreUser().addUserToFirestore(userModel);
    setUser(userModel);
  }

  void setUser(UserModel userModel) async {
    await localStorageData.setUser(userModel);
  }

  void getCurrentUserData(String uid) async {
    await FirestoreUser().getCurrentUser(uid).then((value) {
      setUser(UserModel.fromJson(value.data() as Map<dynamic, dynamic>));
    });
  }
}
