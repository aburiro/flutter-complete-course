import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get count => _count;

  CounterProvider() {
    loadCounter();
  }

  void increment() {
    _count++;
    saveCounter();
    notifyListeners();
  }

  void decrement() {
    _count--;
    saveCounter();
    notifyListeners();
  }

  Future<void> loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    _count = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  Future<void> saveCounter() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', _count);
  }
}
