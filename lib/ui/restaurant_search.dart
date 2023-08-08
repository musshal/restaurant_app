import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/search_restaurant_provider.dart';
import 'package:restaurant_app/widgets/card_restaurant.dart';

class RestaurantSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            '';
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ChangeNotifierProvider<SearchRestaurantProvider>(
      create: (context) =>
          SearchRestaurantProvider(apiService: ApiService(), query: query),
      child: Consumer<SearchRestaurantProvider>(builder: (context, state, _) {
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
            child: Material(child: Text('Gagal memuat data!')),
          );
        } else {
          return const Material(
            child: Text(''),
          );
        }
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search restaurant'));
  }
}
