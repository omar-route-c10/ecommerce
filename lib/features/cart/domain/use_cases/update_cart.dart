import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateCart {
  final CartRepository _repository;

  const UpdateCart(this._repository);

  Future<Either<Failure, Cart>> call(String productId, int count) =>
      _repository.updateCart(productId, count);
}
