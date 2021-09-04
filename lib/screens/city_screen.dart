import 'package:clima_app/utils/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;

  @override
  Widget build(BuildContext context) {
    // var kdwidth = MediaQuery.of(context).size.width;
    // var kdheight = MediaQuery.of(context).size.height;

    // double kdfontsize = kdheight * 0.025;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // Image(
            //   image: AssetImage('images/l2.jpg'),
            //   fit: BoxFit.fitHeight,
            // ),
            // Container(
            //   color: Colors.black.withOpacity(0.4),
            // ),
            Column(
              children: [
                Container(
                  color: Colors.black.withOpacity(0.8),
                  // height: kdheight * 0.08,
                  // width: kdwidth,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, '/loadingscreen');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    style: TextStyle(color: Colors.black),
                    decoration: kTextFieldInputStyle,
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text(
                    'Get Weather',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
