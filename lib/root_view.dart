import 'dart:math' as math;

import 'package:flutter/material.dart';

///Root of application
class RootView extends StatelessWidget {
  ///constructor for MaterialApp
  const RootView({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Solid Software Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

///View for displaying random color generator
class MyHomePage extends StatefulWidget {
  ///constructor for view
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Colors.white;
  double opacity = 1.0;
  final random = math.Random();
  int baseOption = 0xFFFFFF;

  ///function to update color to a random color
  void _randomColor() {
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);
    setState(() {
      color = Color.fromRGBO(red, green, blue, opacity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Color Generator'),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: _randomColor,
        child: Container(
          height: double.infinity,
          alignment: Alignment.center,
          width: double.infinity,
          color: color,
          child: const Text('Hello there'),
        ),
      ),
    );
  }
}
