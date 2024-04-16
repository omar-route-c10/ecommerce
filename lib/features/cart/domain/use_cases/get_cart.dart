import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/cart/domain/entities/cart.dart';
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCart {
  final CartRepository _repository;

  const GetCart(this._repository);

  Future<Either<Failure, Cart>> call() => _repository.getCart();
}
