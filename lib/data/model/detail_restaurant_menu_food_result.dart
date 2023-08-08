class DetailRestaurantMenuFoodResult {
  final String name;

  DetailRestaurantMenuFoodResult({required this.name});

  factory DetailRestaurantMenuFoodResult.fromJson(Map<String, dynamic> foods) =>
      DetailRestaurantMenuFoodResult(
        name: foods['name'] as String,
      );
}
