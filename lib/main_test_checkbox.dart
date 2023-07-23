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
  bool javaScript = false;
  bool vue = false;
  bool flutter = false;

  String get titleSkills {
    String textSkill = 'You Selected:\n';
    javaScript ? textSkill += 'JavaScript\n' : '';
    vue ? textSkill += 'Vue\n' : '';
    flutter ? textSkill += 'Flutter' : '';
    !javaScript && !vue && !flutter ? textSkill += 'None' : '';
    return textSkill;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildCheckBox(context),
    );
  }

  ListView buildCheckBox(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 30),
        const Text(
          'Skills Programme',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 30),
        CheckboxListTile(
          value: javaScript,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.teal,
          onChanged: (val) => setState(() => javaScript = val!),
          title: const Text('JavaScript'),
        ),
        CheckboxListTile(
          value: vue,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.teal,
          onChanged: (val) => setState(() => vue = val!),
          title: const Text('Vue'),
        ),
        CheckboxListTile(
          value: flutter,
          controlAffinity: ListTileControlAffinity.leading,
          activeColor: Colors.teal,
          onChanged: (val) => setState(() => flutter = val!),
          title: const Text('Flutter'),
        ),
        FilledButton(
          onPressed: () {
            var alertDialog = AlertDialog(
                title: const Text('Thank You For Applying!'),
                content: Text(titleSkills));
            showDialog(context: context, builder: (context) => alertDialog);
          },
          child: const Text('Apply!'),
        ),
      ],
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
