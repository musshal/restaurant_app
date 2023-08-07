class DetailRestaurantMenuDrinkResult {
  String name;

  DetailRestaurantMenuDrinkResult({required this.name});

  factory DetailRestaurantMenuDrinkResult.fromJson(
          Map<String, dynamic> drinks) =>
      DetailRestaurantMenuDrinkResult(
        name: drinks['name'] as String,
      );
}
