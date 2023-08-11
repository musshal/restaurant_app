import 'package:restaurant_app/data/model/restaurant_result.dart';

class GetListRestaurantResult {
  final bool error;
  final String message;
  final int count;
  final List<RestaurantResult> restaurants;

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

  Map<String, dynamic> toJson() => {
        'error': error,
        'message': message,
        'count': count,
        'restaurants': List<dynamic>.from(restaurants.map((x) => x.toJson())),
      };
}
