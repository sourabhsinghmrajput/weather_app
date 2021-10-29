import 'package:geolocator/geolocator.dart';

//1. Gives Location only with latitude and longitude.

class Location {
  var longitude;
  var latitude;

  Future<void> getCurrentPostitionData() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
