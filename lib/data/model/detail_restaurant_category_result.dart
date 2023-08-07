class DetailRestaurantCategoryResult {
  String name;

  DetailRestaurantCategoryResult({required this.name});

  factory DetailRestaurantCategoryResult.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantCategoryResult(
        name: json['name'] as String,
      );
}
