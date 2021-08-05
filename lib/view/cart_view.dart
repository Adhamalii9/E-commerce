import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:e_commerce/Constance.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/checkout/checkout_view.dart';
import 'package:e_commerce/view/profile_view.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get.dart';
import '../core/view_model/home_view_model.dart';
import 'checkout/checkout_view.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      init: Get.find(),
      builder: (controller) => controller.cartProductModel.length == 0
          ? Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_bag_outlined, size: 30,),
              SizedBox(width: 10,),
              CustomText(
                text: "Cart Empty..",
                alignment: Alignment.center,
                color: Colors.black,
                size: 22,
              ),

            ],
          ),
        )
      )
          : Scaffold(
              body: Container(
                  padding: EdgeInsets.only(top: 15, left: 15, right: 15),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15,
                          ),
                          itemCount: controller.cartProductModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 150,
                              child: Row(
                                children: [
                                  Image.network(
                                      controller.cartProductModel[index].image),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text: controller
                                              .cartProductModel[index].name,
                                          size: 22,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        CustomText(
                                          text:
                                              "${controller.cartProductModel[index].price}",
                                          color: primaryColor1,
                                          size: 20,
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade300,
                                          ),
                                          height: 35,
                                          width: 150,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .increaseQuantity(index);
                                                },
                                                child: CustomText(
                                                  text: "+",
                                                  size: 20,
                                                  alignment: Alignment.center,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                              SizedBox(
                                                child: Container(
                                                  color: Colors.black,
                                                ),
                                                width: 1.5,
                                              ),
                                              CustomText(
                                                text: controller
                                                    .cartProductModel[index]
                                                    .quantity
                                                    .toString(),
                                                size: 19,
                                                alignment: Alignment.center,
                                                fontWeight: FontWeight.w300,
                                              ),
                                              SizedBox(
                                                child: Container(
                                                  color: Colors.black,
                                                ),
                                                width: 1.5,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  if (controller
                                                          .cartProductModel[
                                                              index]
                                                          .quantity >
                                                      1)
                                                    controller.decreaseQuantity(
                                                        index);
                                                },
                                                child: CustomText(
                                                  text: "-",
                                                  alignment: Alignment.center,
                                                  size: 25,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CustomText(
                                  text: "Total",
                                  size: 17,
                                  color: Colors.grey.shade600,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                GetBuilder<CartViewModel>(
                                  init: Get.find(),
                                  builder: (controller) => CustomText(
                                    text:
                                        '\$ ${controller.totalPrice.toString()}',
                                    color: primaryColor1,
                                    size: 20,
                                  ),
                                )
                              ],
                            ),
                            FlatButton(
                                height: 50,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: primaryColor1,
                                onPressed: () {
                                  Get.to(CheckOutView());
                                },
                                child: CustomText(
                                  text: "CHECKOUT",
                                  size: 20,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      )
                    ],
                  )),
            ),
    );
  }
}
