import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRepository)
class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource _remoteDataSource;

  const CartRepositoryImpl(this._remoteDataSource);

  @override
  Future addToCart(String productId) async {}

  @override
  Future<Either<Failure, Cart>> getCart() async {
    try {
      final cartResponse = await _remoteDataSource.getCart();
      return Right(cartResponse.data);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future updateCart(String productId, int count) {
    // TODO: implement updateCart
    throw UnimplementedError();
  }

  @override
  Future deleteFromCart(String productId) {
    // TODO: implement deleteFromCart
    throw UnimplementedError();
  }
}
