import 'dart:convert';

import 'package:e_commerce_app/model/model.dart';
import 'package:http/http.dart' as http;

class ApiClass {
 Future<List<ModelClass>> getData() async {
    
    try {
      final response =
        await http.get(Uri.parse('https://api.restful-api.dev/objects'));
      if (response.statusCode == 200) {
        final List<dynamic> parsedData = jsonDecode(response.body);
        final List<ModelClass> data =
            parsedData.map((e) => ModelClass.fromJson(e)).toList();
        return data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
