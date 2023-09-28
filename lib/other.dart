import 'package:flutter/material.dart';

class other extends StatefulWidget {
  final int juu;

  other(this.juu);

  @override
  State<other> createState() => _otherState();
}

class _otherState extends State<other> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:   Container(
          height: 100,width: 100,
          color: Colors.red,
          child: Text(widget.juu.toString(),style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
