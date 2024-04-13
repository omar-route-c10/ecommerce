import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/widgets/error_indicator.dart';
import 'package:ecommerce/core/widgets/loading_indicator.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/features/home/presentation/cubit/home_states.dart';
import 'package:ecommerce/features/home/presentation/widgets/brand_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsSection extends StatelessWidget {
  const BrandsSection();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => serviceLocator.get<HomeCubit>()..getBrands(),
      child: SizedBox(
        height: 280.h,
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is GetBrandsLoading) {
              return const LoadingIndicator();
            } else if (state is GetBrandsError) {
              return ErrorIndicator(state.message);
            } else if (state is GetBrandsSuccess) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 100.h,
                  childAspectRatio: 100 / 144,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) => BrandItem(state.brands[index]),
                itemCount: state.brands.length,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
