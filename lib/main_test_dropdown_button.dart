import 'package:flutter/material.dart';

void main() => runApp(const DropdownButtonApp());

class DropdownButtonApp extends StatefulWidget {
  const DropdownButtonApp({super.key});

  @override
  State<DropdownButtonApp> createState() => _DropdownButtonAppState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class _DropdownButtonAppState extends State<DropdownButtonApp> {
  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.teal, canvasColor: Colors.white),
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: buildAppBar(),
        body: Center(
          child: buildDropDown(),
        ),
      ),
    );
  }

  DropdownButton<String> buildDropDown() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      elevation: 8,
      style: const TextStyle(
        color: Colors.amber,
        fontSize: 25,
      ),
      underline: Container(
        height: 1,
        color: Colors.white,
      ),
      onChanged: (value) => setState(() => dropdownValue = value!),
      items: list
          .map<DropdownMenuItem<String>>(
              (value) => DropdownMenuItem(value: value, child: Text(value)))
          .toList(),
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
