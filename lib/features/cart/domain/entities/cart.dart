import 'package:ecommerce/features/cart/domain/entities/cart_item_data.dart';

class Cart {
  final List<CartItemData> products;
  final int totalPrice;

  const Cart({
    required this.products,
    required this.totalPrice,
  });
}
