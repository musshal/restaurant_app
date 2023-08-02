import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_app/ui/restaurant_detail_page.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

import '../data/model/local_restaurant.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  FutureBuilder<String> _buildList(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
      builder: (context, snapshot) {
        final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
        return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (context, index) {
              return _buildRestaurantItem(context, restaurants[index]
              );
            });
      },
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return Material(
      child: ListTile(
        leading: Hero(
          tag: restaurant.pictureId,
          child: Image.network(
            restaurant.pictureId,
            width: 100,
          ),
        ),
        contentPadding: const EdgeInsets
            .symmetric(horizontal: 16, vertical: 8),
        title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(restaurant.name)
        ),
        subtitle: Row(
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
            ]
        ),
        onTap: () {
          Navigator.pushNamed(
              context, RestaurantDetailPage.routeName, arguments: restaurant
          );
        },
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
      ),
      body: _buildList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Restaurant App'),
          transitionBetweenRoutes: false,
        ),
        child: _buildList(context)
    );
  }
}
