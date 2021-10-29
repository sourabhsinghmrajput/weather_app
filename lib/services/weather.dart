import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';

//3. Takes location and passes it to network class and gets wheather data from it.

const apikey = '4f3bb31f297ca5c80becfac70433cdac';
const openweatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentPostitionData();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openweatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var whetherdata = await networkHelper.getData();

    return whetherdata;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        url:
            '$openweatherMapUrl?q=${cityName.toString()}=&appid=$apikey&units=metric');
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
