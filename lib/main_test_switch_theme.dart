import 'package:flutter/material.dart';

void main() => runApp(const MyHomePaga());

class MyHomePaga extends StatefulWidget {
  const MyHomePaga({super.key});

  @override
  State<MyHomePaga> createState() => _MyHomePagaState();
}

class _MyHomePagaState extends State<MyHomePaga> {
  bool swithBoolTheme = false;
  ThemeMode moodTheme = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal, canvasColor: Colors.white),
      themeMode: moodTheme,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: buildAppBar(),
        body: buildSwitchTheme(),
      ),
    );
  }

  Center buildSwitchTheme() {
    return Center(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.all(40),
          child: Text('Dark Theme'),
        ),
        Switch(
          value: swithBoolTheme,
          activeColor: Colors.teal,
          inactiveTrackColor: Colors.amber,
          onChanged: (value) {
            setState(() {
              swithBoolTheme = value;
              moodTheme == ThemeMode.dark
                  ? moodTheme = ThemeMode.light
                  : moodTheme = ThemeMode.dark;
            });
          },
        ),
        const Padding(
          padding: EdgeInsets.all(40),
          child: Text('Light Theme'),
        ),
      ]),
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
