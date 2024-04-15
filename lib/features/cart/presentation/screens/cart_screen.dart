import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen();

  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(fontWeight: FontWeight.w500);
    return Scaffold(
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 8.h),
          Expanded(
            child: ListView.separated(
              itemBuilder: (_, index) => const CartItem(),
              separatorBuilder: (_, index) => SizedBox(height: 12.h),
              itemCount: 2,
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
                      'EGP 2999',
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
                            style: titleMediumStyle?.copyWith(fontSize: 20),
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
      ),
    );
  }
}
