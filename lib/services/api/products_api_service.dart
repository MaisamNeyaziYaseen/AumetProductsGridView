import 'dart:convert';

import 'package:http/http.dart' as http;

class ProductsApiService {
  final String _url = "https://api.slingacademy.com/v1/sample-data/";
  final String _endpoint = "products/";

  Future<Map<String, dynamic>> getAllProducts(
      int offset, int limit, Function(Exception e) onException) async {
    Uri uri = Uri.parse("$_url$_endpoint?offset=$offset&limit=$limit");
    Map<String, dynamic> data = {};

    try {
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        data = json.decode(response.body);
      }
    } on Exception catch (e) {
      onException(e);
    }

    return data;
  }
}
