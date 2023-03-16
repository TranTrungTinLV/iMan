
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Networking {
  Future<Response> login(User user) async {
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
      return Response.fromJson(responseData);
    } else {
      throw Exception('Failed login');
    }
  }
}
