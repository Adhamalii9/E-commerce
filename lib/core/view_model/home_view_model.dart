import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:e_commerce/model/product_model.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../view/cart_view.dart';
import '../../view/profile_view.dart';

class HomeViewModel extends GetxController{

  Widget _currentScreen = HomeView();
  get  currentScreen => _currentScreen;

  int _navigatorValue = 0;

  get navigatorValue =>  _navigatorValue;

  ValueNotifier<bool> get loading=> _loading;
  ValueNotifier<bool> _loading = ValueNotifier(false);

  
  List<CategoryModel> get categoryModel => _categoryModel;
  List<CategoryModel> _categoryModel = [];

  List<ProductModel> get productModel => _productModel;
  List<ProductModel> _productModel = [];
  
  final CollectionReference _categoryCollectionRef = FirebaseFirestore.instance.collection('categories');

  final CollectionReference _productCollectionRef = FirebaseFirestore.instance.collection('Products');


  HomeViewModel(){
    getCategory();
    getProducts();
  }

  void changeSelectedValue(int selectedValue){
    _navigatorValue = selectedValue;
    switch(selectedValue){
      case 0 :{
        _currentScreen = HomeView();
        break;
      }
      case 1 :{
        _currentScreen = CartView();
        break;
      }
      case 2 :{
        _currentScreen = ProfileView();

      }
    }
    update();
  }

  getCategory() async{
    _loading.value = true;
    _categoryCollectionRef.get().then((value){
      for(int i = 0 ; i<value.docs.length ; i++){
        _categoryModel.add(CategoryModel.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getProducts() async{
    _loading.value = true;
    _productCollectionRef.get().then((value){
      for(int i = 0 ; i<value.docs.length ; i++){
        _productModel.add(ProductModel.fromJson(value.docs[i].data() as Map<dynamic, dynamic>));
        _loading.value = false;
      }
      update();
    });
  }
}