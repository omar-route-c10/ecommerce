// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:ecommerce/core/di/register_module.dart' as _i27;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i13;
import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart'
    as _i14;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart'
    as _i16;
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i15;
import 'package:ecommerce/features/auth/data/repository/auth_repository_impl.dart'
    as _i18;
import 'package:ecommerce/features/auth/domain/repository/auth_repository.dart'
    as _i13;
import 'package:ecommerce/features/auth/domain/use_cases/login.dart' as _i23;
import 'package:ecommerce/features/auth/domain/use_cases/register.dart' as _i24;
import 'package:ecommerce/features/auth/presentation/cubit/auth_cubit.dart'
    as _i25;
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_api_remote_data_source.dart'
    as _i16;
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart'
    as _i15;
import 'package:ecommerce/features/cart/data/repository/cart_repository_impl.dart'
    as _i18;
import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart'
    as _i17;
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart' as _i20;
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart'
    as _i26;
import 'package:ecommerce/features/home/data/data_sources/remote/home_api_remote_data_source.dart'
    as _i5;
import 'package:ecommerce/features/home/data/data_sources/remote/home_remote_data_source.dart'
    as _i4;
import 'package:ecommerce/features/home/data/repository/home_repository_impl.dart'
    as _i7;
import 'package:ecommerce/features/home/domain/repository/home_repository.dart'
    as _i6;
import 'package:ecommerce/features/home/domain/use_cases/get_brands.dart'
    as _i19;
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart'
    as _i21;
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart'
    as _i22;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

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
    gh.lazySingleton<_i8.ProductsRemoteDataSource>(
        () => _i9.ProductsAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i10.ProductsRepository>(
        () => _i11.ProductsRepositoryImpl(gh<_i8.ProductsRemoteDataSource>()));
    await gh.factoryAsync<_i12.SharedPreferences>(
      () => registerModule.sharedPref,
      preResolve: true,
    );
    gh.singleton<_i13.AuthLocalDataSource>(
        () => _i14.AuthSharedPrefLocalDataSource(gh<_i12.SharedPreferences>()));
    gh.singleton<_i15.AuthRemoteDataSource>(
        () => _i16.AuthAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.singleton<_i17.AuthRepository>(() => _i18.AuthRepositoryImpl(
          gh<_i15.AuthRemoteDataSource>(),
          gh<_i13.AuthLocalDataSource>(),
        ));
    gh.lazySingleton<_i15.CartRemoteDataSource>(
        () => _i16.CartAPIRemoteDataSource(gh<_i3.Dio>()));
    gh.lazySingleton<_i17.CartRepository>(
        () => _i18.CartRepositoryImpl(gh<_i15.CartRemoteDataSource>()));
    gh.lazySingleton<_i19.GetBrands>(
        () => _i19.GetBrands(gh<_i6.HomeRepository>()));
    gh.lazySingleton<_i20.GetCart>(
        () => _i20.GetCart(gh<_i17.CartRepository>()));
    gh.lazySingleton<_i21.GetCategories>(
        () => _i21.GetCategories(gh<_i6.HomeRepository>()));
    gh.factory<_i22.HomeCubit>(() => _i22.HomeCubit(
          gh<_i21.GetCategories>(),
          gh<_i19.GetBrands>(),
        ));
    gh.singleton<_i23.Login>(() => _i23.Login(gh<_i13.AuthRepository>()));
    gh.singleton<_i24.Register>(() => _i24.Register(gh<_i13.AuthRepository>()));
    gh.singleton<_i25.AuthCubit>(() => _i25.AuthCubit(
          gh<_i24.Register>(),
          gh<_i23.Login>(),
        ));
    gh.factory<_i26.CartCubit>(() => _i26.CartCubit(gh<_i20.GetCart>()));
    return this;
  }
}

class _$RegisterModule extends _i27.RegisterModule {}

class _$RegisterModule extends _i27.RegisterModule {}
