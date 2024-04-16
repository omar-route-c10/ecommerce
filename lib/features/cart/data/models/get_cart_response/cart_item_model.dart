import 'package:ecommerce/features/cart/data/models/get_cart_response/cart_product_model.dart';
import 'package:ecommerce/features/cart/domain/entities/cart_item_data.dart';

class CartItemModel extends CartItemData {
  const CartItemModel({
    required super.id,
    required super.count,
    required super.price,
    required super.product,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        count: json['count'] as int,
        id: json['_id'] as String,
        product:
            CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
        price: json['price'] as int,
      );
}
