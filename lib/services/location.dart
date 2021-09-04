import 'package:geolocator/geolocator.dart';

const apikey = '4f3bb31f297ca5c80becfac70433cdac';

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
