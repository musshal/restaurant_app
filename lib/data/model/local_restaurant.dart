import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menu menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus
  });

  factory Restaurant.fromJson(Map<String, dynamic> restaurants) => Restaurant(
    id: restaurants['id'],
    name: restaurants['name'],
    description: restaurants['description'],
    pictureId: restaurants['pictureId'],
    city: restaurants['city'],
    rating: restaurants['rating'].toDouble(),
    menus: Menu.fromJson(restaurants['menus'])
  );
}

class Menu {
  final List<Food> foods;
  final List<Drink> drinks;

  Menu({required this.foods, required this.drinks});

  factory Menu.fromJson(Map<String, dynamic> menus) => Menu(
      foods: List<Food>.from(menus['foods'].map((e) => Food.fromJson(e))),
      drinks: List<Drink>.from(menus['drinks'].map((e) => Drink.fromJson(e)))
  );
}

class Food {
  final String name;

  Food({required this.name});

  factory Food.fromJson(Map<String, dynamic> foods) => Food(
      name: foods['name']
  );
}

class Drink {
  final String name;

  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> drinks) => Drink(
      name: drinks['name']
  );
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) return [];
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}