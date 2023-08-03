// import 'dart:async';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool? repeat = prefs.getBool('repeat');
  runApp(
    repeat == false || repeat == null ? const PageViewScreen() : const MyApp(),
  );
}

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Dome',
      home: Scaffold(
        body: EasySplashScreen(
          logo: Image.network(
              'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
          title: const Text(
            "Title",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.grey.shade400,
          showLoader: true,
          loadingText: const Text("Loading..."),
          navigator: const MyApp(),
          durationInSeconds: 15,
          loaderColor: Colors.blue,
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: buildAppBar(),
          body: const Text('Hello Abdullah'),
        ),
      );
}

class Data {
  final String title;
  final String description;
  final String imageUrl;
  final IconData iconData;

  Data({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.iconData,
  });
}

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController _controller = PageController(
    initialPage: 0,
  );
  int _currentIndex = 0;
  // @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(
  //     const Duration(seconds: 8),
  //     (timer) {
  //       _currentIndex < 3 ? _currentIndex++ : _currentIndex = 0;
  //       _controller.animateToPage(
  //         _currentIndex,
  //         duration: const Duration(milliseconds: 300),
  //         curve: Curves.easeIn,
  //       );
  //     },
  //   );
  // }

  List<Data> myData = [
    Data(
      title: 'Title 1',
      description: 'Lorem ipsum dolor sit amet',
      imageUrl: 'images/q1.jpg',
      iconData: Icons.add_box,
    ),
    Data(
      title: 'Title 2',
      description: 'Lorem ipsum dolor sit amet',
      imageUrl: 'images/q2.jpg',
      iconData: Icons.add_circle,
    ),
    Data(
      title: 'Title 3',
      description: 'Lorem ipsum dolor sit amet',
      imageUrl: 'images/q3.jpg',
      iconData: Icons.add_circle_outline,
    ),
    Data(
      title: 'Title 4',
      description: 'Lorem ipsum dolor sit amet',
      imageUrl: 'images/q4.jpg',
      iconData: Icons.add_comment,
    ),
  ];

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          '/a': (ctx) => const MyApp(),
          '/s': (ctx) => const MainSplashScreen(),
        },
        home: Scaffold(
          body: Stack(
            children: [
              Builder(
                builder: (ctx) => PageView(
                  controller: _controller,
                  onPageChanged: (val) => setState(() => _currentIndex = val),
                  children: [
                    ...myData.map(
                      (item) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(item.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(item.iconData, size: 130),
                            const SizedBox(height: 50),
                            Text(
                              item.title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                              ),
                            ),
                            const SizedBox(height: 50),
                            Text(
                              item.description,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: const Alignment(0, 0.7),
                child: PageViewDotIndicator(
                  currentItem: _currentIndex,
                  count: myData.length,
                  unselectedColor: Colors.white,
                  selectedColor: Colors.amber,
                  size: const Size(15, 15),
                  unselectedSize: const Size(10, 10),
                ),
              ),
              Builder(
                builder: (ctx) => Align(
                  alignment: const Alignment(0, 0.93),
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                      ),
                      onPressed: () async {
                        Navigator.of(ctx).pushReplacementNamed('/s');
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        prefs.setBool('repeat', true);
                      },
                      child: const Text(
                        'Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

AppBar buildAppBar() => AppBar(
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
