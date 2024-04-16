import 'package:ecommerce/features/cart/domain/entities/cart.dart';

import 'cart_item_model.dart';

class CartModel extends Cart {
  final String? id;
  final String? cartOwner;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  const CartModel({
    required super.products,
    required super.totalPrice,
    this.id,
    this.cartOwner,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json['_id'] as String?,
        cartOwner: json['cartOwner'] as String?,
        products: (json['products'] as List<dynamic>)
            .map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        totalPrice: json['totalCartPrice'] as int,
      );
}
