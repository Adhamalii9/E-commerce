import 'package:e_commerce/Constance.dart';
import 'package:e_commerce/control_view.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/helper/extension.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      model.image,
                      fit: BoxFit.contain,
                    ),
                    height: 270,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 60, left: 15),
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade500),
                      child: GestureDetector(
                          onTap: () {
                            Get.off(ControlView());
                          },
                          child: Icon(
                            Icons.arrow_back_ios_outlined,
                            color: Colors.white,
                            size: 25,
                          )),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    child: Column(
                      children: [
                        CustomText(
                          text: model.name,
                          size: 25,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Container(
                              width: 170,
                              height: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Size",
                                      size: 17,
                                      alignment: Alignment.center,
                                    ),
                                    CustomText(
                                      text: model.sized,
                                      size: 17,
                                      alignment: Alignment.center,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            Container(
                              width: 170,
                              height: 40,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      text: "Color",
                                      size: 17,
                                      alignment: Alignment.center,
                                    ),
                                    Container(
                                      width: 40,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          color: model.color),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        CustomText(
                          text: "Details",
                          size: 20,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(model.description,
                            overflow: TextOverflow.fade,
                            style: TextStyle(fontSize: 17, height: 2)),

                      ],
                    ),
                  ),
                  SizedBox(height: 70,),
                  Container(
                    height: 100,
                    padding: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: "PRICE",
                              color: Colors.grey.shade500,
                              size: 17,
                            ),
                            CustomText(
                              text: model.price,
                              color: primaryColor1,
                              size: 22,
                            )
                          ],
                        ),
                        GetBuilder<CartViewModel>(
                          init: Get.find(),
                          builder: (controller) => Container(
                              width: 170,
                              child: FlatButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  color: primaryColor1,
                                  onPressed: () {
                                    controller.addProduct(CartProductModel(model.name, model.image, model.price, 1, model.productId));
                                  },
                                  child: CustomText(
                                    text: "ADD",
                                    size: 18,
                                    color: Colors.white,
                                    alignment: Alignment.center,
                                  ))),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
