import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Data with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errormessage = '';
  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errormessage;
  Future<void> get fetchdata async {
    final response =
        await http.get(Uri.parse('https://programmertest.district91.com/api/products'));
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errormessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errormessage = 'Error:Unknown Error';
      _map = {};
    }
    notifyListeners();
  }

 
}
