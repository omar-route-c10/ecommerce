import 'package:ecommerce/features/cart/data/models/get_cart_response/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(String productId);

  Future<CartResponse> getCart();

  Future<CartResponse> updateCart(String productId, int count);

  Future<CartResponse> deleteFromCart(String productId);
}
