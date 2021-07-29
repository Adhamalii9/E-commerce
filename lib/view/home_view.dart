import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce/Constance.dart';
import 'package:e_commerce/view/cart_view.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'profile_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 70, left: 10, right: 20),
              child: Column(
                children: [
                  _SearchTextFormfield(),
                  SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    text: "Categories",
                    size: 23,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _listViewCategoires(controller),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: "Best Selling",
                        size: 22,
                      ),
                      CustomText(
                        text: "See all",
                        size: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _listViewProducts(controller),
                ],
              ),
            ),
          )),
    );
  }
}


  Widget _listViewCategoires(controller) {
    return Container(
      height: 150,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 20);
        },
        itemCount: controller.categoryModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(20)),
                    child: Image.network(
                      controller.categoryModel[index].image,
                      height: 80,
                    )),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.categoryModel[index].name,
                  size: 17,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _listViewProducts(HomeViewModel controller) {
    return Container(
      height: 350,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 20);
        },
        itemCount: controller.productModel.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
                    Get.to(DetailsView(model: controller.productModel[index],));
                  },
                  child: Container(
                      height: 220,
                      width: MediaQuery.of(context).size.width / 2 - 25,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(20)),
                      child: Image.network(
                        controller.productModel[index].image,
                        height: 80,
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: controller.productModel[index].name,
                  size: 20,
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 30,
                        child: CustomText(
                          text: controller.productModel[index].description,
                          color: Colors.grey.shade600,
                          maxLines: 1,
                        ),
                      ),
                      CustomText(
                        text: "...",
                        color: Colors.grey.shade600,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                CustomText(
                  text: controller.productModel[index].price,
                  color: primaryColor1,
                  size: 20,
                ),
              ],
            ),
          );
        },
      ),
    );
  }




Widget _SearchTextFormfield() {
  return Container(
    decoration: BoxDecoration(
        color: Colors.grey.shade200, borderRadius: BorderRadius.circular(20)),
    child: TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          )),
    ),
  );
}
