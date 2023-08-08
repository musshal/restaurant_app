import 'package:restaurant_app/data/model/detail_restaurant_result.dart';

class GetDetailRestaurantResult {
  final bool error;
  final String message;
  final DetailRestaurantResult restaurant;

  GetDetailRestaurantResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory GetDetailRestaurantResult.fromJson(Map<String, dynamic> json) =>
      GetDetailRestaurantResult(
        error: json['error'],
        message: json['message'],
        restaurant: DetailRestaurantResult.fromJson(json['restaurant']),
      );
}
