import 'package:flutter/material.dart';

import 'class.dart';

class Simpleinterest extends StatefulWidget {
  const Simpleinterest({super.key});

  @override
  State<Simpleinterest> createState() => _SimpleinterestState();
}

class _SimpleinterestState extends State<Simpleinterest> {
  bool _isShow = false;
  late int principal,interest,years,months;
  late int amount,gst;
  late double cost;
  late double SI;
  bool incl = false;

  TextEditingController ppl = TextEditingController();
  TextEditingController irst = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController simple = TextEditingController();
  TextEditingController simplem = TextEditingController();
  TextEditingController total = TextEditingController();

  List c =[ ];
  List lis =[ ];
  int? selectedOption;
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
        backgroundColor: Colors.black,
        title: Text("Simple Interest",style: titlecol),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // Padding(
            //   padding: const EdgeInsets.only(top: 30.0,left: 300),
            //   child: FloatingActionButton(
            //     backgroundColor: Colors.black,
            //     splashColor: Colors.black,
            //     onPressed: (){
            //     setState(() {
            //       ppl.clear();
            //       total.clear();
            //       irst.clear();
            //       month.clear();
            //       year.clear();
            //       simple.clear();
            //       simplem.clear();
            //
            //     });
            //   },child: Text("Clear",style: TextStyle(color: Colors.white),),),
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Radio(value: 1, groupValue: selectedOption,
                        onChanged: (int? value) {
                          setState(() {
                            _isShow = false;
                            selectedOption = value;
                            print("Selected Option: $selectedOption");
                          });
                        },
                      ),
                      Text('Years',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 2, groupValue: selectedOption,
                        onChanged: (int? value) {
                          setState(() {
                            _isShow = true;
                            selectedOption = value;
                            print("Selected Option: $selectedOption");
                          });
                        },
                      ),
                      Text('Months',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),)
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                  Text("Principal",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
                  Container(
                      height: 40,
                      width: 130,
                      child: TextFormField(controller: ppl,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)
                            ),
                            fillColor: Colors.red
                        ),
                      )),
                ],),
                Column(children: [
                  Text("Interst",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 10,),
                  Container(
                      height: 40,
                      width: 70,

                      child: TextFormField(controller: irst,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red)
                            ),
                            fillColor: Colors.red
                        ),
                      )),
                ],),
                Visibility(
                  visible: _isShow,
                  child: Column(
                    children: [
                      Text("Months",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 10,),
                      Container(
                          height: 40,
                          width: 70,
                          child: TextFormField(controller: month,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red)
                                ),
                                fillColor: Colors.red
                            ),
                          )
                      ),
                    ],),
                ),
                Visibility(
                  visible: !_isShow,
                  child: Column(
                    children: [
                      Text("Years",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 10,),
                      Container(
                          height: 40,
                          width: 70,
                          child: TextFormField(controller: year,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red)
                                ),
                                fillColor: Colors.red
                            ),
                          )
                      ),
                    ],
                  ),
                ),

              ],
            ),
            SizedBox(height: 20,),
            Divider(thickness: 5,color: Colors.black),
            Visibility(
              visible: !_isShow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                  Text("Simple Interest for year",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                          onPressed: (){
                        setState(() {
                          principal=int.parse(ppl.text);
                          interest=int.parse(irst.text);
                          years=int.parse(year.text);
                          SI=(principal*interest*years)/100;
                          simple.text=SI.toString();

                        });

                      }, child: Text("  Calculate  ",style: TextStyle(color: Colors.white),)),
                      Container(
                          height: 40,
                          width: 150,

                          child: TextFormField(controller: simple,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red)
                                ),
                                fillColor: Colors.red
                            ),
                          )),
                    ],
                  ),

                ],),
              ),
            ),
            Visibility(
              visible: _isShow,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(

                  children: [

                  Text("SI calculated for month",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 10,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                          onPressed: (){
                        setState(() {
                          principal=int.parse(ppl.text);
                          interest=int.parse(irst.text);
                          months=int.parse(month.text);
                          SI=(principal*interest*months)/(12*100);
                          simplem.text=SI.toString();
                        });
                      }, child: Text("  Calculate  ",style: TextStyle(color: Colors.white),)),
                      Container(
                          height: 40,
                          width: 150,
                          child: TextFormField(controller: simplem,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.red)
                                ),
                                fillColor: Colors.red
                            ),
                          )),
                    ],
                  ),

                ],),
              ),
            ),
            Divider(thickness: 5,color: Colors.black,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("Total ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                        onPressed: (){
                      setState(() {
                        var tot=SI+principal;
                        total.text=tot.toString();

                      });

                    }, child: Text("Total Amount",style: TextStyle(color: Colors.white),)),
                    Container(
                        height: 40,
                        width: 150,

                        child: TextFormField(controller: total,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.red)
                              ),
                              fillColor: Colors.red
                          ),
                        )),

                  ],),
                ],
              ),
            ),
            Divider(thickness: 5,color: Colors.black),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: (){
                    setState(() {
                      ppl.clear();
                            total.clear();
                            irst.clear();
                            month.clear();
                            year.clear();
                            simple.clear();
                            simplem.clear();

                    });

                  }, child: Text("Clear",style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
