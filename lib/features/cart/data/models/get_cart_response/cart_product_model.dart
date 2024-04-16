import 'package:ecommerce/features/cart/domain/entities/cart_product.dart';

class CartProductModel extends CartProduct {
  const CartProductModel({
    required super.id,
    required super.title,
    required super.coverImageURL,
    required super.ratingsAverage,
  });

  factory CartProductModel.fromJson(Map<String, dynamic> json) {
    return CartProductModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      coverImageURL: json['imageCover'] as String,
      ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
    );
  }
}
