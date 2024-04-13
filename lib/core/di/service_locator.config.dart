// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:ecommerce/core/di/register_module.dart' as _i21;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i9;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i10;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i12;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i11;
import 'package:ecommerce/features/auth/data/repository/auth_repository_impl.dart'
    as _i14;
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart'
    as _i13;
import 'package:ecommerce/features/auth/domain/use_cases/login.dart' as _i18;
import 'package:ecommerce/features/auth/domain/use_cases/register.dart' as _i19;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i20;
import 'package:ecommerce/features/home/data/data_sources/remote/home_api_remote_data_source.dart'
    as _i5;
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i4;
import 'package:ecommerce/features/home/data/repository/home_repository_impl.dart'
    as _i7;
import 'package:ecommerce/features/home/domain/repository/home_repository.dart'
    as _i6;
import 'package:ecommerce/features/home/domain/use_cases/get_brands.dart'
    as _i15;
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart'
    as _i16;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i4.HomeRemoteDataSource>(
        () => _i5.HomeAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i6.HomeRepository>(
        () => _i7.HomeRepositoryImpl(gh<_i4.HomeRemoteDataSource>()));
    await gh.factoryAsync<_i8.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.singleton<_i9.AuthLocalDataSource>(
        () => _i10.AuthSharedPrefLocalDataSource(gh<_i8.SharedPreferences>()));
    gh.singleton<_i11.AuthRemoteDataSource>(
        () => _i12.AuthAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i13.AuthRepository>(() => _i14.AuthRepositoryImpl(
          gh<_i11.AuthRemoteDataSource>(),
          gh<_i9.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i15.GetBrands>(
        () => _i15.GetBrands(gh<_i6.HomeRepository>()));
    gh.lazySingleton<_i16.GetCategories>(
        () => _i16.GetCategories(gh<_i6.HomeRepository>()));
    gh.factory<_i17.HomeCubit>(() => _i17.HomeCubit(
          gh<_i16.GetCategories>(),
          gh<_i15.GetBrands>(),
        ));
    gh.singleton<_i18.Login>(() => _i18.Login(gh<_i13.AuthRepository>()));
    gh.singleton<_i19.Register>(() => _i19.Register(gh<_i13.AuthRepository>()));
    gh.singleton<_i20.AuthCubit>(() => _i20.AuthCubit(
          gh<_i19.Register>(),
          gh<_i18.Login>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
