import 'package:e_commerce/Constance.dart';
import 'package:e_commerce/helper/enum.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DeliveryTime extends StatefulWidget {
  @override
  _DeliveryTimeState createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {

  Delivery delivery = Delivery.StandardDelivery;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  RadioListTile<Delivery>(
                    value: Delivery.StandardDelivery,
                    groupValue: delivery,
                    onChanged: (Delivery value) {
                      setState((){
                        delivery = value;
                      });
                    },
                    title: CustomText(
                      text: 'Standard Delivery',
                      size: 22
                      ,
                    ),
                    subtitle: CustomText(
                      text: '\nOrder will be delivered between 3 - 5 business days',
                      maxLines: 3,
                      size: 16,
                    ),
                    activeColor: primaryColor1,
                  ),
                  SizedBox(height: 50),
                  RadioListTile<Delivery>(
                    value: Delivery.NextDatDelivery,
                    groupValue: delivery,
                    onChanged: (Delivery value) {
                      setState((){
                        delivery = value;
                      });
                    },
                    title: CustomText(
                      text: 'Next Day Delivery',
                      size: 22
                      ,
                    ),
                    subtitle: CustomText(
                      maxLines: 3,
                      text: '\nPlace your order before 6pm and your items will be delivered the next day',
                      size: 16,
                    ),
                    activeColor: primaryColor1,
                  ),
                  SizedBox(height: 50),
                  RadioListTile<Delivery>(
                    value: Delivery.NominatedDelivery,
                    groupValue: delivery,
                    onChanged: (Delivery value) {
                      setState((){
                        delivery = value;
                      });
                    },
                    title: CustomText(
                      text: 'Nominated Delivery',
                      size: 22
                      ,
                    ),
                    subtitle: CustomText(
                      maxLines: 3,
                      text: '\nPick a Particular date from the calender and order will be delivered on selected day',
                      size: 16,
                    ),
                    activeColor: primaryColor1,
                  ),

                ],
              )),
        ],
      ),
    );;
  }
}


