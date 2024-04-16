import 'package:ecommerce/features/products/domain/entities/product.dart';

import 'brand_model.dart';
import 'category_model.dart';

class ProductModel extends Product {
  final String? slug;
  final int? quantity;
  final CategoryModel? category;
  final BrandModel? brand;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? priceAfterDiscount;

  const ProductModel({
    required super.id,
    required super.title,
    required super.description,
    required super.price,
    required super.coverImageUrl,
    required super.imagesURLs,
    required super.ratingsAverage,
    required super.ratingsQuantity,
    required super.sold,
    this.slug,
    this.quantity,
    this.category,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.priceAfterDiscount,
  });

  @override
  String toString() {
    return 'ProductModel(sold: $sold, images: $imagesURLs,  ratingsQuantity: $ratingsQuantity, id: $id, title: $title, slug: $slug, description: $description, quantity: $quantity, price: $price, imageCover: $coverImageUrl, category: $category, brand: $brand, ratingsAverage: $ratingsAverage, createdAt: $createdAt, updatedAt: $updatedAt, id: $id, priceAfterDiscount: $priceAfterDiscount)';
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        sold: json['sold'] as int,
        imagesURLs: (json['images'] as List<dynamic>)
            .map((imageURL) => imageURL.toString())
            .toList(),
        ratingsQuantity: json['ratingsQuantity'] as int,
        id: json['_id'] as String,
        title: json['title'] as String,
        slug: json['slug'] as String?,
        description: json['description'] as String,
        quantity: json['quantity'] as int?,
        price: json['price'] as int,
        coverImageUrl: json['imageCover'] as String,
        category: json['category'] == null
            ? null
            : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
        brand: json['brand'] == null
            ? null
            : BrandModel.fromJson(json['brand'] as Map<String, dynamic>),
        ratingsAverage: (json['ratingsAverage'] as num).toDouble(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        priceAfterDiscount: json['priceAfterDiscount'] as int?,
      );
}
