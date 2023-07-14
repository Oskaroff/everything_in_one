import 'package:everything_in_one/pages/first_page.dart';
import 'package:everything_in_one/pages/second_page.dart';
import 'package:everything_in_one/pages/third_page.dart';
import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int currentIndex = 0;

  List<Widget> pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
  ];

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: pages[currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.group), label: "Warriors"),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_2), label: "Second page"),
          BottomNavigationBarItem(
              icon: Icon(Icons.filter_3), label: "Third page"),
        ],
        onTap: onTap,
        currentIndex: currentIndex,
      ),
    );
  }
}
