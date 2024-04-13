import 'category_model.dart';
import 'metadata.dart';

class CategoriesResponse {
  final int? results;
  final Metadata? metadata;
  final List<CategoryModel> data;

  const CategoriesResponse({
    this.results,
    this.metadata,
    required this.data,
  });

  @override
  String toString() {
    return 'CategoriesResponse(results: $results, metadata: $metadata, data: $data)';
  }

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      results: json['results'] as int?,
      metadata: json['metadata'] == null
          ? null
          : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
