import 'package:ecommerce/features/home/domain/entities/brand.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetCategoriesLoading extends HomeState {}

class GetCategoriesSuccess extends HomeState {
  final List<Category> categories;

  GetCategoriesSuccess(this.categories);
}

class GetCategoriesError extends HomeState {
  final String message;

  GetCategoriesError(this.message);
}

class GetBrandsLoading extends HomeState {}

class GetBrandsSuccess extends HomeState {
  final List<Brand> brands;

  GetBrandsSuccess(this.brands);
}

class GetBrandsError extends HomeState {
  final String message;

  GetBrandsError(this.message);
}
