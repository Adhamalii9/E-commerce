import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/model/cart_product_model.dart';

class OrderModel {
  String userId, dateTime;
  Address address;
  List<CartProductModel> products;

  OrderModel({this.userId, this.dateTime, this.address, this.products});

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return new OrderModel(
      userId: map['userId'] as String,
      dateTime: map['dateTime'] as String,
      address: map['address'] as Address,
      products: map['address'] as List<CartProductModel> ,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'dateTime': this.dateTime,
      'address': this.address,
      'products': this.products,
    };
  }
}

class Address {
  String street1, street2, city, state, country;

  Address({this.street1, this.street2, this.city, this.state, this.country});

  factory Address.fromMap(Map<String, dynamic> map) {
    return new Address(
      street1: map['street1'] as String,
      street2: map['street2'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street1': this.street1,
      'street2': this.street2,
      'city': this.city,
      'state': this.state,
      'country': this.country,
    };
  }
}
