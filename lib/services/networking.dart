import 'package:http/http.dart' as http;
import 'dart:convert';

//2.Fetches and Returns api data.

class NetworkHelper {
  NetworkHelper({this.url});

  final url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode <= 200) {
      String data = response.body;
      return jsonDecode(data);

      // print(latitude);
      // print(longitude);
      // print(whethertype);
    } else {
      print(response.statusCode);
    }
  }
}
