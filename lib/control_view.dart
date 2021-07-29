import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce/view/cart_view.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/profile_view.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/view_model/home_view_model.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<HomeViewModel>(
              init: HomeViewModel(),
              builder: (controller) => Scaffold(
                  bottomNavigationBar: bottomNavigationBar(),
                  body: controller.currentScreen),
            );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavyBar(
        items: [
          BottomNavyBarItem(
              activeColor: Colors.black,
              icon: Icon(Icons.home),
              title: CustomText(
                text: "EXPLORE",
                size: 15,
                alignment: Alignment.center,
              )),
          BottomNavyBarItem(
              activeColor: Colors.black,
              icon: Icon(Icons.shopping_cart),
              title: CustomText(
                text: "CART",
                size: 15,
                alignment: Alignment.center,
              )),
          BottomNavyBarItem(
              activeColor: Colors.black,
              icon: Icon(Icons.person),
              title: CustomText(
                text: "PROFILE",
                size: 15,
                alignment: Alignment.center,
              )),
        ],
        selectedIndex: controller.navigatorValue,
        showElevation: false,
        animationDuration: Duration(milliseconds: 300),
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }
}
