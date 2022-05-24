import 'dart:convert';

import 'package:carplate/utils/debug.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class HttpClients extends ChangeNotifier {
  static bool isLoggedIn = false;
  static final storage = new FlutterSecureStorage();
  static final String baseURL = isDebugMode()
      ? 'http://127.0.0.1:8000/api/'
      : 'http://127.0.0.1:8000/api/';
  // Future<void> getData() async {
  //   var res = await http.get('');
  //   print(res.body);
  // }
  HttpClients() {
    _checkLoginStatus();
  }

  Future<bool> _checkLoginStatus() async {
    try {
      isLoggedIn = await storage.read(key: 'is_loggedin') == true.toString();
      return Future.value(isLoggedIn);
    } catch (err) {
      return Future.error(err);
    }
  }

  Future<bool> checkLogin() async {
    if (!isLoggedIn) {
      return await _checkLoginStatus();
    }
    await Future.delayed(Duration(seconds: 1));
    return Future.value(isLoggedIn);
  }

  Future<dynamic> login(String emailId, String password) async {
    var headers = {
      'Content-type': 'application/json',
    };
    var data = {"emailid": emailId, "password": password};
    Uri uri = Uri.parse(baseURL + 'login/');
    var res = await http.post(uri, body: json.encode(data), headers: headers);

    print(res.body);
    var respData = json.decode(utf8.decode(res.bodyBytes));
    dynamic datas = respData;

    if (datas["status"] == true) {
      await storage.write(
        key: 'is_loggedin',
        value: true.toString(),
      );
      await storage.write(
        key: 'token_access',
        value: datas["token"]["access"],
      );
      await storage.write(
        key: 'refresh_token',
        value: datas["token"]["refresh"],
      );
    }
    return Future.value(datas);
  }

  
}
