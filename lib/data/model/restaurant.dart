import 'dart:convert';

import 'menu.dart';

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
    menus: Menu.fromJson(restaurants['menus']),
  );
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) return [];
  final List parsed = jsonDecode(json)['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}