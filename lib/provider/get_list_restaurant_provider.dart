import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/get_list_restaurant_result.dart';

enum ResultState { loading, noData, hasData, error }

class GetListRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  GetListRestaurantProvider({required this.apiService}) {
    _fetchAllRestaurant();
  }

  late GetListRestaurantResult _restaurantsResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  GetListRestaurantResult get result => _restaurantsResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getListRestaurant();
      if (response.restaurants.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _restaurantsResult = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}
