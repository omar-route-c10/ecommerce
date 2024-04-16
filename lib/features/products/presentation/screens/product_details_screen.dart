import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/core/theming/colors_manager.dart';
import 'package:ecommerce/features/products/domain/entities/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen();

  static const String routeName = '/product-details';

  @override
  Widget build(BuildContext context) {
    final titleMediumStyle = Theme.of(context).textTheme.titleMedium;
    final readMoreTextStyle = TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: ColorsManager.darkPrimary,
    );
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.h,
          horizontal: 16.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: ColorsManager.blueGrey,
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.97,
                    ),
                    itemBuilder: (_, index, __) => Image.network(
                      product.imagesURLs[index],
                      height: 300.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    itemCount: product.imagesURLs.length,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      product.title,
                      style: titleMediumStyle?.copyWith(
                        color: ColorsManager.darkPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Text(
                    'EGP ${product.price}',
                    style: titleMediumStyle?.copyWith(
                      color: ColorsManager.darkPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              color: ColorsManager.blueGrey,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '${product.sold} Sold',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 14.sp,
                                  color: ColorsManager.darkPrimary,
                                ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        const ImageIcon(
                          AssetImage('assets/images/star_icon.png'),
                          color: ColorsManager.yellow,
                          size: 16,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '${product.ratingsAverage} (${product.ratingsQuantity})',
                          style: titleMediumStyle?.copyWith(
                            fontSize: 14.sp,
                            color: ColorsManager.darkPrimary,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.remove_circle_outline_rounded,
                            color: ColorsManager.white,
                            size: 28.sp,
                          ),
                        ),
                        Text(
                          '1',
                          style: titleMediumStyle,
                        ),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          icon: Icon(
                            Icons.add_circle_outline_rounded,
                            color: ColorsManager.white,
                            size: 28.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Text(
                'Description',
                style: titleMediumStyle?.copyWith(
                  color: ColorsManager.darkPrimary,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              ReadMoreText(
                product.description,
                trimLines: 3,
                trimMode: TrimMode.Line,
                style: readMoreTextStyle.copyWith(
                  color: ColorsManager.navy,
                ),
                trimCollapsedText: 'Show More',
                trimExpandedText: 'Show Less',
                moreStyle: readMoreTextStyle,
                lessStyle: readMoreTextStyle,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total price',
                        style: titleMediumStyle?.copyWith(
                          color: ColorsManager.navy,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'EGP ${product.price}',
                        style: titleMediumStyle?.copyWith(
                          color: ColorsManager.darkPrimary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 32.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.add_shopping_cart_outlined,
                            color: ColorsManager.white,
                          ),
                          Text(
                            'Add to cart',
                            style: titleMediumStyle,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
