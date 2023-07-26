import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
  Color currentColor = Colors.teal;

  void changeColor(Color color) => setState(() {
        currentColor = color;
        Navigator.pop(context);
      });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: buildAppBar(),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Select a Color!'),
                          CloseButton(
                            onPressed: () => Navigator.pop(ctx),
                          )
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SingleChildScrollView(
                            child: ColorPicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                              colorPickerWidth: 300.0,
                              pickerAreaHeightPercent: 0.7,
                              enableAlpha: true,
                              displayThumbColor: true,
                              paletteType: PaletteType.hsl,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(currentColor),
                  ),
                  child: Text(
                    'Change Color!',
                    style: TextStyle(
                      color: useWhiteForeground(currentColor)
                          ? const Color(0xffffffff)
                          : const Color(0xff000000),
                    ),
                  ),
                ),
                FilledButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Select a Color!'),
                          CloseButton(
                            onPressed: () => Navigator.pop(ctx),
                          )
                        ],
                      ),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SingleChildScrollView(
                            child: SlidePicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                              enableAlpha: false,
                              displayThumbColor: true,
                              showIndicator: true,
                              indicatorBorderRadius:
                                  const BorderRadius.vertical(
                                top: Radius.circular(25),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(currentColor),
                  ),
                  child: Text(
                    'Change Color 2',
                    style: TextStyle(
                      color: useWhiteForeground(currentColor)
                          ? const Color(0xffffffff)
                          : const Color(0xff000000),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: FilledButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    titlePadding: const EdgeInsets.symmetric(horizontal: 10.0),
                    contentPadding: const EdgeInsets.all(0),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Select a Color!'),
                        CloseButton(
                          onPressed: () => Navigator.pop(ctx),
                        )
                      ],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          child: MaterialPicker(
                            pickerColor: currentColor,
                            onColorChanged: changeColor,
                            enableLabel: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(currentColor),
                ),
                child: Text(
                  'Change Color!',
                  style: TextStyle(
                    color: useWhiteForeground(currentColor)
                        ? const Color(0xffffffff)
                        : const Color(0xff000000),
                  ),
                ),
              ),
            ),
            Center(
              child: FilledButton(
                onPressed: () => showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Select a Color!'),
                        CloseButton(
                          onPressed: () => Navigator.pop(ctx),
                        )
                      ],
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SingleChildScrollView(
                          child: BlockPicker(
                            pickerColor: currentColor,
                            onColorChanged: changeColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(currentColor),
                ),
                child: Text(
                  'Change Color!',
                  style: TextStyle(
                    color: useWhiteForeground(currentColor)
                        ? const Color(0xffffffff)
                        : const Color(0xff000000),
                  ),
                ),
              ),
            ),
          ],
        ),
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
      bottom: const TabBar(
        indicatorColor: Colors.black,
        dividerColor: Colors.black,
        labelColor: Colors.black,
        tabs: [
          Tab(
            text: 'HSV',
          ),
          Tab(text: 'Material'),
          Tab(text: 'Block'),
        ],
      ),
      centerTitle: true,
    );
  }
}
