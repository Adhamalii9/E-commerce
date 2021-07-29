import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constance.dart';

class RegisterScreen extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: (){
              Get.off(LoginScreen());
            },
              child: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.black,
          )),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    CustomText(
                      text: "Sign Up",
                      size: 35,
                      color: Colors.black,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomText(
                      text: "Name",
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    TextFormField(
                      onSaved: (value) {
                        controller.name = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("ERROR");
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Zoe",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    CustomText(
                      text: "E-mail",
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    TextFormField(
                      onSaved: (value) {
                        controller.email = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("ERROR");
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "iamzoe@gmail.com",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    CustomText(
                      text: "Password",
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    TextFormField(
                      obscureText: true,
                      onSaved: (value) {
                        controller.password = value;
                      },
                      validator: (value) {
                        if (value == null) {
                          print("ERROR");
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "*********",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        onPressed: () {
                          _formkey.currentState.save();
                          if(_formkey.currentState.validate()){
                            controller.createAccountWithEmailAndPassword();
                          }
                        },
                        child: CustomText(
                          text: "SIGN UP",
                          color: Colors.white,
                          size: 20,
                          alignment: Alignment.center,
                        ),
                        color: primaryColor1,
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
