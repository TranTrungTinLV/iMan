import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iman/views/Home/component/camera/save_camera.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'component/camera/camera.dart';
import 'component/input/dropdowntextfeildbutton.dart';
import 'component/input/mytextfeild.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  static String id = 'home_page';
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getCred();
    // fetchEquipment();
  }

  Future getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() async {
      token = pref.getString("login")!;
      print('token nè ${token}');
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
      print('ác quỷ nè $token');
      final response = await http.post(
          Uri.parse('http://14.161.18.75:5105/equipment/allEquipment'),
          headers: {
            'Content-Type': 'application/json',
            'accept': '*/*',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode(body));
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body)['data'] as Map;
        final result = data['data'] as List;

        print(result);
        print('OK chưa');
      } else {
        print('Error');
      }
    });
  }

  fetchEquipment() async {}

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('Báo cáo sự cố thiết bị')),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Thiết bị:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 17.0,
          ),
          MyTextFeild_1(),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            'Mô tả sự cố công việc:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const MyTextFeild(),
          const SizedBox(height: 10.0),
          const Icon_camera(),
          const SizedBox(height: 20),
          const SizedBox(
            height: 35.0,
          ),
          const Save_camera(),
        ]),
      ),
    );
  }
}
