class DetailRestaurantCustomerReviewResult {
  String name;
  String review;
  String date;

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
