import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ecommerce/core/constants.dart';
import 'package:ecommerce/core/error/exception.dart';
import 'package:ecommerce/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:ecommerce/features/cart/data/models/get_cart_response/cart_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartRemoteDataSource)
class CartAPIRemoteDataSource implements CartRemoteDataSource {
  final Dio _dio;

  const CartAPIRemoteDataSource(this._dio);

  @override
  Future<void> addToCart(String productId) async {
    try {
      await _dio.post(
        APIConstants.cartEndpoint,
        data: {
          'productId': productId,
        },
      );
    } catch (_) {
      throw const RemoteException('Failed to add product to cart');
    }
  }

  @override
  Future<CartResponse> getCart() async {
    try {
      final response = await _dio.get(APIConstants.cartEndpoint);
      return CartResponse.fromJson(response.data);
    } catch (exception) {
      if (exception is DioException &&
          exception.response?.statusCode == HttpStatus.notFound) {
        throw const RemoteException('Cart is empty');
      }
      throw const RemoteException('Failed to get cart');
    }
  }

  @override
  Future<CartResponse> updateCart(String productId, int count) async {
    try {
      final response = await _dio.put(
        '${APIConstants.cartEndpoint}/$productId',
        data: {
          'count': count,
        },
      );
      return CartResponse.fromJson(response.data);
    } catch (_) {
      throw const RemoteException('Failed to update product quantity');
    }
  }

  @override
  Future<CartResponse> deleteFromCart(String productId) async {
    try {
      final response = await _dio.delete(
        '${APIConstants.cartEndpoint}/$productId',
      );
      return CartResponse.fromJson(response.data);
    } catch (_) {
      throw const RemoteException('Failed to delete product from cart');
    }
  }
}
