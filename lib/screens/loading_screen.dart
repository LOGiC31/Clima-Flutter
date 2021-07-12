import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

WeatherModel wm=WeatherModel();
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

 @override
  void initState() {
   getLocationData();
   super.initState();
  }

  void getLocationData() async {
   var weatherdata=await wm.getLocationWeather();
  Navigator.push(context, MaterialPageRoute(builder: (context){
    return LocationScreen(locationWeather: weatherdata);
  }));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SpinKitDoubleBounce(
        color: Colors.blueGrey,
        size: 80.0,
      ),
    );
  }
}
