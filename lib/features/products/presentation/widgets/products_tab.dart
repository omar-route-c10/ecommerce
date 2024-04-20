import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/core/widgets/search_bar_with_cart.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_cubit.dart';
import 'package:ecommerce/features/products/presentation/cubit/products_states.dart';
import 'package:ecommerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<ProductsCubit>()..getProducts(),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.h),
              Image.asset(
                'assets/images/logo.png',
                color: Theme.of(context).primaryColor,
                height: 22.h,
                width: 66.w,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 18.h),
              const SearchBarWithCart(),
              SizedBox(height: 16.h),
              Expanded(
                child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                    if (state is GetProductsLoading) {
                      return const LoadingIndicator();
                    } else if (state is GetProductsError) {
                      return ErrorIndicator(state.message);
                    } else if (state is GetProductsSuccess) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2 / 2.5,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                        ),
                        itemBuilder: (_, index) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductDetailsScreen.routeName,
                              arguments: state.products[index],
                            );
                          },
                          child: ProductItem(state.products[index]),
                        ),
                        itemCount: state.products.length,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
