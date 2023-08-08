import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/search_restaurant_result.dart';

enum ResultState { loading, noData, hasData, error }

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String query;

  SearchRestaurantProvider({required this.apiService, required this.query}) {
    _fetchAllQueriedRestaurant();
  }

  late SearchRestaurantResult _restaurantQueriedResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  SearchRestaurantResult get result => _restaurantQueriedResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllQueriedRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.searchRestaurant(query);
      if (response.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantQueriedResult = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
