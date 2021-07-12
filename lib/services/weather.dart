import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';



const apiKey='87b573b82bec68f3895fed41ffd04795';

class WeatherModel {
  Future<dynamic> getCityWeather(String city) async{
    var url='https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric';
    Networkhelper net=Networkhelper(url:url);
    var weatherdata=await net.getData();
    return weatherdata;
  }
  Future<dynamic> getLocationWeather() async{
    Location loc = Location();
    await loc.getCurrentLocation();
    print('api key is called');
    Networkhelper net = Networkhelper(
        url: 'https://api.openweathermap.org/data/2.5/weather?lat=${loc.latitude}&lon=${loc.longitude}&appid=$apiKey&units=metric');
    var weatherdata = await net.getData();

    return weatherdata;

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
