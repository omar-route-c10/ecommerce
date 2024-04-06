import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/core/error/failure.dart';
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/domain/entities/user.dart';
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  const AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, User>> register(RegisterRequest requestData) async {
    try {
      final response = await _remoteDataSource.register(requestData);
      if (response.token != null && response.user != null) {
        await _localDataSource.saveToken(response.token!);
        return Right(response.user!);
      } else {
        return const Left(Failure());
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }

  @override
  Future<Either<Failure, User>> login(LoginRequest requestData) async {
    try {
      final response = await _remoteDataSource.login(requestData);
      if (response.token != null && response.user != null) {
        await _localDataSource.saveToken(response.token!);
        return Right(response.user!);
      } else {
        return const Left(Failure());
      }
    } on AppException catch (exception) {
      return Left(Failure(exception.message));
    }
  }
}
