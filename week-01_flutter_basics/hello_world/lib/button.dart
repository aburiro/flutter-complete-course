import 'package:flutter/material.dart';
import "navigation_screen.dart";

class Mybutton extends StatelessWidget {
  const Mybutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Button')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NavigationScreen()),
            );
          },
          child: const Text('Go to Navigation Screen'),
        ),
      ),
    );
  }
}
