import 'package:ecommerce/features/home/domain/use_cases/get_brands.dart';
import 'package:ecommerce/features/home/domain/use_cases/get_categories.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._getCategories,
    this._getBrands,
  ) : super(HomeInitial());

  final GetCategories _getCategories;
  final GetBrands _getBrands;

  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final result = await _getCategories();
    result.fold(
      (failure) => emit(
        GetCategoriesError(failure.message),
      ),
      (categories) => emit(
        GetCategoriesSuccess(categories),
      ),
    );
  }

  Future<void> getBrands() async {
    emit(GetBrandsLoading());
    final result = await _getBrands();
    result.fold(
      (failure) => emit(
        GetBrandsError(failure.message),
      ),
      (brands) => emit(
        GetBrandsSuccess(brands),
      ),
    );
  }
}
