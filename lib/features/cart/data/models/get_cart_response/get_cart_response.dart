import 'cart_model.dart';

class GetCartResponse {
  final String? status;
  final int? numOfCartItems;
  final CartModel data;

  const GetCartResponse({
    this.status,
    this.numOfCartItems,
    required this.data,
  });

  factory GetCartResponse.fromJson(Map<String, dynamic> json) {
    return GetCartResponse(
      status: json['status'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      data: CartModel.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
