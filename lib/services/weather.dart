import 'package:flutter/material.dart';

import 'location.dart';
import 'networking.dart';

const apiKey = 'ee5e6496b7fd6533b50d26fbb840ed7c';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherURL?lat=${location.latitude}&lon=${location.longitude}'
        '&appid=$apiKey&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }
}
