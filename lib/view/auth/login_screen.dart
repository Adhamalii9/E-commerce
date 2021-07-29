import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/Constance.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:get/get.dart';




class LoginScreen extends GetWidget<AuthViewModel>{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: "Welcome,",
                          color: Colors.black,
                          size: 25,
                          //fontWeight: FontWeight.w700,
                          font: 'SourceSans',
                        ),
                        GestureDetector(
                          onTap: (){
                            Get.off(RegisterScreen());
                          },
                          child: CustomText(
                            text: "Sign Up",
                            color: primaryColor1,
                            size: 20,

                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: "Sign in to Continue",
                      size: 15,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    CustomText(
                      text: "E-mail",
                      size: 14,
                      color: Colors.grey[600],
                    ),
                    TextFormField(
                      onSaved: (value){
                        controller.email=value;
                      },
                      validator: (value){
                        if(value==null){
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
                        controller.password=value;
                      },
                      validator: (value) {
                        if(value==null){
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
                    CustomText(
                      alignment: Alignment.topRight,
                      text: "Forgot Password?",
                      size: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                        ),
                        onPressed: () {
                          _formkey.currentState.save();

                          if(_formkey.currentState.validate()){
                            controller.signInWithEmailAndPassword();

                          }
                        },
                        child: CustomText(text: "LOG IN",
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        size: 22,
                        alignment: Alignment.center,),
                        color: primaryColor1,
                      ),
                    ),
                    SizedBox(height: 35,),
                    Container(
                      child: CustomText(
                        text: "- OR -",
                        size: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        alignment: Alignment.center,
                    )
                    ),
                    SizedBox(height: 35,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        onPressed: () {
                          controller.googleSignInMethod();

                        },
                        child: Row(
                          children: [
                            Image.asset("assets/images/google.png",height: 30,),
                            SizedBox(width: 80,),
                            CustomText(
                              text: "Log In with Google",
                              color: Colors.black,
                              alignment: Alignment.center,
                              size: 19,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                        color: Colors.grey.shade100,
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)
                        ),
                        onPressed: () {
                          controller.FacebookSignInMethod();

                        },
                        child: Row(
                          children: [
                            Image.asset("assets/images/facebook.png",height: 30,),
                            SizedBox(width: 80,),
                            CustomText(
                              text: "Log In with Facebook",
                              color: Colors.black,
                              alignment: Alignment.center,
                              size: 19,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        ),
                        color: Colors.grey.shade100,
                      ),
                    ),

                  ],
                ),
              )),
        ));
  }
}
