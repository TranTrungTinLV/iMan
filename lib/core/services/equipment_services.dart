import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user.dart';
import 'dart:convert';

class EquipServices {
  // get token
  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("login")!;
  }

  //http post
  Future<List<Equipment>> fetchData(String token) async {
    final body = {
      "pageNumber": 0,
      "pageSize": 0,
      "orderBy": "",
      "isDropdown": true,
      "searchValue": "",
      "searchText": "",
      "searchCategory": "",
      "searchCategoryName": "",
      "searchEmployee": "",
      "searchEmployeeName": ""
    };

    final response = await http.post(
        Uri.parse('http://14.161.18.75:5105/equipment/allEquipment'),
        headers: {
          'Content-Type': 'application/json',
          'accept': '*/*',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as Map;
      final result = data['data'] as List;
      return result.map((json) => Equipment.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
