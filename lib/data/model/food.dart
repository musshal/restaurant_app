class Food {
  final String name;

  Food({required this.name});

  factory Food.fromJson(Map<String, dynamic> foods) => Food(
    name: foods['name'],
  );
}