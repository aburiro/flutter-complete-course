import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FutureBuilder Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'FutureBuilder Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Simulate API / Database call
  Future<int> fetchCounterFromServer() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate network delay
    return 10; // pretend this value comes from API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),

      body: Center(
        child: FutureBuilder<int>(
          future: fetchCounterFromServer(),
          builder: (context, snapshot) {
            // 1️⃣ Loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            // 2️⃣ Error state
            if (snapshot.hasError) {
              return const Text(
                'Something went wrong!',
                style: TextStyle(fontSize: 18, color: Colors.red),
              );
            }

            // 3️⃣ Data received
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Counter from Server',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 10),
                Text(
                  snapshot.data.toString(),
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
