import 'package:restaurant_app/data/model/restaurant_result.dart';

class GetListRestaurantResult {
  bool error;
  String message;
  int count;
  List<RestaurantResult> restaurants;

  GetListRestaurantResult({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  factory GetListRestaurantResult.fromJson(Map<String, dynamic> json) =>
      GetListRestaurantResult(
        error: json['error'],
        message: json['message'],
        count: json['count'],
        restaurants: List<RestaurantResult>.from(
          (json['restaurants'] as List)
              .map((e) => RestaurantResult.fromJson(e)),
        ),
      );
}