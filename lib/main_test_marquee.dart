import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: ThemeData.dark(),
        home: const MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 15),
          SizedBox(
            height: 70,
            child: Card(
              color: Colors.teal,
              child: Marquee(
                text: 'Hello Abdullah',
                blankSpace: 200,
                scrollAxis: Axis.horizontal,
                pauseAfterRound: const Duration(seconds: 3),
                accelerationDuration: const Duration(microseconds: 500),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 70,
            child: Card(
              color: Colors.teal,
              child: Marquee(
                text: 'Hello Abdullah',
                blankSpace: 50,
                scrollAxis: Axis.vertical,
                pauseAfterRound: const Duration(seconds: 1),
                accelerationDuration: const Duration(microseconds: 50),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.amber,
      title: const Text(
        'Flutter Home Page',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }
}
