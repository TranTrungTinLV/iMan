import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyTextFeild_1 extends StatefulWidget {
  bool isSelected = false;
  @override
  State<MyTextFeild_1> createState() => _MyTextFeild_1State();
}

class _MyTextFeild_1State extends State<MyTextFeild_1> {
  String token = '';

  List _list = [];
  String _selected = ' ';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCred();
  }

  // get token
  Future<String> getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("login")!;
  }

  //http post
  Future<List<dynamic>> fetchData(String token) async {
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
      return result;
    } else {
      throw Exception('Failed to load data');
    }
  }

  void getCred() async {
    final token = await getToken();
    final result = await fetchData(token);
    setState(() {
      _list = result;
      _selected = _list.isNotEmpty ? convertlistString(_list).first : '';
    });
  }

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.only(left: 14),
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromRGBO(217, 217, 217, 1), width: 1),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButton(
          isExpanded: true,
          underline: const SizedBox(),
          value: _selected,
          items: convertlistString(_list).map((e) {
            return DropdownMenuItem(
              child: new Text(e),
              value: e.toString(),
            );
          }).toList(),
          onChanged: (String? val) {
            setState(() {
              _selected = val as String;
              // getCred();
            });
            print(val);
          },
          icon: Container(
            width: 40,
            height: 48,
            color: Colors.teal,
            child: const Icon(
              Icons.keyboard_arrow_down,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  List<String> convertlistString(List<dynamic> listValue) {
    List<String> newList = [];

    for (var item in listValue) {
      newList.add(item['equipmentName']);
    }
    return newList;
  }
}
