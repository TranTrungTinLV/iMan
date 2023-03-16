
import 'package:flutter/material.dart';
import 'package:iman/core/models/user.dart';
import 'package:iman/core/services/equipment_services.dart';

class MyTextFeild_1 extends StatefulWidget {
  bool isSelected = false;

  MyTextFeild_1({super.key});

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

  @override
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
              value: e.toString(),
              child: Text(e),
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
