import 'dart:math' as math;
import 'package:flutter/material.dart';

///Root of application
class RootView extends StatelessWidget {
  ///constructor for MaterialApp
  const RootView({super.key});

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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isRotated = false;
  Color color = Colors.white;
  final double opacity = 1.0;
  final random = math.Random();

  ///function to update color to a random color
  void _randomColor() {
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);

    setState(() {
      color = Color.fromRGBO(red, green, blue, opacity);
    });
    _animateTextRotation();
  }

  void _animateTextRotation() {
    if (_isRotated) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
    _isRotated = !_isRotated;
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

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
          child: RotationTransition(
            turns: _animation,
            child: const Text('Hello there'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
