import 'package:carousel_slider/carousel_slider.dart';
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
  int _currentIndex = 0;
  List imgList = [
    'images/s1.jpg',
    'images/s2.jpg',
    'images/s3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          const Text(
            'Hello in The Test Slider Images',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          buildCarouseSliderHorzontal(),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIndexImages(0),
              buildIndexImages(1),
              buildIndexImages(2),
            ],
          ),
          const SizedBox(height: 30),
          buildCarouseSliderVertical(),
        ],
      ),
    );
  }

  CarouselSlider buildCarouseSliderVertical() {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (_, index, realIndex) => Container(
          width: double.infinity,
          child: Image.asset(
            imgList[index],
            fit: BoxFit.fill,
          )),
      options: CarouselOptions(
        height: 186,
        initialPage: 1,
        // autoPlay: true,
        enlargeCenterPage: true,
        scrollDirection: Axis.vertical,
        autoPlayInterval: const Duration(seconds: 3),
      ),
    );
  }

  CarouselSlider buildCarouseSliderHorzontal() {
    return CarouselSlider(
      items: imgList
          .map((itemImages) => Container(
              width: double.infinity,
              child: Image.asset(
                itemImages,
                fit: BoxFit.fill,
              )))
          .toList(),
      options: CarouselOptions(
        height: 186,
        initialPage: 0,
        autoPlay: true,
        onPageChanged: (index, _) => setState(() => _currentIndex = index),
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
        // autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: false,
        // viewportFraction: 1,
      ),
    );
  }

  Container buildIndexImages(index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.amber : Colors.white,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }
}
