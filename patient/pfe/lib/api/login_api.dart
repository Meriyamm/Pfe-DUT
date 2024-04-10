import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _url = 'http://192.168.179.87:8000/api/';
  // final String _url = 'http://192.168.1.109:8000/api/';
  var token;
  /*final String _imgUrl='http://mark.dbestech.com/uploads/';
  getImage(){
    return _imgUrl;
  }*/
  getUrl(myurl) {
    return _url + myurl;
  }

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  addData(apiUrl, data, headers) async {
    var fullUrl = _url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: headers);
  }

  getData2(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }

  _getToken2() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.get('token');
    return '$token';
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
  setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': "Bearer " + _getToken2(),
      };

  getArticles(apiUrl) async {}
  getPublicData(apiUrl) async {}
}
