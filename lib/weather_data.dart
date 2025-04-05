import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherData {
  Future<Map<String, dynamic>> getWeather(String location) async {
    final String apiKey = 'c5f812a139664ed4b26184644240802';
    final String apiUrl = 'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$location';

    final response = await http.get(Uri.parse(apiUrl));

    print('Response Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      return responseBody;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}