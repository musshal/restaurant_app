import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/get_list_restaurant_provider.dart';
import 'package:restaurant_app/ui/restaurant_search.dart';
import 'package:restaurant_app/widgets/card_restaurant.dart';
import 'package:restaurant_app/widgets/platform_widget.dart';

import '../utils/result_state.dart';

class RestaurantListPage extends StatefulWidget {
  const RestaurantListPage({super.key});

  @override
  State<RestaurantListPage> createState() => _RestaurantListPageState();
}

class _RestaurantListPageState extends State<RestaurantListPage> {
  Widget _buildList(BuildContext context) {
    return Consumer<GetListRestaurantProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        } else if (state.state == ResultState.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = state.result.restaurants[index];
                return CardRestaurant(restaurant: restaurant);
              });
        } else if (state.state == ResultState.noData) {
          return const Center(
            child: Material(child: Text('Gagal memuat data!')),
          );
        } else if (state.state == ResultState.error) {
          return const Center(
            child: Material(
              child: Text('Gagal memuat data!'),
            ),
          );
        } else {
          return const Center(
            child: Material(
              child: Text(''),
            ),
          );
        }
      },
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant App'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: RestaurantSearch());
            },
            icon: const Icon(Icons.search),
          )
        ],
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
        child: _buildList(context));
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }
}
