import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';

class NetWorkHelper {
  NetWorkHelper(this.url);
  final String url;
  Future<dynamic> getData() async {
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
    final response =
        await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      'Content-Type': 'application/json',
      'accept': '*/*',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImRvYW52aW5oOTgzQGdtYWlsLmNvbSIsInJvbGUiOiJFTVBMT1lFRSIsImlhdCI6MTY3ODMzNzkxNCwiZXhwIjoxNjc4OTQyNzE0fQ.iVtLttN89PX9kRn__TXftQoy3lNIUDOsN7ZYmawK23w',
    });
    if (response.statusCode == 201) {
      print('OK');
    } else {
      print('Error');
    }
  }
}
