import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  final ImagePicker picker = ImagePicker();
  File? pickedImage;
  fatchImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    setState(() {
      pickedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: pickedImage == null ? null : Image.file(pickedImage!),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fatchImage,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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
    );
  }
}
