import 'package:ecommerce/core/widgets/search_bar_with_cart.dart';
import 'package:ecommerce/features/products/presentation/screens/product_details_screen.dart';
import 'package:ecommerce/features/products/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTab extends StatelessWidget {
  const ProductsTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              child: GridView.builder(
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
                    );
                  },
                  child: const ProductItem(),
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
