import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/provider/get_detail_restaurant_provider.dart';

import '../utils/result_state.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final String id;

  const RestaurantDetailPage({super.key, required this.id});

  final _baseUrl = 'https://restaurant-api.dicoding.dev/images/large';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GetDetailRestaurantProvider>(
      create: (context) =>
          GetDetailRestaurantProvider(apiService: ApiService(), id: id),
      child: Consumer<GetDetailRestaurantProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Material(
              child: Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              )),
            );
          } else if (state.state == ResultState.hasData) {
            var restaurant = state.result.restaurant;
            return Scaffold(
              appBar: AppBar(
                title: Text(restaurant.name),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Hero(
                        tag: restaurant.pictureId,
                        child:
                            Image.network('$_baseUrl/${restaurant.pictureId}')),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Row(children: [
                                const Icon(
                                  Icons.location_pin,
                                  color: Colors.red,
                                  size: 15,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                    '${restaurant.address}, ${restaurant.city}')
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
                              ),
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Categories',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: restaurant.categories.length,
                              itemBuilder: (_, index) {
                                return Align(
                                  alignment: Alignment.center,
                                  child:
                                      Text(restaurant.categories[index].name),
                                );
                              }),
                          const Divider(color: Colors.grey),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Description',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(restaurant.description),
                          const Divider(
                            color: Colors.grey,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Menu',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('Foods:'),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: restaurant.menus.foods.length,
                                      itemBuilder: (_, index) {
                                        return Align(
                                          alignment: Alignment.center,
                                          child: Text(restaurant
                                              .menus.foods[index].name),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                children: [
                                  const Text('Drinks:'),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: restaurant.menus.drinks.length,
                                    itemBuilder: (_, index) {
                                      return Align(
                                        alignment: Alignment.center,
                                        child: Text(restaurant
                                            .menus.drinks[index].name),
                                      );
                                    },
                                  ),
                                ],
                              ))
                            ],
                          ),
                          const Divider(color: Colors.grey),
                          const SizedBox(
                            height: 10,
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Customer Review',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: restaurant.customerReviews.length,
                            itemBuilder: (_, index) {
                              return Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                        restaurant.customerReviews[index].name),
                                    Text(
                                        restaurant.customerReviews[index].date),
                                    Text(restaurant
                                        .customerReviews[index].review),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state.state == ResultState.noData) {
            return const Material(
                child: Center(child: Text('Gagal memuat data!')));
          } else if (state.state == ResultState.error) {
            return const Material(
                child: Center(child: Text('Gagal memuat data!')));
          } else {
            return const Material(child: Text(''));
          }
        },
      ),
    );
  }
}
