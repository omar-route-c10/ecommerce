import 'brand_model.dart';
import 'metadata.dart';

class BrandsResponse {
  final int? results;
  final Metadata? metadata;
  final List<BrandModel> data;

  const BrandsResponse({
    this.results,
    this.metadata,
    required this.data,
  });

  @override
  String toString() {
    return 'BrandResponse(results: $results, metadata: $metadata, data: $data)';
  }

  factory BrandsResponse.fromJson(Map<String, dynamic> json) => BrandsResponse(
        results: json['results'] as int?,
        metadata: json['metadata'] == null
            ? null
            : Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
        data: (json['data'] as List<dynamic>)
            .map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
