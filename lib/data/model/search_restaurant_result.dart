import 'package:restaurant_app/data/model/restaurant_result.dart';

class SearchRestaurantResult {
  bool error;
  int founded;
  List<RestaurantResult> restaurants;

  SearchRestaurantResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  factory SearchRestaurantResult.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantResult(
        error: json['error'],
        founded: json['founded'],
        restaurants: List<RestaurantResult>.from(
          (json['restaurants'] as List)
              .map((e) => RestaurantResult.fromJson(e)),
        ),
      );
}
