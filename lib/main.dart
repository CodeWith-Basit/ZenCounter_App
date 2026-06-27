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
      title: 'ZenCounter',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'ZenCounter'),
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
  int counter = 0;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void resetbutton() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0F0A1A),
      appBar: AppBar(
        backgroundColor: Color(0xff0F0A1A),
        leading: Icon(Icons.menu, color: Color(0xffc8bfff)),
        title: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: Color(0xffc8bfff),
              fontWeight: FontWeight.bold,
              fontSize: 45,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.settings, color: Color(0xffc8bfff)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          crossAxisAlignment: .center,
          children: [
            const Text(
              'CURRENT COUNT',
              style: TextStyle(
                color: Color(0xffc8bfff),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              counter?.toString() ?? '0',
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: const Color(0xFF9F8FFF).withAlpha(128),
                    blurRadius: 25,
                    spreadRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: Color(0xffc8c0ff),
                fontSize: 95,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ),

      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed: decrementCounter,
            shape: CircleBorder(),
            backgroundColor: Color(0xff1b1626),
            tooltip: 'decrement',
            child: const Icon(Icons.remove, color: Color(0xffc8c0ff), size: 25),
          ),
          SizedBox(width: 25),
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF9F8FFF).withAlpha(128),
                  blurRadius: 25,
                  spreadRadius: 4,
                  offset: const Offset(0, 4),
                ),
              ],
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFD4C9FF), 
                  Color(0xFFB5A7FF), 
                ],
              ),
            ),
            child: FloatingActionButton.large(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              backgroundColor: Colors.transparent,
              shape: CircleBorder(),
              elevation: 0,
              child: const Icon(Icons.add, size: 45, color: Color(0xff321b8e)),
            ),
          ),
          SizedBox(width: 25),
          FloatingActionButton(
            onPressed: resetbutton,
            shape: CircleBorder(),
            tooltip: 'Reset',
            backgroundColor: Color(0xff1b1626),
            child: const Icon(
              Icons.replay_rounded,
              size: 25,
              color: Color(0xffffb4ab),
            ),
          ),
          SizedBox(height: 350),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
