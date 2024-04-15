import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/features/home/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(this.category);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundImage: CachedNetworkImageProvider(
            category.imageURL,
          ),
          radius: 50.r,
        ),
        SizedBox(height: 8.h),
        Text(
          category.name,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontSize: 14.sp,
                color: ColorsManager.darkPrimary,
                fontWeight: FontWeight.normal,
              ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
