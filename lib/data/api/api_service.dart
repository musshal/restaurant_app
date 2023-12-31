import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant_app/data/model/get_detail_restaurant_result.dart';
import 'package:restaurant_app/data/model/get_list_restaurant_result.dart';
import 'package:restaurant_app/data/model/search_restaurant_result.dart';

class ApiService {
  static const String baseUrl = 'https://restaurant-api.dicoding.dev';

  http.Client client;
  ApiService({required this.client});

  Future<GetListRestaurantResult> getListRestaurant() async {
    final response = await client.get(Uri.parse('$baseUrl/list'));
    if (response.statusCode == 200) {
      return GetListRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get list restaurant');
    }
  }

  Future<GetDetailRestaurantResult> getDetailRestaurant(id) async {
    final response = await client.get(Uri.parse('$baseUrl/detail/$id'));
    if (response.statusCode == 200) {
      return GetDetailRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get detail restaurant');
    }
  }

  Future<SearchRestaurantResult> searchRestaurant(query) async {
    final response = await client.get(Uri.parse('$baseUrl/search?q=$query'));
    if (response.statusCode == 200) {
      return SearchRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get restaurants');
    }
  }
}
