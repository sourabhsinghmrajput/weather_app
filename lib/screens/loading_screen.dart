import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

const apikey = '4f3bb31f297ca5c80becfac70433cdac';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var whetherdata = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWhetherData: whetherdata,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.blue,
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
