import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = 'http://admin.brikow.com/api/contractor/';
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-Type': 'application/json',
        'Cookie':
            'token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzYmIwNjVlNWU3MjE4ZTc1ODIwMmY5MiIsImlhdCI6MTY3MzU5ODc5NSwiZXhwIjoxNjc2MTkwNzk1fQ.VkX2PnHMc3iSN_3Yaz_kCg4-0CYNFMjbshNkg-SJgF8',
        'Accept': 'application/json',
      };
}
