import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EquipmentViewModel {
  String selected = '';
  List<dynamic> list = [];

  Future<void> getCred() async {
    final token = await getToken();
    final result = await fetchData(token);
    list = result;
    selected = list.isNotEmpty ? convertListString().first : '';
  }

  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString('login')!;
  }

  Future<List<dynamic>> fetchData(String token) async {
    final body = {
      'pageNumber': 0,
      'pageSize': 0,
      'orderBy': '',
      'isDropdown': true,
      'searchValue': '',
      'searchText': '',
      'searchCategory': '',
      'searchCategoryName': '',
      'searchEmployee': '',
      'searchEmployeeName': ''
    };

    final response = await http.post(
      Uri.parse('http://14.161.18.75:5105/equipment/allEquipment'),
      headers: {
        'Content-Type': 'application/json',
        'accept': '*/*',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data'] as Map;
      final result = data['data'] as List;
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  List<String> convertListString() {
    List<String> newList = [];

    for (var item in list) {
      newList.add(item['equipmentName']);
    }
    return newList;
  }
}
