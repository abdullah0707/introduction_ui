import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';

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
          children: [
            alertToast(context),
            alertDialog(context),
            alertSnackBar(context),
            alertFlushBar(context)
          ],
        ),
      ),
    );
  }

  FloatingActionButton alertToast(BuildContext context) => FloatingActionButton(
        onPressed: () => showToast(
          'Hello Abdullah',
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.bottom,
          animDuration: const Duration(seconds: 1),
          duration: const Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        ),
        tooltip: 'Home',
        child: const Icon(Icons.home),
      );

  TextButton alertFlushBar(BuildContext context) => TextButton(
      onPressed: () => Flushbar(
            duration: const Duration(seconds: 3),
            forwardAnimationCurve: Curves.decelerate,
            reverseAnimationCurve: Curves.easeOut,
            flushbarPosition: FlushbarPosition.TOP,
            title: "Oops, No Internet Connection",
            message: "Make sure wifi or cellular data",
            mainButton: CloseButton(
              onPressed: () => Navigator.of(context).pop(),
            ),
            icon: const Icon(Icons.info),
          )..show(context),
      child: const Text('Flush Bar'));

  TextButton alertDialog(BuildContext context) => TextButton(
      onPressed: () {
        final alert = AlertDialog(
          title: Row(
            children: [
              const Text('Title Alert Dialog'),
              const SizedBox(width: 65),
              CloseButton(
                color: Colors.white,
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
          content: const SizedBox(
            height: 150,
            child: Column(
              children: [
                Divider(
                  color: Colors.white,
                ),
                SizedBox(height: 25),
                Text('Content Alert Dialog'),
                SizedBox(height: 25),
              ],
            ),
          ),
        );
        showDialog(
          context: context,
          builder: (context) => alert,
          barrierDismissible: false,
        );
      },
      child: const Text('Click Me !'));

  FilledButton alertSnackBar(BuildContext context) => FilledButton(
        onPressed: () {
          setState(() => changeTitle = 'Hello User');
          final sBar = SnackBar(
            content: const Text('SnackBar Text'),
            duration: const Duration(seconds: 7),
            action: SnackBarAction(
              label: 'Undo!',
              onPressed: () => setState(
                () => changeTitle = 'Flutter Home Page',
              ),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(sBar);
        },
        child: const Text('SnackBar'),
      );
}
