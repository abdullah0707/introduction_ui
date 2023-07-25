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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ExpansionTile(
              leading: const Icon(Icons.perm_identity),
              title: const Text('Account'),
              textColor: Colors.amber,
              iconColor: Colors.amber,
              children: [
                const Divider(color: Colors.amber),
                ListTile(
                  leading: const Icon(Icons.add),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text('Sing Up!'),
                  subtitle: const Text('Where You Can Register An Account'),
                  onTap: buildSnackBar,
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text('Sing In!'),
                  subtitle: const Text('Where You Can Log In An Account'),
                  onTap: buildSnackBar,
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ExpansionTile(
              leading: const Icon(Icons.contact_phone_outlined),
              title: const Text('More Info'),
              textColor: Colors.amber,
              iconColor: Colors.amber,
              children: [
                const Divider(color: Colors.amber),
                ListTile(
                  leading: const Icon(Icons.phone),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  title: const Text('Contact'),
                  subtitle: const Text('Where You Can Call Us'),
                  onTap: buildSnackBar,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void buildSnackBar() {
    final sBar = SnackBar(
      content: const Text('SnackBar Text'),
      duration: const Duration(seconds: 7),
      action: SnackBarAction(
        label: 'Undo!',
        onPressed: () => print('Done'),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(sBar);
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
