import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart';
import 'package:ecommerce/features/home/domain/entities/brand.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:ecommerce/features/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  const HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categoriesResponse = await _remoteDataSource.getCategories();
      return Right(categoriesResponse.data);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, List<Brand>>> getBrands() async {
    try {
      final brandsResponse = await _remoteDataSource.getBrands();
      return Right(brandsResponse.data);
    } on RemoteException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
