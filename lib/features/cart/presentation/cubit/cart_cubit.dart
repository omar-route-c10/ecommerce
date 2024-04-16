import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(this._getCart) : super(CartInitial());

  final GetCart _getCart;

  Future<void> getCart() async {
    emit(GetCartLoading());
    final result = await _getCart();
    result.fold(
      (failure) => emit(GetCartError(failure.message)),
      (cart) => emit(GetCartSuccess(cart)),
    );
  }
}
