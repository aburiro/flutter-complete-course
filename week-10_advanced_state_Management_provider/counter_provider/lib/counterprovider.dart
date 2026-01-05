import 'package:flutter/foundation.dart';

// CounterProvider class extends ChangeNotifier to manage state
// This is the core of Provider pattern: a class that holds the state and notifies listeners when it changes
class CounterProvider extends ChangeNotifier {
  // Private variable to hold the counter value
  int _counter = 0;

  // Getter to access the counter value from outside the class
  int get counter => _counter;

  // Method to increment the counter
  // This method updates the state and calls notifyListeners() to inform all listening widgets
  void increment() {
    _counter++;
    notifyListeners(); // This triggers a rebuild in all widgets that are listening to this provider
  }

  // Optional: Method to decrement or reset if needed for teaching purposes
  void decrement() {
    if (_counter > 0) {
      _counter--;
      notifyListeners();
    }
  }

  void reset() {
    _counter = 0;
    notifyListeners();
  }
}
