import 'package:flutter/material.dart';

class AnimatedWidgetsExampleApp extends StatelessWidget {
  const AnimatedWidgetsExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedWidgetsExample();
  }
}

class AnimatedWidgetsExample extends StatefulWidget {
  @override
  _AnimatedWidgetsExampleState createState() => _AnimatedWidgetsExampleState();
}

class _AnimatedWidgetsExampleState extends State<AnimatedWidgetsExample>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiple Animations Example')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AnimatedContainer
            GestureDetector(
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                width: _isExpanded ? 200 : 100,
                height: _isExpanded ? 200 : 100,
                color: _isExpanded ? Colors.blue : Colors.red,
                curve: Curves.easeInOut,
                margin: const EdgeInsets.all(20),
              ),
            ),

            // Hero Animation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HeroSecondPage()),
                );
              },
              child: Hero(
                tag: 'hero-tag',
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                  margin: const EdgeInsets.all(20),
                ),
              ),
            ),

            // FadeTransition
            FadeTransition(
              opacity: _fadeAnimation,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.orange,
                margin: const EdgeInsets.all(20),
              ),
            ),

            // AnimationController
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _controller.value,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.purple,
                    margin: const EdgeInsets.all(20),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Hero Animation Second Page
class HeroSecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hero Animation - Page 2')),
      body: Center(
        child: Hero(
          tag: 'hero-tag',
          child: Container(
            width: 200,
            height: 200,
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
