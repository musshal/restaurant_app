import 'drink.dart';
import 'food.dart';

class Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> menus) => Menu(
    foods: List<Food>.from(menus['foods'].map((e) => Food.fromJson(e))),
    drinks: List<Drink>.from(menus['drinks'].map((e) => Drink.fromJson(e))),
  );
}