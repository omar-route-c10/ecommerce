import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String title;
  final String description;
  final int price;
  final String coverImageUrl;
  final List<String> imagesURLs;
  final double ratingsAverage;
  final int ratingsQuantity;
  final int sold;

  const Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.coverImageUrl,
    required this.imagesURLs,
    required this.ratingsAverage,
    required this.ratingsQuantity,
    required this.sold,
  });

  @override
  List<Object?> get props => [id];
}
