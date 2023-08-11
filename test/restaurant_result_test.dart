import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/restaurant_result.dart';
import 'package:restaurant_app/provider/get_list_restaurant_provider.dart';

void main() {
  var dummyRestaurant = {
    "id": "rqdv5juczeskfw1e867",
    "name": "Melting Pot",
    "description":
        "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. ...",
    "pictureId": "14",
    "city": "Medan",
    "rating": 4.2
  };

  test('Verify JSON Parsing', () async {
    GetListRestaurantProvider getListRestaurantProvider =
        GetListRestaurantProvider(apiService: ApiService());
    await getListRestaurantProvider.fetchAllRestaurant();
    var isValidParsed = getListRestaurantProvider.result.restaurants[0].id ==
        RestaurantResult.fromJson(dummyRestaurant).id;
    expect(isValidParsed, true);
  });
}
