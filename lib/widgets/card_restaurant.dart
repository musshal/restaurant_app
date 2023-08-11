import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/model/restaurant_result.dart';
import 'package:restaurant_app/provider/database_provider.dart';

import '../ui/restaurant_detail_page.dart';

class CardRestaurant extends StatelessWidget {
  final RestaurantResult restaurant;
  final _baseUrl = 'https://restaurant-api.dicoding.dev/images/small';

  const CardRestaurant({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
        future: provider.isFavorited(restaurant.id),
        builder: (context, snapshot) {
          var isFavorited = snapshot.data ?? false;
          return Material(
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              leading: Hero(
                tag: restaurant.pictureId,
                child: Image.network(
                  '$_baseUrl/${restaurant.pictureId}',
                  width: 100,
                ),
              ),
              title: Text(restaurant.name),
              subtitle: Row(children: [
                Row(children: [
                  const Icon(
                    Icons.location_pin,
                    color: Colors.red,
                    size: 15,
                  ),
                  const SizedBox(width: 5),
                  Text(restaurant.city)
                ]),
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
              ]),
              onTap: () {
                Navigator.pushNamed(context, RestaurantDetailPage.routeName,
                    arguments: restaurant.id);
              },
              trailing: isFavorited
                  ? IconButton(
                      icon: const Icon(Icons.favorite),
                      color: Colors.red,
                      onPressed: () => provider.removeFavorite(restaurant.id),
                    )
                  : IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.red,
                      onPressed: () => provider.addFavorite(restaurant)),
            ),
          );
        },
      );
    });
  }
}
