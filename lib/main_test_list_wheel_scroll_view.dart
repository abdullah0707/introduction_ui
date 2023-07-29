import 'package:flutter/material.dart';

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
  static const nameList = [
    'Jan',
    'Fab',
    'Mar',
    'Apr',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
    'This',
    'Comes',
    'To',
    'End',
  ];

  List colorList = List.generate(
    nameList.length,
    (index) => Colors.primaries[index],
  );

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: ListWheelScrollView(
          itemExtent: 100,
          children: nameList
              .map(
                (nameItem) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: colorList[i++],
                    borderRadius: BorderRadius.circular(10),
                    // border: Border.all(width: 1, color: Colors.white),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: Text(
                      nameItem,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
