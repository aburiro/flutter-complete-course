import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import provider package for state management
import 'counterprovider.dart'; // Import our custom CounterProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // Wrap the app with ChangeNotifierProvider to provide CounterProvider to the widget tree
      create: (context) => CounterProvider(), // Create an instance of CounterProvider
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple), // Fixed: Added ColorScheme before .fromSeed
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget { // Changed to StatelessWidget since we're using Provider for state
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center( // Center widget to center the content
        child: Consumer<CounterProvider>( // Use Consumer to listen to CounterProvider changes
          builder: (context, counterProvider, child) {
            return Column( // Column to arrange children vertically
              mainAxisAlignment: MainAxisAlignment.center, // Center the children vertically
              children: [
                const Text('You have pushed the button this many times:'),
                Text(
                  '${counterProvider.counter}', // Access counter from provider
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Access the provider and call increment method
          Provider.of<CounterProvider>(context, listen: false).increment();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
