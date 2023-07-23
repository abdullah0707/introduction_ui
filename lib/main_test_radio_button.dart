import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

dynamic moodTheme = ThemeMode.dark;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) => const MyHomePage();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _radioValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _radioValue == 0 ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: buildAppBar(),
        body: ListView(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Theme Mood',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            buildRadioListTile(0, 'Black', 'Change Bg To Dark Mood'),
            buildRadioListTile(1, 'Light', 'Change Bg To Light Mood'),
          ],
        ),
      ),
    );
  }

  RadioListTile<int> buildRadioListTile(
      int currentValue, titleText, subTitleText) {
    return RadioListTile(
      value: currentValue,
      groupValue: _radioValue,
      activeColor: Colors.amber,
      controlAffinity: ListTileControlAffinity.trailing,
      title: Text(
        titleText,
        style: const TextStyle(fontSize: 20),
      ),
      subtitle: Text(
        subTitleText,
        style: const TextStyle(fontSize: 15),
      ),
      onChanged: (value) => setState(
        () {
          _radioValue = value!;
          currentValue == 0
              ? moodTheme = ThemeMode.dark
              : moodTheme = ThemeMode.light;
        },
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
      leading: const Padding(
        padding: EdgeInsets.only(left: 1),
        child: Row(
          children: [
            IconButton(
              onPressed: null,
              icon: Icon(
                Icons.account_circle,
                color: Colors.black87,
                size: 32,
              ),
            ),
            Expanded(
              child: IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.black87,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: const [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.account_circle,
            color: Colors.black87,
            size: 32,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.account_circle,
            color: Colors.black87,
            size: 32,
          ),
        ),
      ],
    );
  }
}
