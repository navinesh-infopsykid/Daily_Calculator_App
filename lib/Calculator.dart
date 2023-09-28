import 'package:calculator/SimpleInterest.dart';
import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import 'BMI.dart';
import 'Gst.dart';
import 'agee.dart';
import 'calc.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
// page controller instance
  late PageController _pageController;
  int selectedIndex = 0;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfPages,
            ),
          ),
        ],
      ),
      // bottomnavigationbar that call the
      // SlidingClippedNavBar widget
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: const Color.fromARGB(255, 58, 57, 57),
        // change the page of the
        // body by click on tab
        onButtonPressed: changePage,
        // size of the icons of the tab
        iconSize: 30,
        activeColor: Colors.white,
        // color of tab otherthan
        // of selected tab
        inactiveColor: Colors.white30,
        // selected tab that point
        // the index of the tab
        selectedIndex: selectedIndex,
        // items of the navigation bar
        barItems: <BarItem>[
          BarItem(
            icon: Icons.calculate,
            title: 'Calculator',
          ),
          BarItem(
            icon: Icons.calculate,
            title: 'Age',
          ),
          BarItem(
            icon: Icons.percent,
            title: 'SI',
          ),
          BarItem(
            icon: Icons.attach_money,
            title: 'GST',
          ),
          BarItem(
            icon: Icons.man,
            title: 'BMI',
          ),
        ],
      ),
    );
  }

}

// List of pages
List<Widget> _listOfPages = [
  Calc(),
  Simpleinterest(),
  GST(),
  bmi(),
  age(),
];

