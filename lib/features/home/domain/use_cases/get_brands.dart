import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/domain/entities/brand.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetBrands {
  final HomeRepository _homeRepository;

  const GetBrands(this._homeRepository);

  Future<Either<Failure, List<Brand>>> call() => _homeRepository.getBrands();
}
