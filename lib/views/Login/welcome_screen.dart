import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iman/views/Home/homepage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/models/user.dart';

class Welcome_Screen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _Welcome_ScreenState createState() => _Welcome_ScreenState();
}

class _Welcome_ScreenState extends State<Welcome_Screen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Response? _response;
  String? _token;
  void login(User user) async {
    try {
      final body = user.toJson();
      final response = await http.post(
          Uri.parse('http://14.161.18.75:5105/auth/login'),
          body: jsonEncode(body),
          headers: {
            'Content-Type': 'application/json',
            'accept': '*/*',
          });
      final responseData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        setState(() {
          _response = Response.fromJson(responseData);
        });
        print(response.body);
        print('Sucessfully');
        pageRoute(responseData['data']['token']);
      } else {
        print('Error');
      }
    } catch (e) {
      print(e);
    }
  }

  void pageRoute(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    setState(() {
      Navigator.pushNamed(context, HomePage.id);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 100.0,
                child: Image.asset('image/logo.png'),
              ),
              const SizedBox(
                height: 40.0,
              ),
              const Center(
                child: Text(
                  'IMAN',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 55,
                      shadows: <Shadow>[
                        Shadow(
                          offset: Offset(0, 4.0),
                          blurRadius: 3.0,
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                        ),
                        Shadow(
                          offset: Offset(4.0, 0.0),
                          blurRadius: 3.0,
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                        ),
                      ]),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: emailController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                    hintText: 'service@vndigitech.com',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ))),
              ),
              const SizedBox(
                height: 35,
              ),
              TextField(
                controller: passwordController,
                onChanged: (newValue) {},
                decoration: const InputDecoration(
                    hintText: '******',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ))),
              ),
              const SizedBox(
                height: 40,
              ),
              Material(
                child: MaterialButton(
                  elevation: 4,
                  color: const Color.fromRGBO(238, 99, 44, 1),
                  minWidth: 400.0,
                  height: 40.0,
                  onPressed: () {
                    final logins = User(
                      email: emailController.text.toString(),
                      password: passwordController.text.toString(),
                    );
                    login(logins);
                  },
                  child: const Text(
                    'Đăng Nhập',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 17),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                  child: InkWell(
                onTap: () {},
                child: const Text('Quên Mật Khẩu ?',
                    style: TextStyle(color: Color.fromRGBO(2, 153, 155, 1))),
              ))
            ]),
      ),
    );
  }
}
