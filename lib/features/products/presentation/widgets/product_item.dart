import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductItem extends StatelessWidget {
  const ProductItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 237.h,
      width: 191.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Theme.of(context).primaryColor,
          width: 1,
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
                  imageUrl:
                      'https://ecommerce.routemisr.com/Route-Academy-products/1680399913757-cover.jpeg',
                  fit: BoxFit.cover,
                  width: 191.w,
                  height: 128.h,
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
              'Softride Enzo NXT CASTLEROCK-High Risk R',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 14.sp,
                    color: ColorsManager.darkPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(height: 7.h),
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Row(
              children: [
                Text(
                  'EGP 2999',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: ColorsManager.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
          ),
          SizedBox(height: 7.h),
          Padding(
            padding: EdgeInsets.only(left: 8.w, right: 8.w),
            child: Row(
              children: [
                Text(
                  'Review (2.8)',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp,
                        color: ColorsManager.darkPrimaryColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                SizedBox(width: 7.w),
                const ImageIcon(
                  AssetImage(
                    'assets/images/star_icon.png',
                  ),
                  size: 16,
                  color: ColorsManager.yellowColor,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.add_circle,
                    size: 28.sp,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
