import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToCart {
  final CartRepository _repository;

  const AddToCart(this._repository);

  Future<Either<Failure, void>> call(String productId) =>
      _repository.addToCart(productId);
}
