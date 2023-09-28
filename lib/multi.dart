import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'BMI.dart';
import 'Gst.dart';
import 'SimpleInterest.dart';
import 'agee.dart';
import 'calc.dart';

class allcalc extends StatefulWidget {
  const allcalc({super.key});

  @override
  State<allcalc> createState() => _allcalcState();
}

class _allcalcState extends State<allcalc> {


  int selectedIndex = 0;
  @override


  void changePage(int index) {
    setState(() {
      selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _listOfPages.elementAt(selectedIndex),
      ),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: PageView(
      //         physics: const NeverScrollableScrollPhysics(),
      //         controller: _pageController,
      //         children: _listOfPages,
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical:18 ),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            gap: 0,
            onTabChange: changePage,
            padding: EdgeInsets.all(10),
            tabBackgroundColor: Colors.grey.shade700,
            tabs: const [
              GButton(
                icon: Icons.calculate,
                text: "  Calculator",
              ),
              GButton(
                icon: Icons.man,
                text: " BMI",
              ),
              GButton(
                icon: Icons.monetization_on_outlined,
                text: " GST",
              ),
              GButton(
                icon: Icons.percent,
                text: " SimpleInt",
              ),


          ],),
        ),
      ),
    );
  }
}
List<Widget> _listOfPages = [
  Calc(),
  bmi(),
  GST(),
  Simpleinterest(),


];
