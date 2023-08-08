import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/get_detail_restaurant_result.dart';

enum ResultState { loading, noData, hasData, error }

class GetDetailRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;
  final String id;

  GetDetailRestaurantProvider({required this.apiService, required this.id}) {
    _fetchDetailRestaurant(id);
  }

  late GetDetailRestaurantResult _detailRestaurantResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  GetDetailRestaurantResult get result => _detailRestaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchDetailRestaurant(id) async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final response = await apiService.getDetailRestaurant(id);
      if (response.error) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _detailRestaurantResult = response;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }
}
