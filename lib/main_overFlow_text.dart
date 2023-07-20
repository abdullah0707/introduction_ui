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
  String changeTitle = 'Flutter Home Page';
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          changeTitle,
          style: const TextStyle(
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SelectableText(
                'Hello Abdullah in The App Test Text More and learn,Hello Abdullah in The App Test Text More and learn'),
            const SizedBox(height: 8),
            Container(
              width: 200,
              height: 40,
              color: Colors.amber,
              child: const Text(
                'Hello Abdullah in The App Test Text More and learn,Hello Abdullah in The App Test Text More and learn',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                overflow: TextOverflow.clip,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 200,
              height: 40,
              color: Colors.amber,
              child: const Text(
                'Hello Abdullah in The App Test Text More and learn,Hello Abdullah in The App Test Text More and learn',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 200,
              height: 40,
              color: Colors.amber,
              child: const Text(
                'Hello Abdullah in The App Test Text More and learn,Hello Abdullah in The App Test Text More and learn',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                overflow: TextOverflow.fade,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: 200,
              height: 40,
              color: Colors.amber,
              child: const Text(
                'Hello Abdullah in The App Test Text More and learn,Hello Abdullah in The App Test Text More and learn',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black),
                overflow: TextOverflow.visible,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
