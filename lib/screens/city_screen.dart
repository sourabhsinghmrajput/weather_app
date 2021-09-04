import 'package:flutter/material.dart';

class CityScreen extends StatelessWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var kdwidth = MediaQuery.of(context).size.width;
    var kdheight = MediaQuery.of(context).size.height;

   // double kdfontsize = kdheight * 0.025;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage('images/l2.jpg'),
              fit: BoxFit.fitHeight,
            ),
            Container(
              color: Colors.black.withOpacity(0.4),
            ),
            Column(
              children: [
                Container(
                  color: Colors.black.withOpacity(0.8),
                  height: kdheight * 0.08,
                  width: kdwidth,
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, '/loadingscreen');
                    },
                  ),
                ),
                TextField(
                  decoration: InputDecoration(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
