import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/products/data/data_sources/remote/products_remote_data_source.dart';
import 'package:ecommerce/features/products/data/models/products_response/products_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsRemoteDataSource)
class ProductsAPIRemoteDataSource implements ProductsRemoteDataSource {
  final Dio _dio;

  ProductsAPIRemoteDataSource(this._dio);

  @override
  Future<ProductsResponse> getProducts() async {
    try {
      final response = await _dio.get(APIConstants.productsEndpoint);
      return ProductsResponse.fromJson(response.data);
    } catch (_) {
      throw const RemoteException('Failed to get products');
    }
  }
}
