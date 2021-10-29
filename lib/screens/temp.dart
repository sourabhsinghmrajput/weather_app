import 'package:clima_app/screens/city_screen.dart';
import 'package:clima_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWhetherData});
  final locationWhetherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  double? temperature;
  int condition = 1000;
  String? weatherMessage;
  String? weatherIcon;
  String? cityName;
  late int absolutetemp;

  @override
  void initState() {
    super.initState();
    updateUi(widget.locationWhetherData);
  }

  void updateUi(dynamic whetherData) {
    setState(() {
      if (whetherData == null) {
        temperature = 0;
        weatherIcon = 'Error';
        weatherMessage = 'Unable to get weather data';
        cityName = '';
      }
      temperature = whetherData['main']['temp'];
      absolutetemp = temperature!.round();
      weatherMessage = weather.getMessage(absolutetemp);
      condition = whetherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = whetherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedcityName = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      print(typedcityName);
                      if (typedcityName != null) {
                        var weatherData =
                            await weather.getCityWeather(typedcityName);
                        updateUi(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30, left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '$absolutetemp \u2103', //'$absolutetemp \u2103' for deggrree celcius sign,
                              style: kTempTextStyle,
                            ),
                            // Text(
                            //   '$weatherIcon',
                            //   style: kConditionTextStyle,
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                      child: Text(
                        "$cityName",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
