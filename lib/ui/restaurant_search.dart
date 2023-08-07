import 'package:flutter/material.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/search_restaurant_result.dart';
import 'package:restaurant_app/widgets/card_restaurant.dart';

class RestaurantSearch extends SearchDelegate {
  late final Future<SearchRestaurantResult> _restaurant =
      ApiService().searchRestaurant(query);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query:
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
    return FutureBuilder<SearchRestaurantResult>(
      future: _restaurant,
      builder: (context, AsyncSnapshot<SearchRestaurantResult> snapshot) {
        var state = snapshot.connectionState;
        if (state != ConnectionState.done) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.blue,
          ));
        } else {
          if (snapshot.hasData) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data?.restaurants.length,
                itemBuilder: (context, index) {
                  var restaurant = snapshot.data?.restaurants[index];
                  return CardRestaurant(restaurant: restaurant!);
                });
          } else if (snapshot.hasError) {
            return const Center(
              child: Material(child: Text('Gagal memuat data!')),
            );
          } else {
            return const Material(
              child: Text(''),
            );
          }
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text('Search restaurant'));
  }
}
