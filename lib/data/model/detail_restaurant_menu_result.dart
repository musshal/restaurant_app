import 'package:restaurant_app/data/model/detail_restaurant_menu_drink_result.dart';
import 'package:restaurant_app/data/model/detail_restaurant_menu_food_result.dart';

class DetailRestaurantMenuResult {
  final List<DetailRestaurantMenuFoodResult> foods;
  final List<DetailRestaurantMenuDrinkResult> drinks;

  DetailRestaurantMenuResult({required this.foods, required this.drinks});

  factory DetailRestaurantMenuResult.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantMenuResult(
        foods: List<DetailRestaurantMenuFoodResult>.from((json['foods'] as List)
            .map((e) => DetailRestaurantMenuFoodResult.fromJson(e))),
        drinks: List<DetailRestaurantMenuDrinkResult>.from(
            (json['drinks'] as List)
                .map((e) => DetailRestaurantMenuDrinkResult.fromJson(e))),
      );
}
