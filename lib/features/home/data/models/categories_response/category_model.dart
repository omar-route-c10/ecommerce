import 'package:ecommerce/features/home/domain/entities/category.dart';

class CategoryModel extends Category {
  final String? slug;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const CategoryModel({
    required super.id,
    required super.name,
    required super.imageURL,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'CategoryModel(id: $id, name: $name, slug: $slug, image: $imageURL, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['_id'] as String,
        name: json['name'] as String,
        imageURL: json['image'] as String,
        slug: json['slug'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
      );
}
