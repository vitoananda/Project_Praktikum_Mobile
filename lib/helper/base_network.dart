import 'package:http/http.dart' as http;
import 'dart:convert';

class BaseNetwork{
  static final String baseUrl = 'https://mcuapi.herokuapp.com/api/v1';

  static Future<Map<String, dynamic>> get(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    final response = await http.get(Uri.parse(fullUrl));
    return _processResponse(response);
  }

  static Future<Map<String, dynamic>> _processResponse(http.Response response) async{
    final body = response.body;
    if (body.isNotEmpty){
      final jsonBody = json.decode(body);
      return jsonBody;
    }
    else {
      print("Process Response Error!");
      return {
        "error" : true
      };
    }
  }

  static Future<List<dynamic>> getList(String partUrl) async {
    final String fullUrl = baseUrl + "/" + partUrl;
    final response = await http.get(Uri.parse(fullUrl));
    return _processResponseList(response);
  }

  static Future<List<dynamic>> _processResponseList(http.Response response) async{
    final body = response.body;
    if (body.isNotEmpty){
      final jsonBody = json.decode(body);
      return jsonBody;
    }
    else {
      print("Process Response Error!");
      return [];
    }
  }
}