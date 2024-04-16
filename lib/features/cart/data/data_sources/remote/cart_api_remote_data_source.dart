import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/get_cart_response/get_cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartAPIRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;

  const CartAPIRemoteDataSource(this._dio);

  @override
  Future addToCart(String productId) async {}

  @override
  Future<GetCartResponse> getCart() async {
    try {
      final response = await _dio.get(APIConstants.cartEndpoint);
      return GetCartResponse.fromJson(response.data);
    } catch (exception) {
      if (exception is DioException &&
          exception.response?.statusCode == HttpStatus.notFound) {
        throw const RemoteException('Cart is empty');
      }
      throw const RemoteException('Failed to get cart');
    }
  }

  @override
  Future updateCart(String productId, int quantity) async {}

  @override
  Future deleteFromCart(String productId) async {}
}
