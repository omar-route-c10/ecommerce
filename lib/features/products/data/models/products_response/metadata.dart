class Metadata {
  final int? currentPage;
  final int? numberOfPages;
  final int? limit;
  final int? nextPage;

  const Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
    this.nextPage,
  });

  @override
  String toString() {
    return 'Metadata(currentPage: $currentPage, numberOfPages: $numberOfPages, limit: $limit, nextPage: $nextPage)';
  }

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        currentPage: json['currentPage'] as int?,
        numberOfPages: json['numberOfPages'] as int?,
        limit: json['limit'] as int?,
        nextPage: json['nextPage'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'currentPage': currentPage,
        'numberOfPages': numberOfPages,
        'limit': limit,
        'nextPage': nextPage,
      };
}
