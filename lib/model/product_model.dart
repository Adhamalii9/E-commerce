import 'package:e_commerce/helper/extension.dart';
import 'package:flutter/cupertino.dart';

class ProductModel{
  String name , image , description , sized , price ,productId;
  Color color;



  ProductModel(this.name, this.image, this.color, this.description, this.sized, this.price, this.productId);

  ProductModel.fromJson(Map<dynamic,dynamic> map){
    if (map == null) {
      return ;
    }
      name = map['name'];
      image = map['image'];
      color = HexColor.fromHex(map['color']);
      description = map['description'];
      sized = map['sized'];
      price = map['price'];
    productId = map['productId'];

  }
    toJson(){
      return{
        'name' : name,
        'image' : image,
        'color' : color,
        'description' : description,
        'sized' : sized,
        'price' : price,
        'productId' : productId,
      };}
  }
