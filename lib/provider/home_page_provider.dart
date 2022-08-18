import 'package:flutter_projects/provider/base_provider.dart';
import 'package:flutter_projects/services/weather.dart';

class HomePageProvider extends BaseProvider {
  WeatherModel weatherModel = WeatherModel();
  bool _light = true;

  int _counter = 0;
  String? _weather;

  String get weather => _weather ?? 'Press the icon to get your location';

  bool get light => _light;

  int get counter => _counter;

  void changeTheme() {
    _light = !_light;
    notifyListeners();
  }

  void getWeather() async {
    try {
      if (!loading) {
        setLoading = true;
      }
      var weather = await weatherModel.getLocationWeather();
      setLoading = false;
      notifyListeners();
      _weather =
          'Weather of  ${weather['sys']['country']}, ${weather['name']}: ${weather['main']['temp']} °C';
    } catch (_) {
      setLoading = false;
    }
  }

  void incrementCounter() {
    if (counter > 9) {
      return;
    }
    if (light) {
      _counter++;
    } else {
      _counter += 2;
    }
    if (counter > 10) {
      _counter = 10;
    }
    notifyListeners();
  }

  void decrementCounter() {
    if (counter < 1) {
      return;
    }
    if (light) {
      _counter--;
    } else {
      _counter -= 2;
    }
    if (counter < 0) {
      _counter = 0;
    }
    notifyListeners();
  }
}
