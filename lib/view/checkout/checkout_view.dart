import 'package:e_commerce/core/view_model/checkout_view_model.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/checkout/summary_widget.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:status_change/status_change.dart';

import '../../Constance.dart';
import 'add_address_widget.dart';
import 'delivery_time_widget.dart';

class CheckOutView extends StatefulWidget {
  @override
  _CheckOutViewState createState() => _CheckOutViewState();
}

class _CheckOutViewState extends State<CheckOutView> {
  int _processIndex = 0;
  Pages pages = Pages.DeliveryTime;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) =>
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: Text(
                  "CheckOut",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    height: 100,
                    child: StatusChange.tileBuilder(
                      theme: StatusChangeThemeData(
                        direction: Axis.horizontal,
                        connectorTheme:
                        ConnectorThemeData(space: 1.0, thickness: 1.0),
                      ),
                      builder: StatusChangeTileBuilder.connected(
                        itemWidth: (_) =>
                        MediaQuery
                            .of(context)
                            .size
                            .width / _processes.length,
                        nameWidgetBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: Text(
                              _processes[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: controller.getColor(index),
                              ),
                            ),
                          );
                        },
                        indicatorWidgetBuilder: (_, index) {
                          if (index <= controller.index) {
                            return DotIndicator(
                              size: 35.0,
                              border: Border.all(color: primaryColor1, width: 1),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: primaryColor1,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return OutlinedDotIndicator(
                              size: 30,
                              borderWidth: 1.0,
                              color: todoColor,
                            );
                          }
                        },
                        lineWidgetBuilder: (index) {
                          if (index > 0) {
                            if (index == controller.index) {
                              final prevColor = controller.getColor(index - 1);
                              final color = controller.getColor(index);
                              var gradientColors;
                              gradientColors = [
                                prevColor,
                                Color.lerp(prevColor, color, 0.5)
                              ];
                              return DecoratedLineConnector(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                  ),
                                ),
                              );
                            } else {
                              return SolidLineConnector(
                                color: controller.getColor(index),
                              );
                            }
                          } else {
                            return null;
                          }
                        },
                        itemCount: _processes.length,
                      ),
                    ),
                  ),
                  controller.pages == Pages.DeliveryTime
                      ? DeliveryTime()
                      : controller.pages == Pages.AddAddress
                      ? AddAddress()
                      : Summary(),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        controller.index == 0 ? Container() : Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(

                            width: 150,
                            child: FlatButton(onPressed: () {
                              controller.changeIndex(controller.index-1);
                            }, child: CustomText(
                              alignment: Alignment.center,
                              text: 'Back',
                              size: 23,
                              color: primaryColor1,
                            ),
                              color: Colors.white,
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),

                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(

                            width: 150,
                            child: FlatButton(onPressed: () {
                              controller.changeIndex(controller.index + 1);
                            }, child: CustomText(
                              alignment: Alignment.center,
                              text: 'Next',
                              size: 23,
                              color: Colors.white,
                            ),
                              color: primaryColor1,
                              height: 50,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),

                          ),
                        ),

                      ],
                    ),
                  )

                ],

              ),

            ),

    );
  }
}

final _processes = [
  'Delivery',
  'Address',
  'Summary',
];
