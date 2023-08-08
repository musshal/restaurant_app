class DetailRestaurantCustomerReviewResult {
  final String name;
  final String review;
  final String date;

  DetailRestaurantCustomerReviewResult({
    required this.name,
    required this.review,
    required this.date,
  });

  factory DetailRestaurantCustomerReviewResult.fromJson(
          Map<String, dynamic> json) =>
      DetailRestaurantCustomerReviewResult(
        name: json['name'] as String,
        review: json['review'] as String,
        date: json['date'] as String,
      );
}
