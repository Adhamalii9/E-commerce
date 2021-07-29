import 'dart:convert';

import 'package:e_commerce/Constance.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageData extends GetxController{



  Future<UserModel> get getUser async{
    try{
      UserModel userModel = await _getUserData();
      if(userModel == null){
        return null;
      }
      return userModel;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  _getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var value = prefs.getString('Users');
    return UserModel.fromJson(json.decode(value));
  }

  setUser(UserModel userModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('Users', json.encode(userModel.toJson()));
   }

   void deleteUser() async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     await prefs.clear();
   }
}