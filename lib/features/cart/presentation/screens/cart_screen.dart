import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  static const String routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _cartCubit = serviceLocator.get<CartCubit>();

  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.w500);
    return BlocProvider(
      create: (_) => _cartCubit..getCart(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cart'),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 28.sp,
              ),
            ),
          ],
        ),
        body: BlocConsumer<CartCubit, CartState>(
          listener: (_, state) {
            if (state is UpdateCartLoading || state is DeleteFromCartLoading) {
              UIUtils.showLoading(context);
            } else if (state is UpdateCartSuccess ||
                state is DeleteFromCartSuccess) {
              UIUtils.hideLoading(context);
            } else if (state is UpdateCartError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.message);
            } else if (state is DeleteFromCartError) {
              UIUtils.hideLoading(context);
              UIUtils.showMessage(state.message);
            }
          },
          builder: (context, state) {
            if (state is GetCartLoading) {
              return const LoadingIndicator();
            } else if (state is GetCartError) {
              return ErrorIndicator(state.message);
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 8.h),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (_, index) => CartItem(
                        cartItemData: _cartCubit.cart.products[index],
                        cartCubit: _cartCubit,
                      ),
                      separatorBuilder: (_, index) => SizedBox(height: 12.h),
                      itemCount: _cartCubit.cart.products.length,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 24.h,
                      horizontal: 16.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 12.h),
                              child: Text(
                                'Total Price',
                                style: titleMediumStyle?.copyWith(
                                  color: ColorsManager.navy,
                                ),
                              ),
                            ),
                            Text(
                              'EGP ${_cartCubit.cart.totalPrice}',
                              style: titleMediumStyle?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 55.h,
                            width: 270.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Check Out',
                                    style: titleMediumStyle?.copyWith(
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(width: 24.w),
                                  Icon(
                                    Icons.arrow_forward,
                                    size: 20.w,
                                    color: ColorsManager.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
