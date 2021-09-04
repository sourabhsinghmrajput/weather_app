import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
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
    Location location = Location();
    await location.getCurrentPostitionData();

    NetworkHelper networkHelper = NetworkHelper(
        url:
            'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apikey&units=metric');

    var whetherdata = await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationWhetherData: whetherdata,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    getLocation();
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          duration: Duration(milliseconds: 500),
        ),
      ),
    );
  }
}
