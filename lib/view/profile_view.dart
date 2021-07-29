import 'package:e_commerce/core/view_model/profile_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<profileViewModel>(
      init: profileViewModel(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: controller.userModel == null
                                              ? AssetImage(
                                                  'assets/images/google.png')
                                              : controller.userModel.pic ==
                                                      'default'
                                                  ? AssetImage(
                                                      'assets/images/google.png')
                                                  : NetworkImage(controller
                                                      .userModel.pic)))),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller.userModel.name,
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: controller.userModel.email,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Container(
                          child: ListTile(
                            title: CustomText(
                              text: "Edit Profile",
                              color: Colors.black,
                              size: 18,
                            ),
                            leading: Icon(
                              Icons.edit,
                              color: Colors.black,
                              size: 22,
                            ),
                            trailing: Icon(Icons.navigate_next,color: Colors.black,size: 22,),
                          ),
                        ),SizedBox(height: 17,),
                        Container(
                          child: ListTile(
                            title: CustomText(
                              text: "Shipping Address",
                              color: Colors.black,
                              size: 18,
                            ),
                            leading: Icon(
                              Icons.location_on,
                              color: Colors.black,
                              size: 22,
                            ),
                            trailing: Icon(Icons.navigate_next,color: Colors.black,size: 22,),
                          ),
                        ),SizedBox(height: 17,),
                        Container(
                          child: ListTile(
                            title: CustomText(
                              text: "Order History",
                              color: Colors.black,
                              size: 18,
                            ),
                            leading: Icon(
                              Icons.history_rounded,
                              color: Colors.black,
                              size: 22,
                            ),
                            trailing: Icon(Icons.navigate_next,color: Colors.black,size: 22,),
                          ),
                        ),SizedBox(height: 17,),
                        Container(
                          child: ListTile(
                            title: CustomText(
                              text: "Cards",
                              color: Colors.black,
                              size: 18,
                            ),
                            leading: Icon(
                              Icons.credit_card,
                              color: Colors.black,
                              size: 22,
                            ),
                            trailing: Icon(Icons.navigate_next,color: Colors.black,size: 22,),
                          ),
                        ),SizedBox(height: 17,),
                        Container(
                          child: ListTile(
                            title: CustomText(
                              text: "Notification",
                              color: Colors.black,
                              size: 18,
                            ),
                            leading: Icon(
                              Icons.notifications,
                              color: Colors.black,
                              size: 22,
                            ),
                            trailing: Icon(Icons.navigate_next,color: Colors.black,size: 22,),
                          ),
                        ),SizedBox(height: 17,),
                        Container(
                          child: ListTile(
                            title: CustomText(
                              text: "Log Out",
                              color: Colors.black,
                              size: 18,
                            ),
                            leading: Icon(
                              Icons.logout,
                              color: Colors.black,
                              size: 22,
                            ),
                            trailing: Icon(Icons.navigate_next,color: Colors.black,size: 22,),
                            onTap: (){
                              controller.signOut();
                              Get.off(LoginScreen());
                            },
                          ),
                        ),SizedBox(height: 17,),

                      ],
                    ),
                  )),
            ),
    );
  }
}
