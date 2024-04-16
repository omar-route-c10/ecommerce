import 'package:ecommerce/features/cart/data/models/get_cart_response/get_cart_response.dart';

abstract class CartRemoteDataSource {
  Future addToCart(String productId);

  Future<GetCartResponse> getCart();

  Future updateCart(String productId, int count);

  Future deleteFromCart(String productId);
}
