import 'package:flutter/material.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';

void main() => runApp(const MainSplashScreen());

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Dome',
      home: Scaffold(
        body: EasySplashScreen(
          logo: Image.network(
              'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
          title: const Text(
            "Title",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey.shade400,
          showLoader: true,
          loadingText: const Text("Loading..."),
          navigator: const MyApp(),
          durationInSeconds: 15,
          loaderColor: Colors.blue,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: buildAppBar(),
        body: const Text('Hello Abdullah'),
      ),
    );
  }
}

AppBar buildAppBar() => AppBar(
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
