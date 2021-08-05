import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
      builder: (contoller) => Form(
        key: contoller.formState,
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text:
                            "Billing address is the same on as delivery address",
                        size: 18,
                        alignment: Alignment.center,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CustomText(
                        text: 'Street 1',
                        alignment: Alignment.topLeft,
                        size: 16,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          contoller.street1 = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "You must right your Street";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "21, Alex Daidson Avenue",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CustomText(
                        text: 'Street 2',
                        alignment: Alignment.topLeft,
                        size: 16,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          contoller.street2 = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "You must right your Street";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Opposite Omegatron , Vicent Quarters ",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CustomText(
                        text: 'City',
                        alignment: Alignment.topLeft,
                        size: 16,
                      ),
                      TextFormField(
                        onSaved: (value) {
                          contoller.city = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "You must right your City";
                          }
                        },
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            hintText: "Victoria Island",
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'State',
                                alignment: Alignment.topLeft,
                                size: 16,
                              ),
                              Container(
                                width: 130,
                                child: TextFormField(
                                  onSaved: (value) {
                                    contoller.state = value;
                                  },
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "You must right your State";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "Lagos State",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 75),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Country',
                                alignment: Alignment.topLeft,
                                size: 16,
                              ),
                              Container(
                                width: 130,
                                child: TextFormField(
                                  onSaved: (value) {
                                    contoller.country = value;
                                  },
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return "You must right your Country";
                                    }
                                  },
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      hintText: "Nigeria",
                                      hintStyle: TextStyle(color: Colors.grey)),
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
