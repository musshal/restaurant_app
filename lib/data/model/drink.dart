class Drink {
  final String name;

  Drink({required this.name});

  factory Drink.fromJson(Map<String, dynamic> drinks) => Drink(
    name: drinks['name'],
  );
}