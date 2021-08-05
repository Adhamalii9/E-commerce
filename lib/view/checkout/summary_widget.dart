import 'package:e_commerce/Constance.dart';
import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GetBuilder<CartViewModel>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 280,
                padding: EdgeInsets.all(20),
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 15,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(20)),
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            width: 150,
                            height: 180,
                            child: Image.network(
                              controller.cartProductModel[index].image,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          CustomText(
                            alignment: Alignment.center,
                            text: controller.cartProductModel[index].name,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CustomText(
                            alignment: Alignment.center,
                            color: primaryColor1,
                            text:
                                " \$ ${controller.cartProductModel[index].price}",
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: controller.cartProductModel.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: CustomText(
                  text: "Shipping Address",
                  size: 22,
                ),
              ),
              SizedBox(height: 5,),
              GetBuilder<CheckOutViewModel>(
                  builder: (controller) => Padding(
                    padding: const EdgeInsets.only(left:10.0),
                    child: CustomText(
                      maxLines: 3,
                      size: 20,
                          color: Colors.grey,
                          text: "${controller.street1+", "+controller.street2+", "+controller.state+", "+controller.city+", "+controller.country}",
                        ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
