import 'package:flutter/foundation.dart';
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
  final li = List.generate(20, (index) => 'Item Num ${index + 1}');

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: buildAppBar(),
        body: ListView.builder(
          itemCount: li.length,
          itemBuilder: (ctx, index) {
            final item = li[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              title: Dismissible(
                key: Key(item),
                // onDismissed: (dir) {
                //   setState(
                //     () => li.removeAt(index),
                //   );
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     SnackBar(
                //       content: Text(dir == DismissDirection.startToEnd
                //           ? '$item Deleted'
                //           : '$item Liked'),
                //       action: SnackBarAction(
                //         label: 'Undo',
                //         onPressed: () => setState(() => li.insert(index, item)),
                //       ),
                //     ),
                //   );
                // },
                confirmDismiss: (DismissDirection dir) async {
                  if (dir == DismissDirection.startToEnd) {
                    return await showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return AlertDialog(
                          title: const Text("Confirm"),
                          content: Text(
                              "Are you sure you wish to delete this $item?"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(false),
                              child: const Text("CANCEL",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() => li.removeAt(index));
                                  Navigator.of(ctx).pop(true);
                                },
                                child: const Text(
                                  "DELETE",
                                  style: TextStyle(color: Colors.red),
                                )),
                          ],
                        );
                      },
                    );
                  } else {
                    setState(() => li.removeAt(index));
                    return false;
                  }
                },
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.red[800],
                  alignment: Alignment.centerLeft,
                  child: const Icon(Icons.delete, size: 30),
                ),
                secondaryBackground: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.green[800],
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.thumb_up, size: 30),
                ),
                child: Center(
                  heightFactor: 2.5,
                  widthFactor: double.infinity,
                  child: Text(item),
                ),
              ),
            );
          },
        ),
      );

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
