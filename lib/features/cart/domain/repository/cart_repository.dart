import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, Cart>> getCart();

  Future addToCart(String productId);

  Future updateCart(String productId, int count);

  Future deleteFromCart(String productId);
}
