import 'package:restaurant_app/data/model/detail_restaurant_category_result.dart';
import 'package:restaurant_app/data/model/detail_restaurant_customer_review_result.dart';
import 'package:restaurant_app/data/model/detail_restaurant_menu_result.dart';

class DetailRestaurantResult {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<DetailRestaurantCategoryResult> categories;
  final DetailRestaurantMenuResult menus;
  final double rating;
  final List<DetailRestaurantCustomerReviewResult> customerReviews;

  DetailRestaurantResult({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  factory DetailRestaurantResult.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantResult(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        city: json['city'],
        address: json['address'],
        pictureId: json['pictureId'],
        categories: List<DetailRestaurantCategoryResult>.from(
            (json['categories'] as List)
                .map((e) => DetailRestaurantCategoryResult.fromJson(e))),
        menus: DetailRestaurantMenuResult.fromJson(json['menus']),
        rating: json['rating'].toDouble(),
        customerReviews: List<DetailRestaurantCustomerReviewResult>.from(
            (json['customerReviews'] as List)
                .map((e) => DetailRestaurantCustomerReviewResult.fromJson(e))),
      );
}
