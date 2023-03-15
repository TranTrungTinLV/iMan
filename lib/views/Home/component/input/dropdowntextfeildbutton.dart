import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iman/core/models/user.dart';
import 'package:iman/core/services/equipment_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class MyTextFeild_1 extends StatefulWidget {
  bool isSelected = false;

  @override
  State<MyTextFeild_1> createState() => _MyTextFeild_1State();
}

class _MyTextFeild_1State extends State<MyTextFeild_1> {
  String token = '';
  List<Equipment> _list = [];
  String _selected = ' ';
  EquipServices equipServices = EquipServices();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCred();
  }

  void getCred() async {
    final token = await equipServices.getToken();
    final result = await equipServices.fetchData(token);
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

  List<String> convertlistString(List<Equipment> listValue) {
    List<String> newList = [];

    for (var item in listValue) {
      return listValue.map((e) => e.name).toList();
    }
    return newList;
  }
}
