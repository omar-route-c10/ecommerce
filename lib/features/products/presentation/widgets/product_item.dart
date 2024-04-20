import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/core/utils/ui_utils.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatefulWidget {
  const ProductItem(this.product);

  final Product product;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  final _cartCubit = serviceLocator.get<CartCubit>();

  @override
  Widget build(BuildContext context) {
    final smallDarkTitleMediumStyle =
        Theme.of(context).textTheme.titleMedium?.copyWith(
              color: ColorsManager.darkPrimary,
              fontSize: 14.sp,
            );
    return BlocProvider(
      create: (_) => _cartCubit,
      child: Container(
        height: 237.h,
        width: 191.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: ColorsManager.blueGrey,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: widget.product.coverImageUrl,
                    height: 128.h,
                    width: 191.w,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 2.w,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: IconButton(
                      color: Theme.of(context).primaryColor,
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                widget.product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: smallDarkTitleMediumStyle,
              ),
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Row(
                children: [
                  Text(
                    'EGP ${widget.product.price}',
                    maxLines: 1,
                    style: smallDarkTitleMediumStyle,
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
            SizedBox(height: 7.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                children: [
                  Text(
                    'Review (${widget.product.ratingsAverage})',
                    maxLines: 1,
                    style: smallDarkTitleMediumStyle?.copyWith(fontSize: 12.sp),
                  ),
                  SizedBox(width: 7.w),
                  const ImageIcon(
                    AssetImage(
                      'assets/images/star_icon.png',
                    ),
                    size: 16,
                    color: ColorsManager.yellow,
                  ),
                  const Spacer(),
                  BlocListener<CartCubit, CartState>(
                    listener: (_, state) {
                      if (state is AddToCartLoading) {
                        UIUtils.showLoading(context);
                      } else if (state is AddToCartSuccess) {
                        UIUtils.hideLoading(context);
                        UIUtils.showMessage('Added to cart successfully');
                      } else if (state is AddToCartError) {
                        UIUtils.hideLoading(context);
                        UIUtils.showMessage(state.message);
                      }
                    },
                    child: InkWell(
                      onTap: () => _cartCubit.addToCart(widget.product.id),
                      child: Icon(
                        Icons.add_circle,
                        size: 28.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
