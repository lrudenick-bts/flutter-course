import 'package:flutter/material.dart';
import 'package:hello_world_app/presentation/screens/counters/counter_functions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue
        ),
        debugShowCheckedModeBanner: false, 
        home: const CounterFunctionsScreen()
    );
  }
}
