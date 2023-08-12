import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:restaurant_app/data/api/api_service.dart';
import 'package:restaurant_app/data/model/get_list_restaurant_result.dart';

import 'restaurant_result_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test('Verify JSON Parsing', () async {
    final client = MockClient();
    var response =
        '{"error": false, "message": "success", "count": 20, "restaurants": []}';
    when(client.get(Uri.parse("${ApiService.baseUrl}/list")))
        .thenAnswer((_) async => http.Response(response, 200));
    expect(await ApiService(client: client).getListRestaurant(),
        isA<GetListRestaurantResult>());
  });
}
