import 'package:e_commerce/control_view.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/checkout/checkout_view.dart';
import 'package:e_commerce/view/register_view.dart';
import "package:flutter/material.dart";
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'core/view_model/cart_view_model.dart';
import 'helper/binding.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Binding().dependencies();
  await Firebase.initializeApp();
  Get.put(CartViewModel());




  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ControlView(),
      ),
      theme: ThemeData(
        fontFamily: 'SourceSans',
      ),
    );
  }
}
