import 'package:flutter/material.dart';
import 'package:restaurant_app/data/model/local_restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: restaurant.pictureId,
              child: Image.network(restaurant.pictureId)
            ),
            Padding(padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                        children: [
                          const Icon(
                            Icons.location_pin,
                            color: Colors.red,
                            size: 15,
                          ),
                          const SizedBox(width: 5),
                          Text(restaurant.city)
                        ]
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        const SizedBox(width: 5),
                        Text(restaurant.rating.toString())
                      ],
                    )
                  ],
                ),
                const Divider(color: Colors.grey),
                const Text('Deskripsi:'),
                const SizedBox(
                  height: 10,
                ),
                Text(restaurant.description),
                const Divider(color: Colors.grey,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Menu:'),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Foods:'),
                        Text(
                          restaurant.menus.foods
                              .map((foods) => foods.name)
                              .toString(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('Drinks:'),
                        Text(
                          restaurant.menus.drinks
                              .map((drink) => drink.name)
                              .toString(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            )
          ],
        ),
      ),
    );
  }
}
