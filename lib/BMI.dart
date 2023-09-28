import 'package:flutter/material.dart';

import 'class.dart';


class bmi extends StatefulWidget {
  @override
  _bmiState createState() => _bmiState();
}


class _bmiState extends State<bmi> {
  final TextEditingController _heightCon = TextEditingController();
  final TextEditingController _weightCon = TextEditingController();

  double? _result;
  String condition = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50)
              ),
              child: Image.asset("assets/logo.png",fit: BoxFit.fill,)),
        ),
        title: Text('BMI Calculator',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(

                controller: _heightCon,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white54,
                    enabledBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    hintText: 'height in cm',
                    helperText: 'Enter your Height',
                    labelStyle: TextStyle(color: Colors.black)

                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(

                child: TextField(

                  controller: _weightCon,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white54,
                      enabledBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),

                      helperText: 'Enter your Weight ',
                      hintText: 'weight in kg',
                      labelStyle: TextStyle(color: Colors.black)

                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 60,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text(
                    "Calculate",
                    style: heading
                ),
                onPressed: calculateBMI,

              ),
            ),
            SizedBox(height: 15),

          ],
        ),
      ),
    );
  }
  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
              title: Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Your BMI is  "),
                          Text(
                            _result == null ? " " : "${_result?.toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 19.4,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(child: Text("Your condition is $condition ",maxLines: 2,style: TextStyle(fontSize: 15),)),

                        ],
                      ),
                    ],
                  ),
                ),
              )
          );
        });
  }

  void calculateBMI() {
    double height = double.parse(_heightCon.text) / 100;
    double weight = double.parse(_weightCon.text);

    double heightSquare = height * height;
    double result = weight / heightSquare;
    _result = result;
    setState(() {
      var main_result= _result?.toStringAsFixed(2);

      if(_result!<18.5){
        condition= "Underweight";
      }
      else if(_result!>=18.5 && _result!<=24.9){
        condition= "Normal";
      }
      else if(_result!>=25 && _result!<=29.9){
        condition= "Overweight";
      }
      else if(_result!>=30 && _result!<=34.9){
        condition= "Obese";
      }
      else if(_result!>=35){
        condition= "Extreme";
      }
    });
    _showSimpleDialog();
  }
}